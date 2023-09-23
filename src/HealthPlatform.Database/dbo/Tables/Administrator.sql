CREATE TABLE [dbo].[Administrator]
(
    [AdministratorId]    INT             NOT NULL    IDENTITY,
    [DomainId]           INT             NOT NULL,
    [Name]               NVARCHAR(64)    NOT NULL
)
GO

ALTER TABLE [dbo].[Administrator]
    ADD CONSTRAINT [PK_Administrator] PRIMARY KEY
    (
        [AdministratorId] 
    )
GO

ALTER TABLE [dbo].[Administrator]
    ADD CONSTRAINT [UK_Administrator_Name_DomainId] UNIQUE
    (
        [Name],
        [DomainId]  
    )
GO

ALTER TABLE [dbo].[Administrator]
    ADD CONSTRAINT [FK_Administrator_DomainId] FOREIGN KEY
    (
        [DomainId]
    ) 
    REFERENCES [dbo].[Domain] 
    (
        [DomainId]
    )
GO
