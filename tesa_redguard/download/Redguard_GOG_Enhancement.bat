:: Script by Solitaan May 1, 2023. Original posters: OCD_Monkey, krashd, felekks: https://www.gog.com/forum/elder_scrolls_series/how_to_fix_redguard?pp=b3f0c7f6bb763af1be91d9e74eabfeb199dc1f1f
:: Execute from inside the top-level "Redguard" folder of your GOG installation. There should be a second "Redguard" folder inside this folder.

if NOT "%cd:~-8%"=="Redguard" exit
if NOT exist Redguard exit

powershell -Command "(New-Object Net.WebClient).DownloadFile('http://dege.freeweb.hu/dgVoodoo2/bin/dgVoodoo2_8_1.zip', 'dgVoodoo2_8_1.zip')"
powershell -Command Expand-Archive -Force dgVoodoo2_8_1.zip dgVoodoo2_8_1
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://www.vogons.org/download/file.php?id=12299', 'DOSBox-G-1.zip')"
powershell -Command Expand-Archive -Force DOSBox-G-1.zip DOSBox-G-1

xcopy /s DOSBOX\* GOG_Enhancement.bak\DOSBOX\*
move dosbox_redguard.conf GOG_Enhancement.bak\dosbox_redguard.conf
xcopy /s Redguard\SYSTEM.INI GOG_Enhancement.bak\Redguard\SYSTEM.INI*

xcopy /s DOSBox-G-1\DOSBox\* DOSBOX /Y
del DOSBOX\dosbox.exe
move DOSBOX\dosbox-g.exe DOSBOX\dosbox.exe

xcopy /s dgVoodoo2_8_1\3Dfx\x86\Glide2x.dll DOSBOX\Glide2x.dll* /Y
xcopy /s dgVoodoo2_8_1\3Dfx\x86\Glide2x.dll Redguard\glide2x.dll* /Y
xcopy /s dgVoodoo2_8_1\dgVoodoo.conf DOSBOX\dgVoodoo.conf* /Y

xcopy /s DOSBox-G-1\DOSBox\dosbox.conf dosbox_redguard.conf /Y
powershell -Command "(gc dosbox_redguard.conf) -replace 'windowresolution=original', 'windowresolution=1024x768' | Out-File -encoding ASCII dosbox_redguard.conf"
powershell -Command "(gc dosbox_redguard.conf) -replace 'vmemsize=2', 'vmemsize=8' | Out-File -encoding ASCII dosbox_redguard.conf"
powershell -Command "(gc dosbox_redguard.conf) -replace 'memsize=31', 'memsize=63' | Out-File -encoding ASCII dosbox_redguard.conf"
powershell -Command "(gc dosbox_redguard.conf) -replace 'aspect=false', 'aspect=true' | Out-File -encoding ASCII dosbox_redguard.conf"
powershell -Command "(gc dosbox_redguard.conf) -replace 'cycles=auto', 'cycles=150000' | Out-File -encoding ASCII dosbox_redguard.conf"
powershell -Command "(gc dosbox_redguard.conf) -replace 'timed=true', 'timed=false' | Out-File -encoding ASCII dosbox_redguard.conf"
powershell -Command "(gc dosbox_redguard.conf) -replace 'vmemsize=2', 'vmemsize=8' | Out-File -encoding ASCII dosbox_redguard.conf"
powershell -Command "(gc dosbox_redguard.conf) -replace 'glide=emu', 'glide=true' | Out-File -encoding ASCII dosbox_redguard.conf"

powershell -Command "(gc DOSBOX\dgVoodoo.conf) -replace 'FullScreenMode                       = true', 'FullScreenMode                       = false' | Out-File -encoding ASCII DOSBOX\dgVoodoo.conf"
powershell -Command "(gc DOSBOX\dgVoodoo.conf) -replace 'VideoCard                           = voodoo_2', 'VideoCard                           = voodoo_banshee' | Out-File -encoding ASCII DOSBOX\dgVoodoo.conf"
powershell -Command "(gc DOSBOX\dgVoodoo.conf) -replace 'OnboardRAM                          = 8', 'OnboardRAM                          = 16' | Out-File -encoding ASCII DOSBOX\dgVoodoo.conf"
powershell -Command "(gc DOSBOX\dgVoodoo.conf) -replace 'Resolution                          = unforced', 'Resolution                          = 1024x768@60' | Out-File -encoding ASCII DOSBOX\dgVoodoo.conf"
powershell -Command "(gc DOSBOX\dgVoodoo.conf) -replace 'ForceVerticalSync                   = true', 'ForceVerticalSync                   = false' | Out-File -encoding ASCII DOSBOX\dgVoodoo.conf"
powershell -Command "(gc DOSBOX\dgVoodoo.conf) -replace 'ForceEmulatingTruePCIAccess         = false', 'ForceEmulatingTruePCIAccess         = true' | Out-File -encoding ASCII DOSBOX\dgVoodoo.conf"
powershell -Command "(gc DOSBOX\dgVoodoo.conf) -replace '3DfxWatermark                       = true', '3DfxWatermark                       = false' | Out-File -encoding ASCII DOSBOX\dgVoodoo.conf"

echo --------TESA: Redguard GOG installation has been updated--------
timeout /t 5