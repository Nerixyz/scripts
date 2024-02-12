function Test-CommandExists {
    param ($command)
    $oldPreference = $ErrorActionPreference;
    $ErrorActionPreference = 'stop';
  
    try {
        if (Get-Command $command) {
            return $true;
        }
    }
    catch {
        return $false;
    }
    finally {
        $ErrorActionPreference = $oldPreference;
    }
}
  
$defaultPath = "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build";
  
if (Test-CommandExists vswhere) {
    Push-Location "$(vswhere -latest -property installationPath)\VC\Auxiliary\Build";
    Write-Host "Found through vswhere";
}
elseif (Test-CommandExists Get-VSSetupInstance) {
    Push-Location "$((Get-VSSetupInstance).InstallationPath)\VC\Auxiliary\Build";
    Write-Host "Found through Get-VSSetupInstance";
}
elseif (Test-CommandExists ($defaultPath + "\vcvars64.bat")) {
    Push-Location $defaultPath;
    Write-Host "Found default community installation";
}
else {
    Write-Host "Neither vswhere.exe, Get-VSSetupInstance, or default community installation found. Consider either adding vswhere.exe to your PATH or running 'Install-Module VSSetup'.";
    exit 1;
}
  
cmd /c "vcvars64.bat&set" | ForEach-Object {
    if ($_ -match "=") {
        $v = $_.split("=", 2);
        Set-Item -Force -Path "ENV:\$($v[0])" -Value "$($v[1])";
    }
};

Pop-Location;
Write-Host "Visual Studio command prompt variables set." -ForegroundColor Yellow;
