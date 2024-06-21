# Run this testing file by doing:
  # $ docker build -t docker-test --platform=windows .
  # $ docker run -it docker-test


# Use the latest Windows base image
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Install PowerShell
RUN powershell -Command Set-ExecutionPolicy Bypass -Scope Process -Force; \
    iex (New-Object System.Net.WebClient).DownloadString('https://github.com/PowerShell/PowerShell/releases/download/v7.2.1/PowerShell-7.2.1-win-x64.msi')

# Copy the PowerShell script into the container
COPY installs.ps1 C:\installs.ps1

# Run the PowerShell script
RUN powershell -File C:\installs.ps1

# Set the entry point to PowerShell
ENTRYPOINT ["powershell.exe"]
