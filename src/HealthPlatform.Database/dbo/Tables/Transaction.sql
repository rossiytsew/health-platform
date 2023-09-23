CREATE TABLE [dbo].[Transaction]
(
	[TransactionId]        INT              NOT NULL    IDENTITY,
    [Date]                 DATE             NOT NULL,
	[TransactionAmount]    FLOAT            NOT NULL,
    [Note]                 NVARCHAR(256)    NULL,
	[ConsumerId]           INT              NOT NULL
)
GO

ALTER TABLE [dbo].[Transaction]
    ADD CONSTRAINT [PK_Transaction] PRIMARY KEY
    (
        [TransactionId] 
    )
GO

ALTER TABLE [dbo].[Transaction]
    ADD CONSTRAINT [FK_Transaction_ConsumerId] FOREIGN KEY
    (
        [ConsumerId]
    ) 
    REFERENCES [dbo].[Consumer] 
    (
        [ConsumerId]
    )
GO
