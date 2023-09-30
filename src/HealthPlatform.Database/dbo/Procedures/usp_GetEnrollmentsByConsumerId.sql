CREATE PROCEDURE [dbo].[usp_GetEnrollmentsByConsumerId]
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
	WHERE e.[ConsumerId] = @ConsumerId
END
