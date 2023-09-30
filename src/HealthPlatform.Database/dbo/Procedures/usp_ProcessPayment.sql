CREATE PROCEDURE [dbo].[usp_ProcessPayment]
	@PaymentId INT
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY		
		INSERT INTO [dbo].[Transaction]
		(
			[TransactionAmount],
			[ConsumerId],
			[Date],
			[Note]
		)
		SELECT
			p.[PaymentAmount],
			e.[ConsumerId],
			GETDATE(),
			bo.[Name] + ' payment'
		FROM [dbo].[Payment] p
		INNER JOIN [dbo].[Enrollment] e ON e.[EnrollmentId] = p.[EnrollmentId]
		INNER JOIN [dbo].[BenefitsOffering] bo ON bo.[BenefitsOfferingId] = e.[BenefitsOfferingId]
		WHERE p.[PaymentId] = @PaymentId

		UPDATE [dbo].[Payment]
		SET [Status] = 1 -- Payed = 1
		WHERE [PaymentId] = @PaymentId

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
