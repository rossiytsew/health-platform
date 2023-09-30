CREATE PROCEDURE [dbo].[usp_GetUserForLogin]
    @DomainId           INT,
    @LoginType          INT,
    @Username           NVARCHAR(64)
AS
BEGIN
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
    WHERE sl.[LoginType] = @LoginType
    AND sl.[DomainId] = @DomainId
    AND sl.[Username] = @Username
END
