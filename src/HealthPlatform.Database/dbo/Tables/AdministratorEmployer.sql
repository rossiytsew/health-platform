CREATE TABLE [dbo].[AdministratorEmployer]
(
    [AdministratorId]    INT    NOT NULL,
    [EmployerId]         INT    NOT NULL
)
GO

ALTER TABLE [dbo].[AdministratorEmployer]
    ADD CONSTRAINT [PK_AdministratorEmployer] PRIMARY KEY
    (
        [AdministratorId],
        [EmployerId]
    )
GO

ALTER TABLE [dbo].[AdministratorEmployer]
    ADD CONSTRAINT [FK_AdministratorEmployer_AdministratorId] FOREIGN KEY
    (
        [AdministratorId]
    ) 
    REFERENCES [dbo].[Administrator] 
    (
        [AdministratorId]
    )
GO

ALTER TABLE [dbo].[AdministratorEmployer]
    ADD CONSTRAINT [FK_AdministratorEmployer_EmployerId] FOREIGN KEY
    (
        [EmployerId]
    ) 
    REFERENCES [dbo].[Employer] 
    (
        [EmployerId]
    )
GO