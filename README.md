# PCF Quick Create Scripts #

The following scripts are provided to create PowerApps Components skeletons for a quick start. The scripts are implemented to be self-contained. In other words, there is no need of downloading the repository but only to take the file that is most useful to your use-case.

|Script |Execute Syntax |
|:------|:--------------|
| pcf_create.ps1 | **Creates a Plain skeleton for the project**<br/> powershell -ExecutionPolicy Unrestricted ./pcf_create.ps1 \<solution name> \<namespace> \<publisher> \<publisher prefix> [\<comma separated list of component names>] <br/> *Exmaple:* <code>powershell -ExecutionPolicy Unrestricted ./pcf_create.ps1 Clounce PcfTest Clounce cln Comp1,Comp2,Comp3</code> |
| pcf_react_create.ps1 | **Create a React skeleton with Office UI and Cross-Fetch extensions**<br/> powershell -ExecutionPolicy Unrestricted  ./pcf_react_create.ps1 \<solution name> \<namespace> \<publisher> \<publisher prefix> [\<comma separated list of component names>] <br/> *Exmaple:* <code>powershell -ExecutionPolicy Unrestricted ./pcf_react_create.ps1 Clounce PcfTest Clounce cln Comp1,Comp2,Comp3</code>
| pcf_create_with_extensions.ps1 | **Create a skeleton with the specified node modules**<br/> powershell -ExecutionPolicy Unrestricted ./pcf_create_with_extensions.ps1 \<solution name> \<namespace> \<publisher> \<publisher prefix> [\<comma separated list of component names>] <br/> *Exmaple:* <code>powershell -ExecutionPolicy Unrestricted ./pcf_react_create.ps1 Clounce PcfTest Clounce cln Comp1,Comp2,Comp3 -Extensions react,react-dom</code> |
| pcf_add_component.ps1 | **Create and add a component to the solution**<br/> powershell -ExecutionPolicy bypass pcf_add_component.ps1 -ComponentName \<name> [-Extensions \<comma separated list of component names>] <br/> *Exmaple:* <code>powershell -ExecutionPolicy bypass ../pcf_add_component.ps1 NewComponent -Extensions react,react-dom</code>|

**_Important Note:_** _Names are expected to be provided without spaces_
