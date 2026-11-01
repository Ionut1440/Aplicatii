# Adună aplicațiile web în folderul "site" care se urcă pe GitHub Pages
$ErrorActionPreference = "Stop"
$Aici = $PSScriptRoot
$Site = Join-Path $Aici "site"
python (Join-Path $Aici "..\ZileConcediu\make_icons.py")
if (Test-Path $Site) { Remove-Item $Site -Recurse -Force }
New-Item -ItemType Directory -Force "$Site\concediu", "$Site\calendar-birou" | Out-Null
Copy-Item "$Aici\..\ZileConcediu\www\*" "$Site\concediu" -Recurse
Copy-Item "$Aici\..\CalendarBirou\mobile\www\*" "$Site\calendar-birou" -Recurse
Copy-Item "$Aici\index.html" $Site
Get-ChildItem $Site -Recurse -File | ForEach-Object { $_.FullName.Substring($Site.Length + 1) }
