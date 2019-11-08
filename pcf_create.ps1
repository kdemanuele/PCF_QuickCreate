param (
    [string]$solutionName = $(Read-Host "Solution Name"),
    [string]$namespace = $(Read-Host "Namespace"),
    [string]$publisher = $(Read-Host "Publisher"),
    [string]$prefix = $(Read-Host "Prefix"),
    [string[]] $components
)

$env:Path += ";C:\Program Files\nodejs\"

pac install latest
mkdir $solutionName
cd $solutionName
pac solution init --publisher-name $publisher --publisher-prefix $prefix

if ($components.Count -eq 0) 
{
    $components = @($solutionName + "Component");
}

mkdir Components
cd Components
foreach ($component in $components)
{
  mkdir $component
  cd $component
  pac pcf init --namespace $namespace --name $component --template field
  npm install
  cd ../..
  pac solution add-reference --path Components/$component
}
