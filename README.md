# PS Jelly

This is a Windows PowerShell script for installing npm packages and creating basic file structure for new projects.

## Getting started

Clone this repo into your preferred scripts-folder *(maybe Documents/WindowsPowershell/Scripts?)*

Run the script by executing the script file, or create a function shortcut by adding this snippets to your PowerShell profile:

`function PS-Jelly { Powershell.exe path/to/PS-Jelly.ps1 }`

Running the script will guide you through these processes:
- Initializing a package.json file
- Initializing a git repository *(optional)*
- Installing chosen npm packages
- Creating file structure *(optional)*
  - public/assets/scripts
  - public/assets/styles
  - public/index.html
  - src/scripts/index.js
  - src/styles/main.scss
- Creating config file for rollup *(optional)*
- Copying scripts from scripts.json to package.json *(optional)*

## Files included
- **PS-Jelly.ps1** - The actual script file
- **Jelly-header.ps1** - File for the ASCII art featured in the script
- **rollup.config.js** - Default config file for Rollup.js, configured to match the file structure created by the script
- **scripts.json** - Default build- and watch scripts for node-sass, browser-sync and rollup.js. Here you can add all your favourite npm scripts to be included in the package.json file!
