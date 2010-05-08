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
echo Downloading PSPSDK, please wait!
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
echo Just accept the terms of the license agreement! You just need to install the PSPSDK (select it from the components to install page), but you can install anything else. You can change the destination folder if you want.
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