CREATE PROCEDURE [dbo].[usp_GetBenefitsPackageById]
	@BenefitsPackageId INT,
	@EmployerId INT = NULL
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
	INNER JOIN [dbo].[BenefitsPackageStatus] bps ON bps.BenefitsPackageId = bp.[BenefitsPackageId]
	WHERE bp.[BenefitsPackageId] = @BenefitsPackageId
	AND (@EmployerId IS NULL OR bp.[EmployerId] = @EmployerId)
END
