CREATE PROCEDURE [dbo].[usp_UpdateEnrollment]
	@EnrollmentId          INT,
	@ElectionAmount        FLOAT,
	@BenefitsOfferingId    INT
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY		
		UPDATE [dbo].[Enrollment]
		SET
			[ElectionAmount] = @ElectionAmount,
			[BenefitsOfferingId] = @BenefitsOfferingId
		WHERE [EnrollmentId] = @EnrollmentId

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
