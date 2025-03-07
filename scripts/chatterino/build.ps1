param (
    [string] $QtVersion = "6.9.0",
    [string] $QtPath = "F:\Qt",
    [string] $InstallDir = "F:\Chatterino7",
    [switch] $NoInstall,
    [switch] $NoClean
)

$ErrorActionPreference = "Stop";
function RequireOk {
    if (-not $?) {
        Pop-Location
        throw "Non-Zero exit code";
    }
}

if ($null -eq $ENV:VSINSTALLDIR) {
    Write-Output "Setting VS env";
    & vcvars.ps1;
    RequireOk;
}

git pull --ff-only;
RequireOk;
git submodule update --init --recursive;
RequireOk;

if (-not $NoClean) {
    Remove-Item -Recurse -Force build;
    mkdir build;
}
Push-Location build;

conan install .. `
    --output-folder=. `
    -b missing `
    -c tools.cmake.cmaketoolchain:generator=Ninja `
    -s build_type=RelWithDebInfo;
RequireOk;

cmake .. `
    -G Ninja `
    -DCMAKE_BUILD_TYPE=RelWithDebInfo `
    -DCMAKE_C_COMPILER=clang-cl `
    -DCMAKE_CXX_COMPILER=clang-cl `
    -DCMAKE_COLOR_DIAGNOSTICS=On `
    -DCMAKE_PREFIX_PATH="$QtPath\$QtVersion\msvc2022_64" `
    -DCMAKE_TOOLCHAIN_FILE="conan_toolchain.cmake" `
    -DBUILD_WITH_CRASHPAD=On `
    -DCHATTERINO_PLUGINS=On `
    -DUSE_PRECOMPILED_HEADERS=On `
    -DCHATTERINO_USE_GDI_FONTENGINE=Off `
    -DCHATTERINO_LTO=On;
RequireOk;

ninja;
RequireOk;

if (-not $NoInstall) {
    $running = Get-Process -Name "chatterino" -ErrorAction SilentlyContinue;
    if ($running) {
        Stop-Process $running.Id;
    }

    # XXX: wait for chatterino to be fully closed
    for ($i = 0; $i -lt 5; $i++) {
        cmake --install . --prefix "$InstallDir";
        if ($?) {
            break;
        }
    }
    RequireOk;
    Copy-Item -Force bin/chatterino.pdb "$InstallDir\.";

    if ($running) {
        Start-Process "$InstallDir\chatterino.exe";
    }
}

Pop-Location;
