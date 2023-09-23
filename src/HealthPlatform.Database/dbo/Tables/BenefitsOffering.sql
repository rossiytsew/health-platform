CREATE TABLE [dbo].[BenefitsOffering]
(
	[BenefitsOfferingId]    INT              NOT NULL    IDENTITY,
	[Name]                  NVARCHAR(128)    NOT NULL,
	[Type]                  TINYINT          NOT NULL,
	[ContributionAmount]    FLOAT            NOT NULL,
	[BenefitsPackageId]     INT              NOT NULL
)
GO

ALTER TABLE [dbo].[BenefitsOffering]
    ADD CONSTRAINT [PK_BenefitsOffering] PRIMARY KEY
    (
        [BenefitsOfferingId]
    )
GO

ALTER TABLE [dbo].[BenefitsOffering]
    ADD CONSTRAINT [CK_BenefitsOffering_ContributionAmount] CHECK
    (
        [ContributionAmount] >= 0
    )
GO

ALTER TABLE [dbo].[BenefitsOffering]
    ADD CONSTRAINT [FK_BenefitsOffering_BenefitsPackageId] FOREIGN KEY
    (
        [BenefitsPackageId]
    ) 
    REFERENCES [dbo].[BenefitsPackage] 
    (
        [BenefitsPackageId]
    )
    ON DELETE CASCADE
GO