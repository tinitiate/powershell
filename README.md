# Software Installations
## Python AWS Course Installations 
### Windows
- Open the PowerShell as administrator 
- Run the Following command:

```ps1
iex (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/tinitiate/powershell/main/Installs.ps1" -UseBasicParsing).Content
```
### MAC
- Open the Terminal.
- Run the Following command:

  ```
  curl --remote-name https://raw.githubusercontent.com/tinitiate/powershell/main/script.sh
  ```
- Run the Following Command:

  ```
  chmod 755 /Users/`whoami`/script.sh && ./script.sh
  ```
## SQL Azure Course Installations 
### Windows
- Open the PowerShell as administrator 
- Run the Following command:
```ps1
iex (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/tinitiate/powershell/main/sql-install.ps1" -UseBasicParsing).Content
```
- Once the softwares are installed, if there are any errors don't proceed to the next step.
- Close the powershell and Reopen the powershell as administrator.
- Run the Following command:
```ps1
iex (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/tinitiate/mssql-docker/main/sql-docker-container.ps1" -UseBasicParsing).Content
```

