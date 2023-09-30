CREATE PROCEDURE [dbo].[usp_SetReportStatus]
	@ReportId INT,
	@Status INT
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY		
		UPDATE [dbo].[Report]
		SET
			[Status] = @Status
		WHERE [ReportId] = @ReportId

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
