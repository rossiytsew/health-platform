CREATE TABLE [dbo].[SettingConnection]
(
    [SettingId]     INT             NOT NULL,
    [ObjectId]      INT             NOT NULL,
    [ObjectType]    TINYINT         NOT NULL,
    [Value]         NVARCHAR(64)    NOT NULL
)
GO

ALTER TABLE [dbo].[SettingConnection]
    ADD CONSTRAINT [PK_SettingConnection] PRIMARY KEY
    (
        [SettingId],
        [ObjectId],
        [ObjectType]
    )
GO

ALTER TABLE [dbo].[SettingConnection]
    ADD CONSTRAINT [FK_SettingConnection_SettingId] FOREIGN KEY
    (
        [SettingId]
    ) 
    REFERENCES [dbo].[Setting] 
    (
        [SettingId]
    )
GO