CREATE PROCEDURE [dbo].[usp_GetClaimsByConsumerId]
	@ConsumerId INT
AS
BEGIN
	SELECT
		c.[ClaimId],
		c.[ClaimNumber],
		c.[ClaimAmount],
		c.[DateOfService],
		cs.[Status],
		e.[EnrollmentId],
		e.[ElectionAmount],
		bo.[BenefitsOfferingId],
		bo.[ContributionAmount],
		bo.[Name],
		bo.[Type]
	FROM [dbo].[Claim] c
	INNER JOIN [dbo].[ClaimStatus] cs ON cs.[ClaimId] = c.[ClaimId]
	INNER JOIN [dbo].[Enrollment] e ON e.[EnrollmentId] = c.[EnrollmentId]
	INNER JOIN [dbo].[BenefitsOffering] bo ON bo.[BenefitsOfferingId] = e.[BenefitsOfferingId]
	WHERE e.[ConsumerId] = @ConsumerId
END
