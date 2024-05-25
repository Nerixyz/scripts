param (
    [string] $QtVersion = "6.7.1",
    [string] $QtPath = "G:\QT",
    [string] $InstallDir = "D:\Chatterino7",
    [switch] $NoInstall
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

Remove-Item -Recurse -Force build;
mkdir build;
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
    -DCMAKE_PREFIX_PATH="$QtPath\$QtVersion\msvc2019_64" `
    -DCMAKE_TOOLCHAIN_FILE="conan_toolchain.cmake" `
    -DBUILD_WITH_CRASHPAD=On `
    -DCHATTERINO_PLUGINS=On `
    -DUSE_PRECOMPILED_HEADERS=On `
    -DCHATTERINO_LTO=On;
RequireOk;

ninja -j6;
RequireOk;

ninja -j6 chatterino-crash-handler; # might be built by default
RequireOk;

if (-not $NoInstall) {
    $running = Get-Process -Name "chatterino" -ErrorAction Continue;
    if ($running) {
        Stop-Process $running.Id;
    }

    cmake --install . --prefix "$InstallDir";
    RequireOk;
    Copy-Item -Force bin/chatterino.pdb "$InstallDir\.";

    if ($running) {
        Start-Process "$InstallDir\chatterino.exe";
    }
}

Pop-Location;
