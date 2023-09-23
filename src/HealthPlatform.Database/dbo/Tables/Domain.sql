CREATE TABLE [dbo].[Domain]
(
    [DomainId]    INT              NOT NULL    IDENTITY,
    [Name]        NVARCHAR(128)    NOT NULL,
    [Alias]       NVARCHAR(128)    NOT NULL
)
GO

ALTER TABLE [dbo].[Domain]
    ADD CONSTRAINT [PK_Domain] PRIMARY KEY
    (
        [DomainId] 
    )
GO

ALTER TABLE [dbo].[Domain]
    ADD CONSTRAINT [UK_Domain_Name] UNIQUE
    (
        [Name] 
    )
GO

ALTER TABLE [dbo].[Domain]
    ADD CONSTRAINT [UK_Domain_Alias] UNIQUE
    (
        [Alias] 
    )
GO
