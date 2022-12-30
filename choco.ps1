$checkchoco = powershell choco -v
if(-not($checkchoco)){
    Write-Output "Seems Chocolatey is not installed, installing now"
    $command="((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
    iex "& $command"
}
else{
    Write-Output "Chocolatey Version $checkchoco is already installed"
}
