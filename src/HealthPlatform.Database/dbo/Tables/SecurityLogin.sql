CREATE TABLE [dbo].[SecurityLogin]
(
    [SecurityLoginId]    INT              NOT NULL    IDENTITY,
    [Username]           NVARCHAR(64)     NOT NULL,
    [LoginType]          TINYINT          NOT NULL,
    [PasswordHash]       NVARCHAR(128)    NOT NULL,
    [IndividualId]       INT              NOT NULL,
    [DomainId]           INT              NOT NULL,
    [EmployerId]         INT              NULL
)
GO

ALTER TABLE [dbo].[SecurityLogin]
    ADD CONSTRAINT [PK_SecurityLogin] PRIMARY KEY
    (
        [SecurityLoginId] 
    )
GO

ALTER TABLE [dbo].[SecurityLogin]
    ADD CONSTRAINT [UK_SecurityLogin_Username_DomainId] UNIQUE
    (
        [Username],
        [DomainId]
    )
GO

ALTER TABLE [dbo].[SecurityLogin]
    ADD CONSTRAINT [FK_SecurityLogin_DomainId] FOREIGN KEY
    (
        [DomainId]
    ) 
    REFERENCES [dbo].[Domain] 
    (
        [DomainId]
    )
GO

ALTER TABLE [dbo].[SecurityLogin]
    ADD CONSTRAINT [FK_SecurityLogin_IndividualId] FOREIGN KEY
    (
        [IndividualId]
    ) 
    REFERENCES [dbo].[Individual] 
    (
        [IndividualId]
    )
GO