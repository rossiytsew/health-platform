CREATE PROCEDURE [dbo].[usp_CheckEmployerForUniqueCode]
	@Code NVARCHAR(32),
	@EmployerId INT = NULL
AS
BEGIN
	IF EXISTS
	(
		SELECT * FROM [dbo].[Employer]
		WHERE [Code] = @Code 
		AND (@EmployerId IS NULL OR [EmployerId] != @EmployerId)
	)
		SELECT 0 AS BIT
	ELSE
		SELECT 1 AS BIT
END
