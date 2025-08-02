@echo off
IF NOT EXIST 7z.exe GOTO NO7Z
IF NOT EXIST "Twitch Drops Miner Unrestricted Second" mkdir "Twitch Drops Miner Unrestricted Second"
rem Prepare files
copy /y /v dist\*.exe "Twitch Drops Miner Unrestricted Second"
copy /y /v manual.txt "Twitch Drops Miner Unrestricted Second"
IF EXIST "Twitch Drops Miner Unrestricted Second.zip" (
    rem Add action
    set action=a
) ELSE (
    rem Update action
    set action=u
)
rem Pack and test
7z %action% "Twitch Drops Miner Unrestricted Second.zip" "Twitch Drops Miner Unrestricted Second/" -r
7z t "Twitch Drops Miner Unrestricted Second.zip" * -r
rem Cleanup
IF EXIST "Twitch Drops Miner Unrestricted Second" rmdir /s /q "Twitch Drops Miner Unrestricted Second"
GOTO EXIT
:NO7Z
echo No 7z.exe detected, skipping packaging!
GOTO EXIT
:EXIT
exit %errorlevel%
