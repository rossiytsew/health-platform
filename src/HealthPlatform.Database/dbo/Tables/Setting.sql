CREATE TABLE [dbo].[Setting]
(
    [SettingId]    INT              NOT NULL    IDENTITY,
    [Name]         NVARCHAR(128)    NOT NULL,
    [Type]         VARCHAR(64)      NOT NULL,
    [Default]      NVARCHAR(128)    NOT NULL,
)
GO

ALTER TABLE [dbo].[Setting]
    ADD CONSTRAINT [PK_Setting] PRIMARY KEY
    (
        [SettingId] 
    )
GO

ALTER TABLE [dbo].[Setting]
    ADD CONSTRAINT [UK_Setting_Name] UNIQUE
    (
        [Name] 
    )
GO
