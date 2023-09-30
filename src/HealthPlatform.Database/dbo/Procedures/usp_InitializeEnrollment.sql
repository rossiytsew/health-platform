CREATE PROCEDURE [dbo].[usp_InitializeEnrollment]
	@EnrollmentId INT
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY		
		UPDATE [dbo].[Enrollment]
		SET
			[Status] = 1 -- Initialized = 1
		WHERE [EnrollmentId] = @EnrollmentId

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
