@echo off
rem Starts iTrust2 using the portable JDK in %USERPROFILE%\itrust2-runtime (MariaDB must already be running)
set "JAVA_HOME=%USERPROFILE%\itrust2-runtime\jdk-11.0.32.1+1"
cd /d "%~dp0..\iTrust2"
call .\mvnw.cmd -B spring-boot:run
