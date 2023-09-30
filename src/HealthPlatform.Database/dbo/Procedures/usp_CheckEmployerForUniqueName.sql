CREATE PROCEDURE [dbo].[usp_CheckEmployerForUniqueName]
	@Name NVARCHAR(128),
	@EmployerId INT = NULL
AS
BEGIN
	IF EXISTS
	(
		SELECT * FROM [dbo].[Employer]
		WHERE [Name] = @Name 
		AND (@EmployerId IS NULL OR [EmployerId] != @EmployerId)
	)
		SELECT 0 AS BIT
	ELSE
		SELECT 1 AS BIT
END
