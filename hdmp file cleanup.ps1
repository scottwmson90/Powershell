


get-childitem "C:\Users\%userprofile%\AppData\Local\Microsoft\Windows\WER\ReportQueue\*" -include "*.hdmp" -force -recurse |
where-object { (-not $_.PSIsContainer) -and ($_.LastWriteTime -lt (get-date).AddDays(-2)) } |
remove-item -whatif