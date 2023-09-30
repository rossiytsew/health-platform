CREATE PROCEDURE [dbo].[usp_GetReportById]
	@ReportId INT
AS
BEGIN
	SELECT
		[ReportId],
		[Type],
		[Format],
		[RequiredEmailNotification],
		[Status],
		[FileName],
		[DateTime],
		[AdministratorId]
	FROM [dbo].[Report]
	WHERE [ReportId] = @ReportId
END
