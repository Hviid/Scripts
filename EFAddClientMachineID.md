```SQL
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '__MigrationsHistory' AND COLUMN_NAME = 'ClientMachineName')
BEGIN
  ALTER TABLE __MigrationsHistory add ClientMachineName nvarchar(500) NULL DEFAULT HOST_NAME()
END
```
