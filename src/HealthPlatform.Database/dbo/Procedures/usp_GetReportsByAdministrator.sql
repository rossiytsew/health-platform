CREATE PROCEDURE [dbo].[usp_GetReportsByAdministrator]
	@AdministratorName	NVARCHAR(64),
	@DomainId			INT,
	@ReportType			INT
AS
BEGIN
	SELECT
		r.[ReportId],
		r.[Type],
		r.[Format],
		r.[RequiredEmailNotification],
		r.[Status],
		r.[FileName],
		r.[DateTime],
		r.[AdministratorId]
	FROM [dbo].[Report] r
	INNER JOIN [dbo].Administrator a on r.AdministratorId = a.AdministratorId
	WHERE r.[Type] = @ReportType
	AND a.[Name] = @AdministratorName
	AND a.[DomainId] = @DomainId
END
