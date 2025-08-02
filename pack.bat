@echo off
IF NOT EXIST 7z.exe GOTO NO7Z
IF NOT EXIST "Twitch Drops Miner Unrestricted" mkdir "Twitch Drops Miner Unrestricted First"
rem Prepare files
copy /y /v dist\*.exe "Twitch Drops Miner Unrestricted First"
copy /y /v manual.txt "Twitch Drops Miner Unrestricted First"
IF EXIST "Twitch Drops Miner Unrestricted First.zip" (
    rem Add action
    set action=a
) ELSE (
    rem Update action
    set action=u
)
rem Pack and test
7z %action% "Twitch Drops Miner Unrestricted First.zip" "Twitch Drops Miner Unrestricted First/" -r
7z t "Twitch Drops Miner Unrestricted First.zip" * -r
rem Cleanup
IF EXIST "Twitch Drops Miner Unrestricted First" rmdir /s /q "Twitch Drops Miner Unrestricted First"
GOTO EXIT
:NO7Z
echo No 7z.exe detected, skipping packaging!
GOTO EXIT
:EXIT
exit %errorlevel%
