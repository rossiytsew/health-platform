CREATE TABLE [dbo].[AddressConnection]
(
    [AddressId]     INT        NOT NULL,
    [ObjectId]      INT        NOT NULL,
    [ObjectType]    TINYINT    NOT NULL
)
GO

ALTER TABLE [dbo].[AddressConnection]
    ADD CONSTRAINT [PK_AddressConnection] PRIMARY KEY
    (
        [AddressId],
        [ObjectId],
        [ObjectType]
    )
GO

ALTER TABLE [dbo].[AddressConnection]
    ADD CONSTRAINT [FK_AddressConnection_AddressId] FOREIGN KEY
    (
        [AddressId]
    ) 
    REFERENCES [dbo].[Address] 
    (
        [AddressId]
    )
GO