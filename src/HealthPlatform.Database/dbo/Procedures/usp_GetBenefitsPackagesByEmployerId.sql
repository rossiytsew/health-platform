CREATE PROCEDURE [dbo].[usp_GetBenefitsPackagesByEmployerId]
	@EmployerId INT
AS
BEGIN
	SELECT 
		bp.[BenefitsPackageId],
		bp.[Name],
		bp.[StartDate],
		bp.[EndDate],
		bp.[PayrollFrequency],
		bps.[Status],
		bps.[Date] [StatusDate]
	FROM [dbo].[BenefitsPackage] bp
	INNER JOIN [dbo].[BenefitsPackageStatus] bps ON bps.[BenefitsPackageId] = bp.[BenefitsPackageId]
	WHERE bp.[EmployerId] = @EmployerId
END
