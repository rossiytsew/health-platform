CREATE PROCEDURE [dbo].[usp_GetConsumersByAdministrator]
    @AdministratorName    NVARCHAR(64),
    @DomainId             INT,
    @EmployerId           INT = NULL,
    @FirstName            NVARCHAR(128) = NULL,
    @LastName             NVARCHAR(128) = NULL
AS
BEGIN
    DECLARE @Params NVARCHAR(MAX),
            @Sql NVARCHAR(MAX)
    
    SET @Params = N'@AdministratorName    NVARCHAR(64),
                    @DomainId             INT,
                    @EmployerId           INT,
                    @FirstName            NVARCHAR(128),
                    @LastName             NVARCHAR(128)'

    SET @Sql = N'SELECT
                     c.[ConsumerId],
                     sl.[SecurityLoginId],
                     sl.[Username],
                     sl.[PasswordHash],
                     i.[FirstName],
                     i.[LastName],
                     i.[Email],
                     i.[Ssn]
                 FROM [dbo].[Consumer] c
                 INNER JOIN [dbo].[Individual] i ON i.[IndividualId] = c.[IndividualId]
                 INNER JOIN [dbo].[SecurityLogin] sl ON sl.[IndividualId] = c.[IndividualId]
                 INNER JOIN [dbo].[AdministratorEmployer] ae ON ae.[EmployerId] = sl.[EmployerId]
                 INNER JOIN [dbo].[Administrator] a ON a.[AdministratorId] = ae.[AdministratorId]
                 WHERE a.[Name] = @AdministratorName
                 AND a.[DomainId] = @DomainId'

    IF @EmployerId IS NOT NULL
        SET @sql = @sql + N' AND sl.[EmployerId] = @EmployerId'

    IF @FirstName IS NOT NULL
        SET @sql = @sql + N' AND i.[FirstName] LIKE ''%'' + @FirstName + ''%'''

    IF @LastName IS NOT NULL
        SET @sql = @sql + N' AND i.[LastName] LIKE ''%'' + @LastName + ''%'''

    EXECUTE SP_EXECUTESQL @Sql, @Params, @AdministratorName, @DomainId, @EmployerId, @FirstName, @LastName
END
