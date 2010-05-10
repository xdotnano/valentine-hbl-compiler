@echo off
color 0A
if %ndowt% == 10 goto X
exit
:X
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ============================== Updating files... ==============================
echo ===============================================================================
if exist %fsdir%\hbl (
echo HBL directory detected, skipping SVN checkout, updating...
goto C
) ELSE (
echo HBL directory isn't detected, SVN checkout started
md "%fsdir%\HBL"
cd "%fsdir%"
"%fsdir%\Subversion Client\svn.exe" co http://valentine-hbl.googlecode.com/svn/trunk
xcopy trunk "%fsdir%\HBL" /y /e /h
goto D
)
:C
cd "%fsdir%/hbl"
"%fsdir%\Subversion Client\svn.exe" up
:D
cd "%fsdir%\Temporary"
xcopy "%fsdir%\hbl\eLoader" eLoader /y /e /h /i
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo =============================== Select version! ===============================
echo ===============================================================================
if %hblversion% == 1 goto Y
if %hblversion% == 2 goto Y
:Z
echo What type of HBL do you want?
echo 1: Development version (recommended)
echo 2: End user version
set /p hblversion=Please type in 1 or 2: 
if %hblversion% == 1 goto Y
if %hblversion% == 2 goto Y
cls
echo Invalid answer, please try again!
echo.
goto Z
:Y
if %hblversion% == 1 set version=make
if %hblversion% == 2 set version=make distrib
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo =============================== Compiling files ===============================
echo ===============================================================================
cd %fsdir%\HBL\eLoader
%version%
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ========== Detecting PSP and copying files if the PSP is detected... ==========
echo ===============================================================================
if %pspdrive% == pspdriveletter set /p pspdrive=Please type in your PSP's drive letter and then press enter (if your PSP isn't connected, just type in 0): 
if %pspdrive% == 0 Goto A
if exist %pspdrive%:\ (
echo PSP detected, copying files...
) ELSE (
echo PSP not detected, skipping this step...
goto A
)
cls
if exist "%pspdrive%:\PSP\SAVEDATA\UCUS98732_DATA02" (
echo The savegame exploit found on your PSP, skipping this step: copy the savegame exploit to your PSP...
) ELSE (
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ================== Downloading Patapon 2 savegame exploit... ==================
echo ===============================================================================
echo Downloading Patapon 2 savegame exploit, please wait!
cd "%fsdir%"
"%fsdir%\Subversion Client\svn.exe" co http://patapon2savegame.googlecode.com/svn/trunk
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ============== Copying Patapon 2 savegame exploit to your PSP... ==============
echo ===============================================================================
md "%pspdrive%:\PSP\SAVEDATA\UCUS98732_DATA02"
md "%fsdir%\UCUS98732_DATA02"
cd "%fsdir%\trunk"
xcopy "UCUS98732_DATA02" "%fsdir%\UCUS98732_DATA02" /y /e /h
cd "%fsdir%"
xcopy "UCUS98732_DATA02" "%pspdrive%:\PSP\SAVEDATA\UCUS98732_DATA02" /y /e /h
rmdir "trunk" /s /q
)
cls
if exist "%pspdrive%:\PSP\GAME\UCUS98734" (
echo The Patapon 2 Demo found on your PSP, skipping this step: copy the Patapon 2 Demo to your PSP...
) ELSE (
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ======================== Downloading Patapon 2 Demo... ========================
echo ===============================================================================
echo Downloading Patapon 2 Demo, please wait!
cd "%fsdir%"
"%fsdir%\Subversion Client\svn.exe" co http://patapon2demo.googlecode.com/svn/trunk
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ==================== Copying Patapon 2 Demo to your PSP... ====================
echo ===============================================================================
md "%pspdrive%:\PSP\GAME\UCUS98734"
md "%fsdir%\UCUS98734"
cd "%fsdir%\trunk"
xcopy "UCUS98734" "%fsdir%\UCUS98734" /y /e /h
cd "%fsdir%"
xcopy "UCUS98734" "%pspdrive%:\PSP\GAME\UCUS98734" /y /e /h
cd "%fsdir%"
rmdir "trunk" /s /q
)
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo =========================== Copying HBL to your PSP ===========================
echo ===============================================================================
cd "%fsdir%\hbl\eLoader"
xcopy config %pspdrive%:\HBL\config /y /e /i
XCOPY libs_6xx %pspdrive%:\HBL\libs_6xx /y /e /i
XCOPY libs_5xx %pspdrive%:\HBL\libs_5xx /y /e /i
XCOPY tools %pspdrive%:\HBL\tools /y /e /i
COPY hbl.bin %pspdrive%:\HBL\hbl.bin /y /v
COPY menu.bin %pspdrive%:\HBL\menu.bin /y /v
COPY h.bin %pspdrive%:\h.bin /y /v
:A
echo Copying updated files to the Compiled HBL directory...
cd "%fsdir%\HBL\eLoader"
XCOPY config "%fsdir%\Compiled HBL\HBL\config" /y /e /i
XCOPY libs_6xx "%fsdir%\Compiled HBL\HBL\libs_6xx" /y /e /i
XCOPY libs_5xx "%fsdir%\Compiled HBL\HBL\libs_5xx" /y /e /i
XCOPY tools "%fsdir%\Compiled HBL\HBL\tools" /y /e /i
COPY hbl.bin "%fsdir%\Compiled HBL\HBL\hbl.bin" /y /V
COPY menu.bin "%fsdir%\Compiled HBL\HBL\menu.bin" /y /V
COPY h.bin "%fsdir%\Compiled HBL\h.bin" /y /v
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ============================== Cleaning files... ==============================
echo ===============================================================================
rd "%fsdir%\HBL\eLoader" /s /q
md "%fsdir%\HBL\eLoader"
cd "%fsdir%\Temporary"
xcopy eLoader "%fsdir%\HBL\eLoader" /y /e /h
if exist "%fsdir%\trunk" (
echo Trunk directory detected, deleting it...
rmdir "%fsdir%\trunk" /s /q
) ELSE (
echo Trunk directory not detected, skipping this step: delete trunk directory...
)
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ================== Completed! You can close this window now! ==================
echo ===============================================================================
echo Press a button or close this window!
pause >nul