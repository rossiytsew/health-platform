CREATE PROCEDURE [dbo].[usp_GetBenefitsOfferingsByBenefitsPackageId]
	@BenefitsPackageId INT
AS
BEGIN
	SELECT
		[BenefitsOfferingId],
		[Name],
		[Type],
		[ContributionAmount]
	FROM [dbo].[BenefitsOffering]
	WHERE [BenefitsPackageId] = @BenefitsPackageId
END
