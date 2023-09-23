CREATE TABLE [dbo].[Address]
(
    [AddressId]    INT              NOT NULL    IDENTITY,
    [Street]       NVARCHAR(256)    NOT NULL,
    [City]         NVARCHAR(128)    NOT NULL,
    [ZipCode]      NVARCHAR(16)     NOT NULL,
    [StateId]      INT              NOT NULL
)
GO

ALTER TABLE [dbo].[Address]
    ADD CONSTRAINT [PK_Address] PRIMARY KEY
    (
        [AddressId] 
    )
GO

ALTER TABLE [dbo].[Address]
    ADD CONSTRAINT [FK_Address_StateId] FOREIGN KEY
    (
        [StateId]
    ) 
    REFERENCES [dbo].[State] 
    (
        [StateId]
    )
GO