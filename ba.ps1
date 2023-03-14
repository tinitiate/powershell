# Check if Windows Subsystem for Linux is already enabled
$wsl_installed = Get-WindowsOptionalFeature -Online | Where-Object {$_.FeatureName -eq "Microsoft-Windows-Subsystem-Linux"} | Select-Object -ExpandProperty State

if ($wsl_installed -ne "Enabled") {
    # Install Windows Subsystem for Linux
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
}

# Check if WSL 2 is already installed
$wsl2_installed = Get-WindowsOptionalFeature -Online | Where-Object {$_.FeatureName -eq "VirtualMachinePlatform"} | Select-Object -ExpandProperty State

if ($wsl2_installed -ne "Enabled") {
    # Install WSL 2
    Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
    Invoke-WebRequest -Uri https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -OutFile wsl_update_x64.msi
    Start-Process msiexec.exe -Wait -ArgumentList '/I wsl_update_x64.msi /quiet /norestart'
}
else {
    # Check if WSL 2 version is up-to-date
    $wsl2_version = (wsl.exe -l -v | Where-Object {$_.Name -eq "Ubuntu"}).Version
    if ($wsl2_version -lt 2) {
        # Update to the latest version
        wsl --set-version Ubuntu 2
        Write-Host "WSL 2 version is old. Latest version is now installed."
    }
    else {
        Write-Host "WSL 2 is already installed."
    }
}

# Check if Docker Desktop is already installed
$docker_installed = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object {$_.DisplayName -eq "Docker Desktop"} | Select-Object -First 1

if (!$docker_installed) {
    # Install Docker Desktop
    Invoke-WebRequest -Uri https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe -OutFile DockerDesktopInstaller.exe
    Start-Process DockerDesktopInstaller.exe -Wait -ArgumentList '--quiet'
}
else {
    Write-Host "Docker Desktop is already installed."
}

# Check if DBeaver Community Edition is already installed
$dbeaver_installed = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object {$_.DisplayName -eq "DBeaver Community Edition"} | Select-Object -First 1

if (!$dbeaver_installed) {
    # Install DBeaver Community Edition
    Invoke-WebRequest -Uri https://dbeaver.io/files/dbeaver-ce-latest-x86_64-setup.exe
    Start-Process msiexec.exe -Wait -ArgumentList '/I dbeaver-ce-latest-x86_64.msi /quiet /norestart'
}
else {
    Write-Host "DBeaver Community Edition is already installed."
}
