@echo off
color 0A
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ============================ Reading config.bat... ============================
echo ===============================================================================
call config.bat
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo =========================== Updating file system... ===========================
echo ===============================================================================
TortoiseProc.exe /command:update /closeonend:1 /path:"%fsdir%"
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ============================== Updating files... ==============================
echo ===============================================================================
if exist %fsdir%:\hbl (
echo HBL directory detected, skipping SVN checkout, updating...
goto C
) ELSE (
echo HBL directory isn't detected, Svn checkout, you will see a Tortoise SVN window, please press enter or click on the ok button on it!
TortoiseProc.exe /command:checkout /closeonend:1 /path:"%fsdir%/hbl" /url:http://valentine-hbl.googlecode.com/svn/trunk
goto D
)
:C
TortoiseProc.exe /command:update /closeonend:1 /path:"%fsdir%/hbl"
:D
pause
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo =============================== Compiling files ===============================
echo ===============================================================================
cd %fsdir%\hbl\eLoader
make
cd %fsdir%\hbl\eLoader\tools\umem dumper
make
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ========== Detecting PSP and copying files if the PSP is detected... ==========
echo ===============================================================================
if exist %pspdrive%:\ (
echo PSP detected, copying files...
) ELSE (
echo PSP not detected, skipping this step...
goto A
)
if exist %pspdrive%:\hbl (
echo HBL directory detected on your PSP, skipping this step: making directories...
goto B
) ELSE (
echo HBL directory isn't detected on your PSP, creating directories for HBL...
)
md "%pspdrive%:\hbl"
md "%pspdrive%:\hbl\config"
md "%pspdrive%:\hbl\libs_6xx"
md "%pspdrive%:\hbl\libs_5xx"
md "%pspdrive%:\hbl\tools"
md "%pspdrive%:\hbl\tools\imports.config generator"
md "%pspdrive%:\hbl\tools\libs generator"
md "%pspdrive%:\hbl\tools\umem dumper"
:B
cd "%fsdir%\hbl\eLoader\config"
COPY imports.config_6xx %pspdrive%:\hbl\config\imports.config_6xx /y
COPY imports.config_50x %pspdrive%:\hbl\config\imports.config_50x /y
COPY imports.config_550 %pspdrive%:\hbl\config\imports.config_550 /y
COPY imports.config_555 %pspdrive%:\hbl\config\imports.config_555 /y
COPY imports.config_570 %pspdrive%:\hbl\config\imports.config_570 /y
cd "%fsdir%\hbl\eLoader"
XCOPY libs_6xx %pspdrive%:\hbl\libs_6xx /y /e
XCOPY libs_5xx %pspdrive%:\hbl\libs_5xx /y /e
XCOPY tools %pspdrive%:\hbl\tools /y /e
COPY hbl.bin %pspdrive%:\hbl\hbl.bin /y
COPY menu.bin %pspdrive%:\hbl\menu.bin /y
COPY h.bin %pspdrive%:\h.bin /y
pause
:A
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ============================== Cleaning files... ==============================
echo ===============================================================================
del "%fsdir%\hbl\eLoader"
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ================== Completed! You can close this window now! ==================
echo ===============================================================================
echo Press a button or close this window!
pause >nul