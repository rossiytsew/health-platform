CREATE PROCEDURE [dbo].[usp_GetAvailableBenefitsOfferingsForConsumer]
	@ConsumerId INT
AS
BEGIN
	SELECT
		bo.[BenefitsOfferingId],
		bo.[Name],
		bo.[Type],
		bo.[ContributionAmount]
	FROM [dbo].[BenefitsOffering] bo
	INNER JOIN [dbo].[BenefitsPackage] bp ON bp.[BenefitsPackageId] = bo.[BenefitsPackageId]
	INNER JOIN [dbo].[BenefitsPackageStatus] bps ON bps.[BenefitsPackageId] = bo.[BenefitsPackageId]
	INNER JOIN [dbo].[Consumer] c ON c.[EmployerId] = bp.[EmployerId]
	WHERE bps.[Status] = 1 -- Initialized = 1
	AND c.[ConsumerId] = @ConsumerId
END
