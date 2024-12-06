# Define paths for dotfiles repository and configuration locations
$DotfilesRepo = "C:\Users\PC\Personal\dotfiles"

# Define paths for each application's configuration files
$ConfigPaths = @{
    "nvim"         = "$env:LOCALAPPDATA\nvim"
    "powershell"   = "$env:USERPROFILE\Documents\PowerShell"
    "starship"     = "$env:USERPROFILE\.config\starship.toml"
    "vscode"       = "$env:APPDATA\Code\User\settings.json"
    "terminal"     = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
    "wezterm"      = "$env:USERPROFILE\.wezterm.lua"
}

# Function to copy configuration files or folders
function Copy-Config {
    param (
        [string]$Source,
        [string]$Destination
    )

    if (Test-Path -Path $Source) {
        if ((Get-Item -Path $Source).PSIsContainer) {
            # Source is a folder
            if (Test-Path -Path $Destination) {
                Remove-Item -Recurse -Force -Path $Destination
            }
            Copy-Item -Recurse -Force -Path $Source -Destination $Destination
        } else {
            # Source is a file
            $DestinationFile = Join-Path -Path $Destination -ChildPath (Split-Path -Leaf $Source)
            Copy-Item -Force -Path $Source -Destination $DestinationFile
        }
        Write-Host "Updated: $Destination" -ForegroundColor Green
    } else {
        Write-Host "Source not found: $Source" -ForegroundColor Red
    }
}

# Main script to update dotfiles repository
foreach ($App in $ConfigPaths.Keys) {
    $SourcePath = $ConfigPaths[$App]
    $DestinationPath = Join-Path -Path $DotfilesRepo -ChildPath $App

    # Ensure the destination directory exists
    if (-not (Test-Path -Path $DestinationPath)) {
        New-Item -ItemType Directory -Path $DestinationPath -Force | Out-Null
    }

    # Copy the configuration
    Copy-Config -Source $SourcePath -Destination $DestinationPath
}

Write-Host "Dotfiles repository update complete!" -ForegroundColor Cyan
