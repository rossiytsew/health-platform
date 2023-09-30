CREATE PROCEDURE [dbo].[usp_AddReportField]
	@ReportId    INT,
	@Name        NVARCHAR(128),
	@FieldId     INT    OUTPUT
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY
		INSERT INTO [dbo].[Field] 
		(
			[Name],
			[ReportId]
		)
		VALUES
		(
			@Name,
			@ReportId
		)

		SELECT @FieldId = SCOPE_IDENTITY()

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
