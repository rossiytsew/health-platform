CREATE PROCEDURE [dbo].[usp_CheckDomainForUniqueAlias]
	@Alias NVARCHAR(128),
	@DomainId INT = NULL
AS
BEGIN
	IF EXISTS
	(
		SELECT * FROM [dbo].[Domain]
		WHERE [Alias] = @Alias 
		AND (@DomainId IS NULL OR [DomainId] != @DomainId)
	)
		SELECT 0 AS BIT
	ELSE
		SELECT 1 AS BIT
END
