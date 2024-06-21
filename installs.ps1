# Check if Chocolatey is installed
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Output "Chocolatey is not installed. Installing Chocolatey..."
    
    # Install Chocolatey
    Set-ExecutionPolicy Bypass -Scope Process -Force; `
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    
    Write-Output "Chocolatey installed successfully."
} else {
    Write-Output "Chocolatey is already installed."
}

# List of applications to install
$apps = @(
    'googlechrome',
    'discord',
    '7zip',
    'git',
    'visualstudiocode',
    'nodejs',
    'docker-desktop',
    'steam',
    'nvm',
    'blender',
    'krita',
    'postgresql',
    'dotnet',
    'unity-hub',
    'minecraft-launcher',
    'ea-app',
    'androidstudio',
    'sidequest',
    'msys2',
    'javaruntime',
    'arduino',
    'gnupg'
)

# Install each application
foreach ($app in $apps) {
    Write-Output "Installing $app..."
    choco install $app -y
    Write-Output "$app installed successfully."
}

Write-Output "Installing NVM..."
nvm install latest
nvm use latest

Write-Output "Installing Railway CLI..."
npm i -g @railway/cli

Write-Output "Installing Oh-My-Zsh..."
pacman -Syu
pacman -Sy git curl zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Add zsh execution to ~/.bash_profile
$bashProfilePath = "$HOME\.bash_profile"
if (-not (Test-Path $bashProfilePath)) {
    New-Item -ItemType File -Path $bashProfilePath
}
Add-Content -Path $bashProfilePath -Value @'
if [ -t 1 ]; then
    exec zsh
fi
'@

# Update VS Code settings
$vscodeSettingsPath = "$HOME\AppData\Roaming\Code\User\settings.json"
if (-not (Test-Path $vscodeSettingsPath)) {
    New-Item -ItemType File -Path $vscodeSettingsPath -Force
}
$vscodeSettings = Get-Content -Path $vscodeSettingsPath -Raw | ConvertFrom-Json
$vscodeSettings."terminal.integrated.defaultProfile.windows" = "Git Bash"
$vscodeSettings."terminal.integrated.profiles.windows" = @{
    "Git Bash" = @{
        "source" = "Git Bash"
    }
}
$vscodeSettings | ConvertTo-Json -Depth 100 | Set-Content -Path $vscodeSettingsPath

Write-Output "All applications installed successfully."
