CREATE TABLE [dbo].[Payment]
(
	[PaymentId]        INT      NOT NULL    IDENTITY,
	[PaymentAmount]    FLOAT    NOT NULL,
	[Date]             DATE     NOT NULL,
	[Status]           INT      NOT NULL,
	[EnrollmentId]     INT      NOT NULL
)
GO

ALTER TABLE [dbo].[Payment]
    ADD CONSTRAINT [PK_Payment] PRIMARY KEY
    (
        [PaymentId] 
    )
GO

ALTER TABLE [dbo].[Payment]
    ADD CONSTRAINT [CK_Payment_PaymentAmount] CHECK
    (
        [PaymentAmount] >= 0
    )
GO

ALTER TABLE [dbo].[Payment]
    ADD CONSTRAINT [FK_Payment_EnrollmentId] FOREIGN KEY
    (
        [EnrollmentId]
    ) 
    REFERENCES [dbo].[Enrollment] 
    (
        [EnrollmentId]
    )
GO