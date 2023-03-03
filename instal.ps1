# Check if Chocolatey is installed, and install it if it's not.
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey not found. Installing Chocolatey..." -ForegroundColor Yellow
    Set-ExecutionPolicy Bypass -Scope Process -Force
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Install or upgrade packages as needed.
$packages = "python", "awscli", "aws-sam-cli", "dbeaver", "visualstudiocode", "notepadplusplus", "git"
foreach ($package in $packages) {
    if (!(Get-Command $package -ErrorAction SilentlyContinue)) {
        Write-Host "$package not found. Installing $package..." -ForegroundColor Yellow
        choco install $package -y
    } else {
        $version = (choco list --local-only $package --exact --limit-output --version-sort | select -Last 1).Version
        $latest = (choco search $package --exact --prerelease --limit-output --version-sort | select -Last 1).Version
        if ($version -lt $latest) {
            Write-Host "$package found, but outdated. Upgrading to $latest..." -ForegroundColor Yellow
            choco upgrade $package -y
        }
    }
}

# Install Python packages using pip.
if (!(Get-Command pip -ErrorAction SilentlyContinue)) {
    Write-Host "pip not found. Installing pip..." -ForegroundColor Yellow
    choco install python -y
    Write-Host "Please close and reopen the PowerShell session to continue." -ForegroundColor Yellow
    return
} else {
    $packages = "numpy", "pandas", "matplotlib","PyMYSQL","django","djangorestframework","pytz","psycopg2","boto3"
    foreach ($package in $packages) {
        if (!(pip freeze | Select-String -Pattern $package)) {
            Write-Host "$package not found. Installing $package..." -ForegroundColor Yellow
            pip install $package
        }
    }
}

# Enable Windows Subsystem for Linux.
Write-Host "Enabling Windows Subsystem for Linux..." -ForegroundColor Yellow
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# Install and enable WSL 2.
Write-Host "Installing and enabling WSL 2..." -ForegroundColor Yellow
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
$wsl = wsl --list --verbose | Select-String "Ubuntu"
if ($wsl -eq $null) {
    wsl --install
} else {
    wsl --set-version Ubuntu 2
}

# Install Docker Desktop.
if (!(Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "Docker not found. Installing Docker Desktop..." -ForegroundColor Yellow
    choco install docker-desktop -y
}
