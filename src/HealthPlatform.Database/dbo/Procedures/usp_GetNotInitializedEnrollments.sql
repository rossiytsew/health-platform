CREATE PROCEDURE [dbo].[usp_GetNotInitializedEnrollmentsByBenefitsPackageId]
	@BenefitsPackageId INT
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
	WHERE e.[Status] = 0 -- NotInitialized = 0
	AND bp.[BenefitsPackageId] = @BenefitsPackageId
END
