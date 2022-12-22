# Software Installation Steps

## Windows
- Open the PowerShell as administrator 
- Run the Following command:

  ```
  Invoke-WebRequest -Uri https://raw.githubusercontent.com/tinitiate/powershell/main/Installs.ps1 -OutFile .\install.ps1; .\install.ps1
  ```


## MAC
- Open the Terminal.
- Run the Following command:

  ```
  curl --remote-name https://raw.githubusercontent.com/tinitiate/powershell/main/script.sh
  ```
- Run the Following Command:

  ```
  chmod 755 /Users/{username}/script.sh
  ```
  - Replace {username} with your Mac UserName.
  
- Run the Following Command:
  
  ```
  ./script.sh
  ```
