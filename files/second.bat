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
TortoiseProc.exe /command:update /closeonend:1 /path:"%fsdir%/hbl"
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
echo ================== Completed! You can close this window now! ==================
echo ===============================================================================
echo Press a button or close this window!
pause >nul