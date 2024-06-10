#Copy CSV file
Copy-Item -Path "\\servername\folder\.csv" -Destination "C:\temp\"

#Import the csv file
$list = Import-Csv -Path C:\temp\disabledusers.csv 

#Assuming you have headers in your csv with one being names for the samaccount name.
#We can iterate through them using a Foreach loop.
    Foreach($name in $list.SamAccountName)
	{
    Get-CimInstance -ClassName Win32_UserProfile | Where-Object { $_.LocalPath.split('\')[-1] -eq $name } | Remove-CimInstance
	}
