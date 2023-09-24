EXEC dbo.usp_AddBenefitsOffering
	@Name = 'General Medical',
	@Type = 0, -- Medical = 0
	@ContributionAmount = 2000,
	@BenefitsPackageId = 1,
	@BenefitsOfferingId = 0
GO
EXEC dbo.usp_AddBenefitsOffering
	@Name = 'Dental',
	@Type = 1, -- Dental = 1
	@ContributionAmount = 4000,
	@BenefitsPackageId = 1,
	@BenefitsOfferingId = 0
GO
EXEC dbo.usp_AddBenefitsOffering
	@Name = 'Medical Lite',
	@Type = 0, -- Medical = 0
	@ContributionAmount = 1000,
	@BenefitsPackageId = 2,
	@BenefitsOfferingId = 0
GO
EXEC dbo.usp_AddBenefitsOffering
	@Name = 'General Medica+',
	@Type = 0, -- Medical = 0
	@ContributionAmount = 3000,
	@BenefitsPackageId = 3,
	@BenefitsOfferingId = 0
GO
EXEC dbo.usp_AddBenefitsOffering
	@Name = 'Dental+',
	@Type = 1, -- Dental = 1
	@ContributionAmount = 6000,
	@BenefitsPackageId = 3,
	@BenefitsOfferingId = 0
GO