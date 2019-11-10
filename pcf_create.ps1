param (
    [string]$solutionName = $(Read-Host "Solution Name"),
    [string]$namespace = $(Read-Host "Namespace"),
    [string]$publisher = $(Read-Host "Publisher"),
    [string]$prefix = $(Read-Host "Prefix"),
    [string[]] $components
)

$env:Path += ";C:\Program Files\nodejs\"

pac install latest
New-Item $solutionName -ItemType "directory"
Set-Location $solutionName
pac solution init --publisher-name $publisher --publisher-prefix $prefix

if ($components.Count -eq 0) 
{
    $components = @($solutionName + "Component");
}

New-Item Components -ItemType "directory"
foreach ($component in $components)
{
  Set-Location Components
  New-Item $component -ItemType "directory"
  Set-Location $component
  pac pcf init --namespace $namespace --name $component --template field
  npm install
  Set-Location ../..
  pac solution add-reference --path Components/$component
}

$VSPath = Invoke-Expression -Command "cmd /c 'where /R ""%PROGRAMFILES(x86)%"" MSBuild.exe'" | Select-Object -First 1
Invoke-Expression -Command "cmd /c ""$VSPath"" /t:build /restore"