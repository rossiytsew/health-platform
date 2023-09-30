CREATE PROCEDURE [dbo].[usp_GetReportFields]
	@ReportId INT
AS
BEGIN
	SELECT
		[Name]
	FROM [dbo].[Field]
	WHERE [ReportId] = @ReportId
END
