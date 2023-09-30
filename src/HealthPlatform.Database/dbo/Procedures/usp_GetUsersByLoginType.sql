CREATE PROCEDURE [dbo].[usp_GetUsersByLoginType]
    @LoginType     INT,
    @DomainId      INT = NULL,
    @EmployerId    INT = NULL
AS
BEGIN
    SELECT
        sl.[SecurityLoginId],
        sl.[Username],
        sl.[PasswordHash],
        i.[FirstName],
        i.[LastName],
        i.[Email],
        i.[Ssn]
    FROM [dbo].[SecurityLogin] sl
    INNER JOIN [dbo].[Individual] i ON i.[IndividualId] = sl.[IndividualId]
    WHERE sl.[LoginType] = @LoginType
    AND (@DomainId IS NULL OR sl.[DomainId] = @DomainId)
    AND (@EmployerId IS NULL OR sl.[EmployerId] = @EmployerId)
END
