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
    'firefox',
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
    'dotnet-sdk',
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

Write-Output "All applications installed successfully."
pause
