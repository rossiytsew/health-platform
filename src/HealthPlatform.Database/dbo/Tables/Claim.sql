CREATE TABLE [dbo].[Claim]
(
	[ClaimId]          INT               NOT NULL    IDENTITY,
	[ClaimNumber]      NVARCHAR(64)      NOT NULL,
	[ClaimAmount]      FLOAT             NOT NULL,
	[Receipt]          VARBINARY(MAX)    NOT NULL,
    [DateOfService]    DATE              NOT NULL,
	[EnrollmentId]     INT               NOT NULL
)
GO

ALTER TABLE [dbo].[Claim]
    ADD CONSTRAINT [PK_Claim] PRIMARY KEY
    (
        [ClaimId] 
    )
GO

ALTER TABLE [dbo].[Claim]
    ADD CONSTRAINT [UK_Claim_ClaimNumber] UNIQUE
    (
        [ClaimNumber] 
    )
GO

ALTER TABLE [dbo].[Claim]
    ADD CONSTRAINT [CK_Claim_ClaimAmount] CHECK
    (
        [ClaimAmount] >= 0
    )
GO

ALTER TABLE [dbo].[Claim]
    ADD CONSTRAINT [CK_Claim_DateOfService] CHECK
    (
        [DateOfService] <= GETDATE()
    )
GO

ALTER TABLE [dbo].[Claim]
    ADD CONSTRAINT [FK_Claim_EnrollmentId] FOREIGN KEY
    (
        [EnrollmentId]
    ) 
    REFERENCES [dbo].[Enrollment] 
    (
        [EnrollmentId]
    )
GO