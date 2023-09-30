CREATE PROCEDURE [dbo].[usp_GetConsumersByEmployer]
    @EmployerId           INT,
    @DomainId             INT,
    @FirstName            NVARCHAR(128) = NULL,
    @LastName             NVARCHAR(128) = NULL,
    @Ssn                  NVARCHAR(11) = NULL,
    @PerPage              INT = NULL,
    @Page                 INT = NULL,
    @Count                INT OUTPUT
AS
BEGIN
    CREATE TABLE #Consumer
    (
        [ConsumerId]            INT              NOT NULL,
        [FirstName]             NVARCHAR(128)    NOT NULL,
        [LastName]              NVARCHAR(128)    NOT NULL,
        [Email]                 NVARCHAR(128),
        [Ssn]                   NVARCHAR(11)     NOT NULL,
        [SecurityLoginId]       INT              NOT NULL,
        [PasswordHash]          NVARCHAR(128)    NOT NULL,
        [Username]              NVARCHAR(64)     NOT NULL,
        [RowNum]                INT              NOT NULL
    )

    DECLARE @Params NVARCHAR(MAX),
            @Sql NVARCHAR(MAX)

    SET @Params = N'@EmployerId           INT,
                    @DomainId             INT,
                    @FirstName            NVARCHAR(128),
                    @LastName             NVARCHAR(128),
                    @Ssn                  NVARCHAR(11)'

    SET @Sql = N'SELECT
                     c.[ConsumerId],
                     i.[FirstName],
                     i.[LastName],
                     i.[Email],
                     i.[Ssn],
                     sl.[SecurityLoginId],
                     sl.[PasswordHash],
                     sl.[Username],
                     ROW_NUMBER() OVER (ORDER BY i.[FirstName]) AS [RowNum]
                 FROM [dbo].[Consumer] c
                 INNER JOIN [dbo].[Individual] i ON i.[IndividualId] = c.[IndividualId]
                 INNER JOIN [dbo].[SecurityLogin] sl ON sl.[IndividualId] = c.[IndividualId]
                 WHERE c.EmployerId = @EmployerId
                 AND sl.[DomainId] = @DomainId'

    IF @FirstName IS NOT NULL
        SET @sql = @sql + N' AND i.[FirstName] LIKE ''%'' + @FirstName + ''%'''

    IF @LastName IS NOT NULL
        SET @sql = @sql + N' AND i.[LastName] LIKE ''%'' + @LastName + ''%'''

    IF @Ssn IS NOT NULL
        SET @sql = @sql + N' AND i.[Ssn] LIKE ''%'' + @Ssn + ''%'''

    INSERT INTO #Consumer
    (
        [ConsumerId],
        [FirstName],
        [LastName],
        [Email],
        [Ssn],
        [SecurityLoginId],
		[PasswordHash],
		[Username],
        [RowNum]
    )
    EXECUTE SP_EXECUTESQL @Sql, @Params, @EmployerId, @DomainId, @FirstName, @LastName, @Ssn

    SET @Params = N'@Page    INT,
                    @PerPage INT'

    SET @Sql= N'SELECT
                    [ConsumerId],
                    [FirstName],
                    [LastName],
                    [Email],
                    [Ssn],
                    [SecurityLoginId],
                    [PasswordHash],
                    [Username]
                FROM #Consumer'
    
    IF @PerPage IS NOT NULL AND @Page IS NOT NULL
        SET @Sql = @Sql + N' WHERE [RowNum] > (@Page - 1) * @PerPage AND [RowNum] <= @Page * @PerPage'

    EXECUTE SP_EXECUTESQL @Sql, @Params, @Page, @PerPage

    SELECT
        @Count = COUNT(1)
    FROM #Consumer
END