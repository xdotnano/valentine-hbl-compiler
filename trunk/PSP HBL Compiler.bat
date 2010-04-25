@echo off
color 0A
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ============================ Reading config.bat... ============================
echo ===============================================================================
call config.bat
md %fsdir%/hbl
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo =========================== Updating file system... ===========================
echo ===============================================================================
TortoiseProc.exe /command:update /closeonend:1 /path:"%fsdir%"
cd "%fsdir%"
copy PSP HBL Compiler.bat %fsdir%\old\PSP HBL Compiler.bat /y
copy sdk.s %fsdir%\files\restore\sdk.s /y
copy sdk_hbl.s %fsdir%\files\restore\sdk_hbl.s /y
copy sdk_loader.s %fsdir%\files\sdk_loader.s /y
copy umemsdk.s %fsdir%\files\restore\tools\umem dumper\sdk.s /y
pause
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ============================== Downloading files ==============================
echo ===============================================================================
echo You see a Tortoise SVN window. Please click on the "Ok" button!
TortoiseProc.exe /command:checkout /closeonend:1 /path:"%fsdir%/hbl" /url http://valentine-hbl.googlecode.com/svn/trunk/
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
echo ================================ Copying files ================================
echo ===============================================================================
echo Type in Y and then press enter is your answer is yes
echo Type in N and then press enter is your answer is no
echo ===============================================================================
set /p pspconnected=The files were succesfully updated and compiled. Is your PSP connected to your PC? Please type in your answer and then press enter: 
cd %fsdir%\hbl\eLoader\config
if %pspconnected% == N goto A
if %pspconnected% == n goto A
md "%pspdrive%:\hbl"
md "%pspdrive%:\hbl\config"
md "%pspdrive%:\hbl\libs_6xx"
md "%pspdrive%:\hbl\libs_5xx"
md "%pspdrive%:\hbl\tools"
md "%pspdrive%:\hbl\tools\imports.config generator"
md "%pspdrive%:\hbl\tools\libs generator"
md "%pspdrive%:\hbl\tools\umem dumper"
COPY imports.config_6xx %pspdrive%:\hbl\config\imports.config_6xx /y
COPY imports.config_50x %pspdrive%:\hbl\config\imports.config_50x /y
COPY imports.config_550 %pspdrive%:\hbl\config\imports.config_550 /y
COPY imports.config_555 %pspdrive%:\hbl\config\imports.config_555 /y
COPY imports.config_570 %pspdrive%:\hbl\config\imports.config_570 /y
cd %fsdir%\hbl\eLoader
XCOPY libs_6xx %pspdrive%:\hbl\libs_6xx /y /e
XCOPY libs_5xx %pspdrive%:\hbl\libs_5xx /y /e
XCOPY tools %pspdrive%:\hbl\tools /y /e
COPY hbl.bin %pspdrive%:\hbl\hbl.bin /y
COPY menu.bin %pspdrive%:\hbl\menu.bin /y
COPY h.bin %pspdrive%:\ /y
:A
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ============================== Cleaning files... ==============================
echo ===============================================================================
cd "%fsdir%\hbl\eLoader\"
make clean
cd "%fsdir%\hbl\eLoader\tools\umem dumper"
make clean
cd "%fsdir%\files\restore"
copy sdk.s %fsdir%\hbl\eLoader\sdk.s /y
copy sdk_hbl.s %fsdir%\hbl\eLoader\sdk_hbl.s /y
copy sdk_loader.s %fsdir%\hbl\eLoader\sdk_loader.s /y
cd "%fsdir%\files\restore"
xcopy tools %fsdir%\hbl\eLoader\tools /y /e
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ======================== Copying the new batch file... ========================
echo ===============================================================================
cd "%fsdir%\files"
copy second.bat "%fsdir%\PSP HBL Compiler.bat" /y
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ================== Completed! You can close this window now! ==================
echo ===============================================================================
echo Press a button or close this window!
pause >nul