CREATE PROCEDURE [dbo].[usp_AddEnrollment]
	@ElectionAmount        FLOAT,
	@ConsumerId            INT,
	@BenefitsOfferingId    INT,
	@EnrollmentId          INT    OUTPUT
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY		
		INSERT INTO [dbo].[Enrollment] 
		(
			[ElectionAmount],
			[ConsumerId],
			[BenefitsOfferingId],
			[Status]
		)
		VALUES 
		(
			@ElectionAmount,
			@ConsumerId,
			@BenefitsOfferingId,
			0 -- NotInitialized = 0
		) 

		SELECT @EnrollmentId = SCOPE_IDENTITY()

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
