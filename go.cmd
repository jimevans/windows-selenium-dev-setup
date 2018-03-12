@echo off
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
choco install -y git
choco install -y python2
choco install -y ruby
choco install -y jdk8
choco install -y dotnet3.5

REM .NET Framework 4.0 is a prerequisite for chocolatey,
REM so is unneeded as a separate install.
REM choco install -y dotnet4.0

if [%1]==[addvs] choco install -y visualstudio2017community -packageParameters "--Features MDDCPlusPlus"
