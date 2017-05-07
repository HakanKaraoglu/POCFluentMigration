"../../Tools/AnyCPU/40/Migrate.exe" --connection "connectionstring" --provider sqlserver --assembly "..\bin\Debug\PC.Domain.Migration.dll" --transaction-per-session --verbose=true --task migrate:up --output --outputFilename=MigrateUpSqlOutput.sql

pause