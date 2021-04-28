cmd.exe /c chcp 1252
set PSQL="C:\Program Files\PostgreSQL\8.3\bin\psql"
set CVS_HOME="..\..\..\..\.."
set DATABASE=certitools
SET USER=certitools
SET PGPPASSWORD=certitools


%PSQL% -f %CVS_HOME%\certitecna\certool\implementation\certitools\database\inserts.sql %DATABASE% %USER%
%PSQL% -f %CVS_HOME%\certitecna\certool\implementation\certitools\database\test-inserts.sql %DATABASE% %USER%
pause