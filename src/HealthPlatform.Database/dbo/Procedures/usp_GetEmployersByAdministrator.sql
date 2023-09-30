CREATE PROCEDURE [dbo].[usp_GetEmployersByAdministrator]
    @AdministratorName    NVARCHAR(64),
    @DomainId             INT,
    @Name                 NVARCHAR(128) = NULL,
    @Code                 NVARCHAR(32) = NULL,
    @PerPage              INT = NULL,
    @Page                 INT = NULL,
    @Count                INT OUTPUT
AS
BEGIN
    CREATE TABLE #Employer
    (
        [EmployerId]    INT              NOT NULL,
        [Name]          NVARCHAR(128)    NOT NULL,
        [Code]          NVARCHAR(32)     NOT NULL,
        [RowNum]        INT              NOT NULL
    )

    DECLARE @Params NVARCHAR(MAX),
            @Sql NVARCHAR(MAX)

    SET @Params = N'@AdministratorName    NVARCHAR(64),
                    @DomainId             INT,
                    @Name                 NVARCHAR(128),
                    @Code                 NVARCHAR(32)'

    SET @Sql = N'SELECT
                     e.[EmployerId],
                     e.[Name],
                     e.[Code],
                     ROW_NUMBER() OVER (ORDER BY e.[Name]) AS [RowNum]
                 FROM [dbo].[Employer] e
                 INNER JOIN [dbo].[AdministratorEmployer] ae ON ae.EmployerId = e.EmployerId
                 INNER JOIN [dbo].[Administrator] a ON a.AdministratorId = ae.AdministratorId
                 WHERE a.[Name] = @AdministratorName
                 AND a.[DomainId] = @DomainId'

    IF @Name IS NOT NULL
        SET @sql = @sql + N' AND e.[Name] LIKE ''%'' + @Name + ''%'''

    IF @Code IS NOT NULL
        SET @sql = @sql + N' AND e.[Code] LIKE ''%'' + @Code + ''%'''

    INSERT INTO #Employer
    (
        [EmployerId],
        [Name],
        [Code],
        [RowNum]
    )
    EXECUTE SP_EXECUTESQL @Sql, @Params, @AdministratorName, @DomainId, @Name, @Code

    SET @Params = N'@Page    INT,
                    @PerPage INT'

    SET @Sql= N'SELECT
                    [EmployerId],
                    [Name],
                    [Code]
                FROM #Employer'
    
    IF @PerPage IS NOT NULL AND @Page IS NOT NULL
        SET @Sql = @Sql + N' WHERE [RowNum] > (@Page - 1) * @PerPage AND [RowNum] <= @Page * @PerPage'

    EXECUTE SP_EXECUTESQL @Sql, @Params, @Page, @PerPage

    SELECT
        @Count = COUNT(1)
    FROM #Employer
END
