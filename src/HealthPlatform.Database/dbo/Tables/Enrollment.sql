CREATE TABLE [dbo].[Enrollment]
(
	[EnrollmentId]          INT      NOT NULL    IDENTITY,
    [ElectionAmount]        FLOAT    NOT NULL,
    [ConsumerId]            INT      NOT NULL,
    [BenefitsOfferingId]    INT      NOT NULL,
    [Status]                INT      NOT NULL
)
GO

ALTER TABLE [dbo].[Enrollment]
    ADD CONSTRAINT [PK_Enrollment] PRIMARY KEY
    (
        [EnrollmentId] 
    )
GO

ALTER TABLE [dbo].[Enrollment]
    ADD CONSTRAINT [CK_Enrollment_ElectionAmount] CHECK
    (
        [ElectionAmount] >= 0
    )
GO

ALTER TABLE [dbo].[Enrollment]
    ADD CONSTRAINT [UK_Enrollment_ConsumerId_BenefitsOfferingId] UNIQUE
    (
        [ConsumerId],
        [BenefitsOfferingId]
    )
GO

ALTER TABLE [dbo].[Enrollment]
    ADD CONSTRAINT [FK_Enrollment_ConsumerId] FOREIGN KEY
    (
        [ConsumerId]
    ) 
    REFERENCES [dbo].[Consumer] 
    (
        [ConsumerId]
    )
GO

ALTER TABLE [dbo].[Enrollment]
    ADD CONSTRAINT [FK_Enrollment_BenefitsOfferingId] FOREIGN KEY
    (
        [BenefitsOfferingId]
    ) 
    REFERENCES [dbo].[BenefitsOffering] 
    (
        [BenefitsOfferingId]
    )
GO
