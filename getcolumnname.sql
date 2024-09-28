CREATE PROCEDURE GetDynamicColumns(
	@tablename NVARCHAR(MAX),
    @result NVARCHAR(MAX) OUTPUT -- Output parameter to hold the comma-separated column names
	)
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX) = ''
 
    -- Dynamically generate the column names
    ;WITH ColumnList AS (
        SELECT name
        FROM sys.columns 
        WHERE object_id = OBJECT_ID(@tablename)
    )
    -- Loop through and concatenate the column names with commas
    SELECT @sql = @sql + name + ', '
    FROM ColumnList
 
    -- Remove the last comma and space
    SET @sql = LEFT(@sql, LEN(@sql) - 1)
 
    -- Set the result into the output parameter
	SET @result = 'select ' +@sql + ' from ' +@tablename
END

/*
To Execute the SP
*/

DECLARE @selectstatement NVARCHAR(MAX)
DECLARE @mytablename NVARCHAR(MAX) = 'sales.customers'
-- Call the stored procedure and get the column names as a comma-separated string
EXEC GetDynamicColumns @tablename = @mytablename, @result = @selectstatement OUTPUT
 
-- Print the result with the column names
PRINT @selectstatement
