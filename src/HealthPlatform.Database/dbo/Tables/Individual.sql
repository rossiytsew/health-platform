CREATE TABLE [dbo].[Individual]
(
    [IndividualId]    INT              NOT NULL    IDENTITY,
    [FirstName]       NVARCHAR(128)    NOT NULL,
    [LastName]        NVARCHAR(128)    NOT NULL,
    [Email]           VARCHAR(128)     NULL,
    [Ssn]             CHAR(11)         NULL
)
GO

ALTER TABLE [dbo].[Individual]
    ADD CONSTRAINT [PK_Individual] PRIMARY KEY
    (
        [IndividualId] 
    )
GO