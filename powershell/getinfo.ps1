import-module activedirectory

Write-Output "`n--------------------SYSTEM INFORMATION----------------------------`n" >> report.txt
systeminfo | Where-Object { $_ -NotMatch "System Model*" -and $_ -NotMatch "S Version*"} >> report.txt


Write-Output "`n---------------------NAME and DOMAIN------------------------------`n" >> report.txt
gwmi -Class Win32_ComputerSystem | select name, domain >> report.txt


Write-Output "`n----------------------CURRENT USER--------------------------------`n" >> report.txt
query user /server:$SERVER >> report.txt

Write-Output "`n----------------------USER INFO-----------------------------------`n" >> report.txt
Get-ADUser -filter * >> report.txt

Write-Output "`n----------------------GROUP INFO-----------------------------------`n" >> report.txt
Get-ADGroup -filter * >> report.txt

Write-Output "`n---------------------SCHEDULE TASKS-------------------------------`n" >> report.txt
schtasks | Where-Object { $_ -Match "Ready*" -or $_ -Match "Running*"} >> report.txt


Write-Output "`n--------------------RUNNING SERVICES------------------------------`n" >> report.txt
Get-Service | Where-Object {$_.Status -eq "Running"} >> report.txt

Write-Output "`n---------------------RUNNING PROCESS------------------------------`n" >> report.txt
Get-Process  >> report.txt

Write-Output "`n---------------------COMMAND HISTORY-----------------------------`n" >> report.txt
Get-History >> report.txt


Write-Output "`n----------------------USB DEVICES--------------------------------`n" >> report.txt
gwmi Win32_USBControllerDevice |%{[wmi]($_.Dependent)} | Sort Manufacturer,Description,DeviceID  >> report.txt



Write-Output "`n------------------------ARP TABLE--------------------------------`n" >> report.txt
arp -a >> report.txt

Write-Output "`n-------------------------NETSTAT--------------------------------`n" >> report.txt
netstat -n >> report.txt

Write-Output "`n-------------------------DOMAIN---------------------------------`n" >> report.txt
Get-ADDomain >> report.txt

Write-Output "`n----------------------DOMAIN CONTROL----------------------------`n" >> report.txt
Get-ADDomainController >> report.txt

Write-Output "`n----------------------PROCESSOR INFO----------------------------`n" >> report.txt
get-wmiobject Win32_Processor | select name, description >> report.txt


