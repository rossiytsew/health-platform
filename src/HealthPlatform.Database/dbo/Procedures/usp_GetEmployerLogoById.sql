CREATE PROCEDURE [dbo].[usp_GetEmployerLogoById]
	@EmployerId INT
AS
BEGIN
	SELECT
		[Logo]
	FROM [dbo].[Employer]
	WHERE [EmployerId] = @EmployerId
END