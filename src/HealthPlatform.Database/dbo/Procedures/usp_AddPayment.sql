CREATE PROCEDURE [dbo].[usp_AddPayment]
	@PaymentAmount    FLOAT,
	@Date             DATE,
	@EnrollmentId     INT
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY		
		INSERT INTO [dbo].[Payment] 
		(
			[PaymentAmount],
			[Date],
			[EnrollmentId],
			[Status]
		)
		VALUES 
		(
			@PaymentAmount,
			@Date,
			@EnrollmentId,
			0 -- Pending = 0
		) 

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
