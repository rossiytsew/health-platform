CREATE TABLE [dbo].[Report]
(
	[ReportId]                     INT              NOT NULL    IDENTITY,
	[Type]                         INT              NOT NULL,
    [Format]                       INT              NOT NULL,
    [RequiredEmailNotification]    BIT              NOT NULL,
    [Status]                       INT              NOT NULL,
    [FileName]                     NVARCHAR(128)    NULL,
    [AdministratorId]              INT              NOT NULL,
    [DateTime]                     DATETIME         NOT NULL
)
GO

ALTER TABLE [dbo].[Report]
    ADD CONSTRAINT [PK_Report] PRIMARY KEY
    (
        [ReportId] 
    )
GO

ALTER TABLE [dbo].[Report]
    ADD CONSTRAINT [FK_Report_AdministratorId] FOREIGN KEY
    (
        [AdministratorId]
    ) 
    REFERENCES [dbo].[Administrator] 
    (
        [AdministratorId]
    )
GO