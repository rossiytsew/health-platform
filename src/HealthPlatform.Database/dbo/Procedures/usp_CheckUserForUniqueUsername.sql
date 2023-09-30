CREATE PROCEDURE [dbo].[usp_CheckUserForUniqueUsername]
	@Username NVARCHAR(64),
	@DomainId INT,
	@SecurityLoginId INT = NULL
AS
BEGIN
	IF EXISTS
	(
		SELECT * FROM [dbo].[SecurityLogin]
		WHERE [Username] = @Username
		AND [DomainId] = @DomainId
		AND (@SecurityLoginId IS NULL OR [SecurityLoginId] != @SecurityLoginId)
	)
		SELECT 0 AS BIT
	ELSE
		SELECT 1 AS BIT
END
