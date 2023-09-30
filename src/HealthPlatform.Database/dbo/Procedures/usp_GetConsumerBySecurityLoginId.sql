CREATE PROCEDURE [dbo].[usp_GetConsumerBySecurityLoginId]
	@SecurityLoginId INT
AS
BEGIN
	SELECT
		c.[ConsumerId],
		sl.[SecurityLoginId],
		sl.[Username],
		sl.[PasswordHash],
		sl.[EmployerId]
	FROM [dbo].[Consumer] c
	INNER JOIN dbo.[SecurityLogin] sl ON sl.[IndividualId] = c.IndividualId
	WHERE sl.[SecurityLoginId] = @SecurityLoginId
END
