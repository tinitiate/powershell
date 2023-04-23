# Check if Windows Subsystem for Linux is enabled
$wslEnabled = Get-WindowsOptionalFeature -Online | Where-Object { $_.FeatureName -eq "Microsoft-Windows-Subsystem-Linux" } | Select-Object -ExpandProperty State
if ($wslEnabled -ne 'Enabled') {
    # Enable Windows Subsystem for Linux
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    Write-Host "Windows Subsystem for Linux enabled."
} else {
    Write-Host "Windows Subsystem for Linux already enabled."
}

# Check if Virtual Machine Platform is enabled
$vmEnabled = Get-WindowsOptionalFeature -Online | Where-Object { $_.FeatureName -eq "VirtualMachinePlatform" } | Select-Object -ExpandProperty State
if ($vmEnabled -ne 'Enabled') {
    # Enable Virtual Machine Platform
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    Write-Host "Virtual Machine Platform enabled."
} else {
    Write-Host "Virtual Machine Platform already enabled."
}

# Download and install WSL2 Linux kernel update package
$wsl2Enabled = wsl --list --verbose | Select-String -Pattern "WSL 2" -SimpleMatch -Quiet
if (!$wsl2Enabled) {
    # Install the WSL2 Linux kernel update package
    Invoke-WebRequest -Uri https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -OutFile wsl_update_x64.msi
    Start-Process -FilePath msiexec.exe -ArgumentList '/i', 'wsl_update_x64.msi', '/quiet' -Wait
    Remove-Item -Path wsl_update_x64.msi
    Write-Host "WSL2 installed."
} else {
    Write-Host "WSL2 already installed."
}

# Install Docker (if not already installed)
if (!(Get-Command docker -ErrorAction SilentlyContinue)) {
    # Install Docker Desktop
    Invoke-WebRequest -Uri https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe -OutFile Docker%20Desktop%20Installer.exe
    Start-Process -FilePath Docker%20Desktop%20Installer.exe -ArgumentList '/S' -Wait
    Remove-Item -Path Docker%20Desktop%20Installer.exe
    Write-Host "Docker installed."
} else {
    Write-Host "Docker already installed."
}

# Install DBeaver
if (!(Get-Command dbeaver -ErrorAction SilentlyContinue)) {
    # Install DBeaver
    Invoke-WebRequest -Uri https://dbeaver.io/files/dbeaver-ce-latest-x86_64-setup.exe -OutFile dbeaver-ce-latest-x86_64-setup.exe
    Start-Process -FilePath dbeaver-ce-latest-x86_64-setup.exe -ArgumentList '/S' -Wait
    Remove-Item -Path dbeaver-ce-latest-x86_64-setup.exe
    Write-Host "DBeaver installed."
} else {
    Write-Host "DBeaver is already installed."
}

# Check if Git is installed (if not, install it)
if (!(Get-Command git -ErrorAction SilentlyContinue)) {
    # Install Git
    Invoke-WebRequest -Uri https://github.com/git-for-windows/git/releases/download/v2.31.1.windows.1/Git-2.31.1-64-bit.exe -OutFile Git-2.31.1-64-bit.exe
    Start-Process -FilePath Git-2.31.1-64-bit.exe -ArgumentList '/SILENT' -Wait
    Remove-Item -Path Git-2.31.1-64-bit.exe
    Write-Host "Git installed."
} else {
    Write-Host "Git is already installed."
}
