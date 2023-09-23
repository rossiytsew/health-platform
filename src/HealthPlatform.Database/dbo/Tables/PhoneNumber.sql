CREATE TABLE [dbo].[PhoneNumber]
(
    [PhoneNumberId]    INT            NOT NULL    IDENTITY,
    [Number]           VARCHAR(16)    NOT NULL,
    [AddressId]        INT            NOT NULL
)
GO

ALTER TABLE [dbo].[PhoneNumber]
    ADD CONSTRAINT [PK_PhoneNumbe] PRIMARY KEY
    (
        [PhoneNumberId] 
    )
GO

ALTER TABLE [dbo].[PhoneNumber]
    ADD CONSTRAINT [FK_PhoneNumber_AddressId] FOREIGN KEY
    (
        [AddressId]
    ) 
    REFERENCES [dbo].[Address] 
    (
        [AddressId]
    )
GO