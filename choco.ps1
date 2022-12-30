$check=((gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -Match "chocolatey").Length -gt 0
if(-not($checkchoco)){
    Write-Output "Seems Chocolatey is not installed, installing now"
    $command="((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
    iex "& $command"
}
else{
    Write-Output "Chocolatey Version $checkchoco is already installed"
}
