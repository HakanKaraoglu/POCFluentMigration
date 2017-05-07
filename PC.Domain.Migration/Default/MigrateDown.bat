"../../Tools/Migrate.exe" --connection "connectionstring" --provider sqlserver --assembly "..\..\FTP.Domain.Migration.dll" --transaction-per-session --verbose=true --task migrate:down --output --outputFilename=MigrateDownSqlOutput.sql

pause