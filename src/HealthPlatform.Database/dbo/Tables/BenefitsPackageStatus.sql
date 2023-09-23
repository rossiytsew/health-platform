CREATE TABLE [dbo].[BenefitsPackageStatus]
(
	[BenefitsPackageStatusId]    INT         NOT NULL    IDENTITY,
	[Date]                       DATE        NOT NULL,
	[Status]                     TINYINT     NOT NULL,
    [BenefitsPackageId]          INT         NOT NULL
)
GO

ALTER TABLE [dbo].[BenefitsPackageStatus]
    ADD CONSTRAINT [PK_BenefitsPackageStatus] PRIMARY KEY
    (
        [BenefitsPackageStatusId]
    )
GO

ALTER TABLE [dbo].[BenefitsPackageStatus]
    ADD CONSTRAINT [UK_BenefitsPackageStatus_BenefitsPackageId] UNIQUE
    (
        [BenefitsPackageId]
    )
GO

ALTER TABLE [dbo].[BenefitsPackageStatus]
    ADD CONSTRAINT [FK_BenefitsPackageStatus_BenefitsPackageId] FOREIGN KEY
    (
        [BenefitsPackageId]
    ) 
    REFERENCES [dbo].[BenefitsPackage] 
    (
        [BenefitsPackageId]
    )
    ON DELETE CASCADE
GO