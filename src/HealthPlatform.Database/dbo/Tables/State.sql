CREATE TABLE [dbo].[State]
(
    [StateId]      INT              NOT NULL    IDENTITY,
    [Name]         NVARCHAR(128)    NOT NULL,
    [ShortName]    NVARCHAR(8)      NOT NULL
)
GO

ALTER TABLE [dbo].[State]
    ADD CONSTRAINT [PK_State] PRIMARY KEY
    (
        [StateId] 
    )
GO

ALTER TABLE [dbo].[State]
    ADD CONSTRAINT [UK_State_Name] UNIQUE
    (
        [Name]
    )
GO

ALTER TABLE [dbo].[State]
    ADD CONSTRAINT [UK_State_ShortName] UNIQUE
    (
        [ShortName]
    )
GO