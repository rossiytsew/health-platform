CREATE PROCEDURE [dbo].[usp_GetActiveEnrollmentsByConsumerId]
	@ConsumerId INT
AS
BEGIN
	SELECT
		e.[EnrollmentId],
		e.[ElectionAmount],
		bo.[BenefitsOfferingId],
		bo.[ContributionAmount],
		bo.[Name],
		bo.[Type]
	FROM [dbo].[Enrollment] e
	INNER JOIN [dbo].[BenefitsOffering] bo ON bo.[BenefitsOfferingId] = e.[BenefitsOfferingId]
	INNER JOIN [dbo].[BenefitsPackage] bp ON bp.[BenefitsPackageId] = bo.[BenefitsPackageId]
	WHERE e.[ConsumerId] = @ConsumerId
	AND GETDATE() < bp.[EndDate]
	AND e.[Status] = 1 -- Initialized = 1
END