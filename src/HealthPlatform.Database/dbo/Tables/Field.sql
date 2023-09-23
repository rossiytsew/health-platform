CREATE TABLE [dbo].[Field]
(
	[FieldId]     INT              NOT NULL    IDENTITY,
	[Name]        NVARCHAR(128)    NOT NULL,
	[ReportId]    INT              NOT NULL
)
GO

ALTER TABLE [dbo].[Field]
    ADD CONSTRAINT [PK_Field] PRIMARY KEY
    (
        [FieldId] 
    )
GO

ALTER TABLE [dbo].[Field]
    ADD CONSTRAINT [FK_Field_ReportId] FOREIGN KEY
    (
        [ReportId]
    ) 
    REFERENCES [dbo].[Report] 
    (
        [ReportId]
    )
    ON DELETE CASCADE
GO