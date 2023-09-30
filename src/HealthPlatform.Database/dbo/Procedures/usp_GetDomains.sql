CREATE PROCEDURE [dbo].[usp_GetDomains]
AS
BEGIN
	SELECT 
		[DomainId],
		[Name],
		[Alias]
	FROM [dbo].[Domain]
END
GO