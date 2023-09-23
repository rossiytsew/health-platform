CREATE TABLE [dbo].[Consumer]
(
    [ConsumerId]      INT    NOT NULL    IDENTITY,
	[IndividualId]    INT    NOT NULL,
	[EmployerId]      INT    NOT NULL
)
GO

ALTER TABLE [dbo].[Consumer]
    ADD CONSTRAINT [PK_Consumer] PRIMARY KEY
    (
        [ConsumerId]
    )
GO

ALTER TABLE [dbo].[Consumer]
    ADD CONSTRAINT [UK_Consumer_IndividualId] UNIQUE
    (
        [IndividualId] 
    )
GO

ALTER TABLE [dbo].[Consumer]
    ADD CONSTRAINT [FK_Consumer_IndividualId] FOREIGN KEY
    (
        [IndividualId]
    ) 
    REFERENCES [dbo].[Individual] 
    (
        [IndividualId]
    )
GO

ALTER TABLE [dbo].[Consumer]
    ADD CONSTRAINT [FK_Consumer_EmployerId] FOREIGN KEY
    (
        [EmployerId]
    ) 
    REFERENCES [dbo].[Employer] 
    (
        [EmployerId]
    )
GO