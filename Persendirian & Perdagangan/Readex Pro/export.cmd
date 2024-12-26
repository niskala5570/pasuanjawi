@echo off
:: Laluan file dalam folder
set "source_folder=sfd\"
set "woff2_folder=woff2\"
set "ttf_folder=ttf\"

:: Buat folder kalau takde
if not exist "%woff2_folder%" mkdir "%woff2_folder%"
if not exist "%ttf_folder%" mkdir "%ttf_folder%"

:: Ulang baca kesemua .sfd
for %%F in ("%source_folder%\*.sfd") do (
    echo Processing %%F...

    :: Export to WOFF2
    fontforge -lang=ff -c "Open('%%F'); Generate('%woff2_folder%\\%%~nF.woff2');"

    :: Export to TTF
    fontforge -lang=ff -c "Open('%%F'); Generate('%ttf_folder%\\%%~nF.ttf');"
)

echo Siap diproses.
pause
