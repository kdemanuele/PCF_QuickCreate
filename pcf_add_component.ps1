param (
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [string] $ComponentName = $(Read-Host "ComponentName"),
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [string[]] $Extensions
)

$env:Path += ";C:\Program Files\nodejs\"

$BaseFile = Invoke-Expression -Command "cmd /c ""where /R Components ControlManifest.Input.xml""" | Select-Object -First 1 
$Namespace = Select-String -Path $BaseFile -Pattern '\bnamespace="[^"]*\b' -AllMatches  | ForEach-Object { $_.Matches } | ForEach-Object { $_.Value.Split('"')[1] }

Set-Location Components
New-Item $ComponentName -ItemType "directory"
Set-Location $ComponentName

pac pcf init --namespace $Namespace --name $ComponentName --template field
npm install --save-prod $Extensions.Split(",")
npm install
Set-Location ../..
pac solution add-reference --path Components/$ComponentName

$VSPath = Invoke-Expression -Command "cmd /c 'where /R ""%PROGRAMFILES(x86)%"" MSBuild.exe'" | Select-Object -First 1
Invoke-Expression -Command "cmd /c ""$VSPath"" /t:build /restore"