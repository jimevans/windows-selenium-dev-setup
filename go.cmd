@echo off
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
choco install -y git
choco install -y python2
choco install -y ruby
choco install -y jdk8
choco install -y bazel

REM .NET Framework 4.0 is a prerequisite for chocolatey,
REM so is unneeded as a separate install.
REM choco install -y dotnet4.0

if [%1]==[addvs] choco install -y visualstudio2019community --package-parameters "--add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.VisualStudio.Workload.NetCoreTools"
