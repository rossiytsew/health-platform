CREATE TABLE [dbo].[Employer]
(
    [EmployerId]    INT               NOT NULL    IDENTITY,
    [Name]          NVARCHAR(128)     NOT NULL,
    [Code]          NVARCHAR(32)      NOT NULL,
    [Logo]          VARBINARY(MAX)    NULL
)
GO

ALTER TABLE [dbo].[Employer]
    ADD CONSTRAINT [PK_Employer] PRIMARY KEY
    (
        [EmployerId] 
    )
GO

ALTER TABLE [dbo].[Employer]
    ADD CONSTRAINT [UK_Employer_Name] UNIQUE
    (
        [Name] 
    )
GO

ALTER TABLE [dbo].[Employer]
    ADD CONSTRAINT [UK_Employer_Code] UNIQUE
    (
        [Code] 
    )
GO