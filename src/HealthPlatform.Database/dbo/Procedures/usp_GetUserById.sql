CREATE PROCEDURE [dbo].[usp_GetUserById]
    @SecurityLoginId    INT
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
    WHERE sl.[SecurityLoginId] = @SecurityLoginId
END
