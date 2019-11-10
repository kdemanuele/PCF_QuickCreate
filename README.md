# PCF Quick Create Scripts #

The following scripts are provided to create PowerApps Components skeletons for a quick start.

|Script |Execute Syntax |
|:------|:--------------|
| pcf_create.ps1 | powershell ./pcf_create.ps1 -ExecutionPolicy Unrestricted \<solution name> \<namespace> \<publisher> \<publisher prefix> [\<comma separated list of component names>] |
| | *Exmaple:* <code>powershell -ExecutionPolicy Unrestricted ./pcf_create.ps1 Clounce PcfTest Clounce cln Comp1,Comp2,Comp3</code> |

**_Important Note:_ Names are expected to be provided without spaces
