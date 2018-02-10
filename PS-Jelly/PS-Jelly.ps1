
function Print-Color {

Param([string] $color, [string] $output)

$previousColor = [console]::ForegroundColor

[console]::ForegroundColor = "$($color)"

Write-Output "$($output)"

[console]::ForegroundColor = $previousColor

}

function Read-Color {

Param([string] $color, [string] $output)

$previousColor = [console]::ForegroundColor

[console]::ForegroundColor = "$($color)"

$response = Read-Host "$($output) "

[console]::ForegroundColor = $previousColor

return $response

}

function Print-System {

Param([string] $string)

Print-Color -color "Yellow" -output "$($string)`n"

}

function Read-System {

Param([string] $string)

Read-Color -color "Yellow" -output "$($string)"

}

function Print-SystemLine {
    Print-System -string "`n===================="
}

Clear-Host

$hero = Get-Content $PSScriptRoot/Jelly-header.ps1

echo $hero

Print-Color -color "Cyan" -output "Made by Maja Persson"
Print-Color -color "Magenta" -output "http://github.com/majapersson`n"
Print-Color -color "Cyan" -output "Peanut Butter for Mac by Andreas Lundqvist available at"
Print-Color -color "Magenta" -output "http://github.com/momentiris`n"

Print-SystemLine
Print-System -string "Initilizing package.json file..."

npm init


if (!(Test-Path ./.git/)) {
    Print-SystemLine
    Print-Color -color "Red" -output "This directory does not seem to be a git repository."
    $gitInit = Read-System -string "Do you want to initialize it as a git repo? (Y/N)"

    if ($gitInit -like "Y") {
        git init
    }
}

if (Test-Path ./.git/) {
    
    Print-SystemLine
    $createGitIgnore = Read-System -string "Create .gitignore? (Y/N)"

    if ($createGitIgnore -like "Y") {
        Print-System -string "Creating .gitignore..."
        New-Item .gitignore
        echo node_modules >> .gitignore
        if (Test-Path ./public/) {
            echo public/assets >> .gitignore
        }
    }
}

Print-SystemLine
$packageString = Read-System -string "Print packages to install separated by spaces"

$packages = $packageString -split ' '


For($i=0; $i -lt $packages.length; $i++){
    
    Print-SystemLine
    Print-System -string "Installing $($packages[$i])"

    npm i $packages[$i]
}

Print-SystemLine
$createStructure = Read-System -string "Create public/assets and src file structure? (Y/N)"

if ($createStructure -like "Y") {

    Print-SystemLine
    Print-System -string "Creating file structure..."

    mkdir public/assets/scripts
    mkdir public/assets/styles

    mkdir src/scripts
    mkdir src/styles

    New-Item src/scripts/index.js
    New-Item src/styles/main.scss

    New-Item public/index.html

}

if($packages.Contains("rollup")) {

    Print-SystemLine
    $createRollupConfig = Read-System -string "Create rollup.config file? (Y/N)"

    if ($createRollupConfig -like "Y") {
        
        Print-System -string "Creating rollup.config.js..."
        New-Item rollup.config.js

        cat $PSScriptRoot/rollup.config.js >> ./rollup.config.js
    }
}

Print-SystemLine
$createScripts = Read-System -string "Copy scripts from scripts.json file? (Y/N)"

if ($createScripts -like "Y") {
    
    Print-System -string "Copying scripts from scripts.json to package.json..."
    $scripts = cat $PSScriptRoot/scripts.json

    json -I -f ./package.json -e "this.scripts={${scripts}}"
}