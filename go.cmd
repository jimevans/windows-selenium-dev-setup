@setlocal
@echo off
if not exist packages md packages

for /f "delims=, tokens=1-7" %%a in (%~dp0packagelist.txt) do (
    echo Downloading %%a...
    if "%%c"==" " (
        bin\curl -# -o packages\%%b %%d
    ) else (
        bin\curl -# -o packages\%%b %%c %%d
    )
)

setlocal EnableDelayedExpansion
for /f "delims=, tokens=1-7" %%a in (%~dp0packagelist.txt) do (
    echo Installing %%a...
    if "%%g"=="MSI" (
        start /wait msiexec /passive /i "%~dp0packages\%%b"
    ) else (
        start /wait "" "%~dp0packages\%%b" %%e
    )
    if not "%%f"==" " (
        if not "PATHADDITION"=="" set PATHADDITION=!PATHADDITION!;
        set PATHADDITION=!PATHADDITION!%%f
    )
)

echo Updating PATH environment variable...
REG ADD "HKCU\Environment" /v Path /t REG_EXPAND_SZ /d "%PATHADDITION%" /f
endlocal
