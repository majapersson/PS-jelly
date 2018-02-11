# PS Jelly

This is a Windows PowerShell script for installing npm packages and creating basic file structure for new projects.

>**Note:** This script requires node.js and npm, so make sure they are installed before continuing

## Getting started 

Clone the PS-Jelly folder into your preferred scripts-folder *(default for PowerShell is Documents/WindowsPowershell/Scripts)*

Run the script by executing the script file:

`PS> Powershell.exe path/to/PS-Jelly.ps1`

or create a function shortcut by adding this snippets to your PowerShell profile:

`function PS-Jelly { Powershell.exe path/to/PS-Jelly.ps1 }`

> If you do not have a PowerShell profile, create a file called `Microsoft.PowerShell_profile.ps1` in Documents/WindowsPowershell/ and paste the snippet above into this file. This will allow you to run the script by simply calling the function PS-Jelly regardless of your current directory

Running the script will guide you through these processes:
- Initializing a package.json file
- Initializing a git repository *(optional)*
- Installing chosen npm packages
- Creating file structure *(optional)*
  - public/assets/scripts
  - public/assets/styles
  - public/index.html
  - src/scripts/index.js
  - src/styles/components/components.scss *(if node-sass has been installed)*
  - src/styles/project/project.scss *(if node-sass has been installed)*
  - src/styles/main.scss *(if node-sass has been installed)*
- Creating config file for rollup *(optional)*
- Installing json package blobally and copying scripts from scripts.json to package.json *(optional)*

## Files included
- **PS-Jelly.ps1** - The actual script file
- **Jelly-header.ps1** - File for the ASCII art featured in the script
- **rollup.config.js** - Default config file for Rollup.js, configured to match the file structure created by the script
- **scripts.json** - Default build- and watch scripts for node-sass, browser-sync and rollup.js. Here you can add all your favourite npm scripts to be included in the package.json file!

## Author
- **Maja Persson**
