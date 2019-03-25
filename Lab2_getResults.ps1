$file = Read-Host "Enter FirstName and Initial of Last Name  eg. PeteS"
$file = $file + "_lab2Results"

gwmi Win32_UserAccount -ComputerName $env:computername | ?{$_.LocalAccount}  > $file

Get-WMIObject Win32_Group -filter "domain='$env:computername'" | 
select name,SID >> $file
$server="Localhost" 
$computer = [ADSI]"WinNT://$server,computer" 
 
Get-WMIObject win32_group -filter "LocalAccount='True'" -computername "Localhost" | Select PSComputername,Name,@{Name="Members";Expression={$_.GetRelated("win32_useraccount").Name -join ";"
}} >> $file

get-childitem c:\DMIT1532Lab2 -recurse | get-acl | Format-List >> $file


