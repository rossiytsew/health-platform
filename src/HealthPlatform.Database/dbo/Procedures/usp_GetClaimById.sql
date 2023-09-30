CREATE PROCEDURE [dbo].[usp_GetClaimById]
	@ClaimId INT
AS
BEGIN
	SELECT
		c.[ClaimId],
		c.[ClaimNumber],
		c.[ClaimAmount],
		c.[DateOfService],
		c.[Receipt],
		cs.[Status],
		i.[FirstName] + i.[LastName] [ConsumerFullName],
		cns.[ConsumerId],
		e.[EnrollmentId],
		e.[ElectionAmount],
		bo.[BenefitsOfferingId],
		bo.[ContributionAmount],
		bo.[Name],
		bo.[Type]
	FROM [dbo].[Claim] c
	INNER JOIN [dbo].[ClaimStatus] cs ON cs.[ClaimId] = c.[ClaimId]
	INNER JOIN [dbo].[Enrollment] e ON e.[EnrollmentId] = c.[EnrollmentId]
	INNER JOIN [dbo].[Consumer] cns ON cns.[ConsumerId] = e.[ConsumerId]
	INNER JOIN [dbo].[Individual] i ON i.[IndividualId] = cns.[IndividualId]
	INNER JOIN [dbo].[BenefitsOffering] bo ON bo.[BenefitsOfferingId] = e.[BenefitsOfferingId]
	WHERE c.[ClaimId] = @ClaimId
END
