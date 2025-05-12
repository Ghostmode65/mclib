@echo off
set JAVA_HOME=C:\Program Files\Java\jdk-17
set PATH=%JAVA_HOME%\bin;%PATH%
gradlew.bat %*
echo JAVA_HOME is now reset to its previous value
pause