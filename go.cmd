@echo off
if not exist packages md packages

for /f "delims=, tokens=1-6" %%a in (%~dp0packagelist.txt) do (
    echo Downloading %%a...
    if "%%c"==" " (
        bin\curl -# -o packages\%%b %%d
    ) else (
        bin\curl -# -o packages\%%b %%c %%d
    )
)

for /f "delims=, tokens=1-6" %%a in (%~dp0packagelist.txt) do (
    echo Installing %%a...
    if "%%f"=="MSI" (
        start /wait msiexec /passive /i "%~dp0packages\%%b"
    ) else (
        start /wait "" "%~dp0packages\%%b" %%e
    )
)

echo Updating PATH environment variable...
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path /t REG_EXPAND_SZ /d "%PATH%;%ProgramFiles%\SlikSvn\bin;%ProgramFiles%\Java\jdk1.6.0_35\bin;C:\Python27;C:\Ruby193\bin;%SystemRoot%\Microsoft.NET\Framework\v3.5" /f
