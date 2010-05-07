@echo off
color 0A
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ============================ Reading config.bat... ============================
echo ===============================================================================
call config.bat
set fsdir=%cd%
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ============================ Downloading PSPSDK... ============================
echo ===============================================================================
cd "%fsdir%"
"%fsdir%\Subversion Client\svn.exe" co http://pspsdk.googlecode.com/svn/trunk
cd "%fsdir%\trunk"
copy "PSPSDK Installer.exe" "%fsdir%\PSPSDK Installer.exe"
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ============================== Installing PSPSDK ==============================
echo ===============================================================================
"%fsdir%\PSPSDK Installer.exe"
cd "%fsdir%"
rmdir "trunk" /s /q
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ================== Completed! You can close this window now! ==================
echo ===============================================================================
echo Press a button or close this window!
pause >nul