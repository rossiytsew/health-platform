CREATE PROCEDURE [dbo].[usp_GetRequestedReports]
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
	WHERE [Status] = 0 -- Requested = 0
END
