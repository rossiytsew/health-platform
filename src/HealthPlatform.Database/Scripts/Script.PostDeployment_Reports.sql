EXEC dbo.usp_AddReport
	@AdministratorName = 'Slava Rossiytsev',
	@DomainId = 1,
	@Type = 0, -- Consumer = 0
	@Format = 0, -- Csv = 0
	@RequiredEmailNotification = 1,
	@ReportId = 0
GO
EXEC dbo.usp_AddReportField
	@ReportId = 1,
	@Name = 'FirstName',
	@FieldId = 0
GO
EXEC dbo.usp_AddReportField
	@ReportId = 1,
	@Name = 'LastName',
	@FieldId = 0
GO