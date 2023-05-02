:: Script by Solitaan 2023.
:: Execute from inside the "The Elder Scrolls Adventures Redguard" folder of your Steam installation.

if NOT "%cd:~-37%"=="The Elder Scrolls Adventures Redguard" exit
if NOT exist Redguard exit

powershell -Command "(gc DOSBox-0.73\rg.conf) -replace 'cycles=max', 'cycles=150000' | Out-File -encoding ASCII DOSBox-0.73\rg.conf"

echo --------TESA: Redguard Steam installation has been updated--------
timeout /t 5