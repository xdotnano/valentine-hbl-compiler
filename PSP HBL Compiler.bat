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
cd "%fsdir%"
"%fsdir%\Subversion Client\svn.exe" up
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
cd "%fsdir%\Subversion Client"
"%fsdir%\Subversion Client\svn.exe" co http://valentine-hbl.googlecode.com/svn/trunk
xcopy trunk "%fsdir%\HBL" /y /e /h
goto D
)
:C
cd "%fsdir%/hbl"
"%fsdir%\Subversion Client\svn.exe" up
:D
if exist "%fsdir%\Temporary" (
echo Temporary folder detected, skipping this step: create Temporary directory...
goto E
) ELSE (
echo Temporary folder isn't detected, making Temporary folder...
md "%fsdir%\Temporary"
md "%fsdir%\Temporary\eLoader"
)
:E
cd "%fsdir%\Temporary"
xcopy "%fsdir%\hbl\eLoader" eLoader /y /e /h
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
md "%pspdrive%:\HBL"
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
:A
if exist "%fsdir%\Compiled HBL" (
echo Compiled HBL directory detected, skipping this step: make Compiled HBL directory...
) ELSE (
echo Compiled HBL directory isn't detected, making Compiled HBL directory...
md "%fsdir%\Compiled HBL"
md "%fsdir%\Compiled HBL\hbl"
md "%fsdir%\Compiled HBL\hbl\config"
md "%fsdir%\Compiled HBL\hbl\libs_6xx"
md "%fsdir%\Compiled HBL\hbl\libs_5xx"
md "%fsdir%\Compiled HBL\hbl\tools"
md "%fsdir%\Compiled HBL\hbl\tools\imports.config generator"
md "%fsdir%\Compiled HBL\hbl\tools\libs generator"
md "%fsdir%\Compiled HBL\hbl\tools\umem dumper"
)
echo Copying updated files to the Compiled HBL directory...
cd "%fsdir%\hbl\eLoader\config"
COPY imports.config_6xx "%fsdir%\Compiled HBL\hbl\config\imports.config_6xx" /y
COPY imports.config_50x "%fsdir%\Compiled HBL\hbl\config\imports.config_50x" /y
COPY imports.config_550 "%fsdir%\Compiled HBL\hbl\config\imports.config_550" /y
COPY imports.config_555 "%fsdir%\Compiled HBL\hbl\config\imports.config_555" /y
COPY imports.config_570 "%fsdir%\Compiled HBL\hbl\config\imports.config_570" /y
cd "%fsdir%\hbl\eLoader"
XCOPY libs_6xx "%fsdir%\Compiled HBL\hbl\libs_6xx" /y /e
XCOPY libs_5xx "%fsdir%\Compiled HBL\hbl\libs_5xx" /y /e
XCOPY tools "%fsdir%\Compiled HBL\hbl\tools" /y /e
COPY hbl.bin "%fsdir%\Compiled HBL\hbl\hbl.bin" /y
COPY menu.bin "%fsdir%\Compiled HBL\hbl\menu.bin" /y
COPY h.bin "%fsdir%\Compiled HBL\h.bin" /y
cls
echo ===============================================================================
echo =============== Play Station Portable Half Byte Loader Compiler ===============
echo ===============================================================================
echo ============================== Cleaning files... ==============================
echo ===============================================================================
rd "%fsdir%\hbl\eLoader" /s /q
md "%fsdir%\HBL\eLoader"
cd "%fsdir%\Temporary"
xcopy eLoader "%fsdir%\HBL\eLoader" /y /e /h
if exist %fsdir%\Subversion Client\trunk (
echo Trunk directory detected, deleting it...
rmdir "%fsdir%\Subversion Client\trunk" /s /q
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