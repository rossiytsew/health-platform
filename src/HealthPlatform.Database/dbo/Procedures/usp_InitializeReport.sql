CREATE PROCEDURE [dbo].[usp_InitializeReport]
	@ReportId INT,
	@FileName NVARCHAR(128)
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY		
		UPDATE [dbo].[Report]
		SET
			[Status] = 2, -- Available = 2
			[FileName] = @FileName
		WHERE [ReportId] = @ReportId

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
