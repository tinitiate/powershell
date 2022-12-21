$checkchoco = powershell choco -v
if(-not($checkchoco)){
    Write-Output "Seems Chocolatey is not installed, installing now"
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
else{
    Write-Output "Chocolatey Version $checkchoco is already installed"
}

$checkpython= powershell python --version

if(-not($checkpython)){
    Write-Output "Seems Python is not installed, installing now"
    powershell choco install python
}
else{
    Write-Output "Python Version $checkpython is already installed"
}

$checkawscli = powershell aws --version
if(-not($checkawscli)){
    Write-Output "Seems AWS CLI is not installed, installing now"
    powershell choco install awscli -y
}
else{
    Write-Output "AWS CLI Version $checkawscli is already installed"
}

$checksamcli = powershell sam --version
if(-not($checksamcli)){
    Write-Output "Seems SAM CLI is not installed, installing now"
    powershell choco install awssamcli --version=1.24.1 -y
}
else{
    Write-Output "SAM CLI Version $checksamcli is already installed"
}

# $checkssm = powershell session-manager-plugin
# if(-not($checkssm)){
    # Write-Output "Seems AWS SSM is not installed, installing now"
    # powershell choco install awscli-session-manager -y
# }
# else{
    # Write-Output "AWS SSM Version $checkssm is already installed"
# }

$check = ((gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -Match "DBeaver").Length -gt 0
if(-not($check)){
    Write-Output "Seems AWS SSM is not installed, installing now"
    powershell choco install dbeaver -y
}
else{
    Write-Output "dbeaver is already installed"
}

$check = ((gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -Match "Microsoft Visual Studio Code").Length -gt 0
if(-not($check)){
    Write-Output "Seems AWS Visual Studio Code is not installed, installing now"
    powershell choco install vscode -y
}
else{
    Write-Output "Visual Studio Code is already installed"
}


$check = powershell pip --version
if(-not($check)){
    Write-Output "Seems pip is not installed, installing now"
    powershell choco install pip -y

}
else{
    Write-Output "pip is already installed"
}

$checkpip = powershell pip --version
if($checkpip){
    Write-Output "Seems pip is installed, installing packages now"

  
    powershell pip install PyMySQL 
    powershell pip install django 
    powershell pip install djangorestframework
    powershell pip install pytz 
    powershell pip install psycopg2



}
else{
    Write-Output "Pip is not installed"
}

$checknotepad = powershell ($chocoPackages -like 'notepadplusplus*').Count -ge 1
if(-not($checknotepad)){
    Write-Output "Seems notepad++ is not installed, installing now"

    choco install notepadplusplus



}
else{
    Write-Output "notepad++ is already installed"
}

# $checkdocker = ((gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -Match "Docker").Length -gt 0
# if(-not($checkdocker)){
    # Write-Output "Seems Docker is not installed, installing now"
    # powershell choco install Docker -y
# }
# else{
    # Write-Output "Docker is already installed"
# }

# if($checkdocker){
    # Write-Output "Seems Docker is installed, Enabling feature(s)"
    # dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    # dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    # choco install wsl2 -y

# }
# else{
    # Write-Output "Docker is already installed"
# }


# $checkwsl = ((gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -Match "Windows Subsystem for Linux Update").Length -gt 0

# (gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -Match "WSL"

# if (-not($checkwsl)){
    # Write-Output "Seems Windows Subsystem For Linux Update is not installed, installing now"
    # powershell choco install Docker -y
# }
# else{
    # Write-Output "Seems Windows Subsystem For Linux Update"
# }