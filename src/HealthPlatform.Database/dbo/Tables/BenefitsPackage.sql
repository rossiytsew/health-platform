CREATE TABLE [dbo].[BenefitsPackage]
(
	[BenefitsPackageId]          INT              NOT NULL    IDENTITY,
	[Name]                       NVARCHAR(128)    NOT NULL,
	[StartDate]                  DATE             NOT NULL,
	[EndDate]                    DATE             NOT NULL,
	[EmployerId]                 INT              NOT NULL,
    [PayrollFrequency]           TINYINT          NOT NULL
)
GO

ALTER TABLE [dbo].[BenefitsPackage]
    ADD CONSTRAINT [PK_BenefitsPackage] PRIMARY KEY
    (
        [BenefitsPackageId]
    )
GO

ALTER TABLE [dbo].[BenefitsPackage]
    ADD CONSTRAINT [FK_BenefitsPackage_EmployerId] FOREIGN KEY
    (
        [EmployerId]
    ) 
    REFERENCES [dbo].[Employer] 
    (
        [EmployerId]
    )
GO