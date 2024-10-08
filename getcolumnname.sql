USE [TSQL]
GO
/****** Object:  StoredProcedure [dbo].[GetDynamicColumns]    Script Date: 2024-09-27 7:54:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetDynamicColumns](
	@tablename NVARCHAR(MAX),
    @result NVARCHAR(MAX) OUTPUT -- Output parameter to hold the comma-separated column names
	)
AS
BEGIN

IF OBJECT_ID(@tablename) IS NULL
BEGIN
	SET @result =   'The specified object does not exist';
END
ELSE
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


END;

/*
To Execute the SP
*/

DECLARE @selectstatement NVARCHAR(MAX)
DECLARE @mytablename NVARCHAR(MAX) = 'sales.customers'
-- Call the stored procedure and get the column names as a comma-separated string
EXEC GetDynamicColumns @tablename = @mytablename, @result = @selectstatement OUTPUT
 
-- Print the result with the column names
PRINT @selectstatement
