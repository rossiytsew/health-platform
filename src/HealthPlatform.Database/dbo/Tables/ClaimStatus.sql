CREATE TABLE [dbo].[ClaimStatus]
(
	 [ClaimStatusId]    INT              NOT NULL    IDENTITY,
	 [Date]             DATE             NOT NULL,
	 [Status]           INT              NOT NULL,
	 [Note]             NVARCHAR(512)    NULL,
	 [ClaimId]          INT              NOT NULL
)
GO

ALTER TABLE [dbo].[ClaimStatus]
    ADD CONSTRAINT [PK_ClaimStatus] PRIMARY KEY
    (
        [ClaimStatusId] 
    )
GO

ALTER TABLE [dbo].[ClaimStatus]
    ADD CONSTRAINT [UK_ClaimStatus_ClaimId] UNIQUE
    (
        [ClaimId]
    )
GO

ALTER TABLE [dbo].[ClaimStatus]
    ADD CONSTRAINT [FK_ClaimStatus_ClaimId] FOREIGN KEY
    (
        [ClaimId]
    ) 
    REFERENCES [dbo].[Claim] 
    (
        [ClaimId]
    )
    ON DELETE CASCADE
GO
