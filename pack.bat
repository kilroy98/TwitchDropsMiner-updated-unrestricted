@echo off
IF NOT EXIST 7z.exe GOTO NO7Z
IF NOT EXIST "Twitch Drops Miner Unrestricted" mkdir "Twitch Drops Miner Unrestricted"
rem Prepare files
copy /y /v dist\*.exe "Twitch Drops Miner Unrestricted"
copy /y /v manual.txt "Twitch Drops Miner Unrestricted"
IF EXIST "Twitch Drops Miner Unrestricted.zip" (
    rem Add action
    set action=a
) ELSE (
    rem Update action
    set action=u
)
rem Pack and test
7z %action% "Twitch Drops Miner Unrestricted.zip" "Twitch Drops Miner Unrestricted/" -r
7z t "Twitch Drops Miner Unrestricted.zip" * -r
rem Cleanup
IF EXIST "Twitch Drops Miner Unrestricted" rmdir /s /q "Twitch Drops Miner Unrestricted"
GOTO EXIT
:NO7Z
echo No 7z.exe detected, skipping packaging!
GOTO EXIT
:EXIT
exit %errorlevel%
