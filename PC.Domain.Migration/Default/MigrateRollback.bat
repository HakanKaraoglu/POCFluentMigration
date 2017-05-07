"../../Tools/Migrate.exe" --connection "connectionstring" --provider sqlserver --assembly "..\..\FTP.Domain.Migration.dll" --transaction-per-session --verbose=true --task rollback --steps=1 --output --outputFilename=MigrateRollbackSqlOutput.sql

pause