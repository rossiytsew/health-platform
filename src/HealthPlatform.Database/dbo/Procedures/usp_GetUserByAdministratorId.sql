CREATE PROCEDURE [dbo].[usp_GetUserByAdministratorId]
    @AdministratorId       INT
AS
BEGIN
    
    DECLARE @Username   NVARCHAR(64);
    DECLARE @DomainId   INT;

    SELECT
        @Username = a.[Name],
        @DomainId = a.[DomainId]
    FROM [dbo].[Administrator] a
    WHERE a.[AdministratorId] = @AdministratorId

    SELECT
        sl.[SecurityLoginId],
        sl.[Username],
        sl.[PasswordHash],
        sl.[EmployerId],
        i.[FirstName],
        i.[LastName],
        i.[Email],
        i.[Ssn]
    FROM [dbo].[SecurityLogin] sl
    INNER JOIN [dbo].[Individual] i ON i.[IndividualId] = sl.[IndividualId]
    WHERE sl.[LoginType] = 0 -- Administrator = 0
    AND sl.[DomainId] = @DomainId
    AND sl.[Username] = @Username
END
