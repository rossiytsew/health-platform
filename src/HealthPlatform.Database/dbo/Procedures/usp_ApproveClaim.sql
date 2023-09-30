CREATE PROCEDURE [dbo].[usp_ApproveClaim]
	@ClaimId    INT,
	@Notes		NVARCHAR(512)
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY	
	
		DECLARE @ConsumerId INT;
		DECLARE @TransactionAmount FLOAT;
		DECLARE @ClaimNumber NVARCHAR(64);

		UPDATE cs
		SET 
			cs.[Status] = 1, -- Approved = 1
			cs.[Note] = @Notes,
			cs.[Date] = GETDATE(),
			@ConsumerId = e.ConsumerId,
			@TransactionAmount = c.ClaimAmount,
			@ClaimNumber = c.ClaimNumber
		FROM [dbo].[Claim] c
		INNER JOIN [dbo].[ClaimStatus] cs ON cs.[ClaimId] = c.[ClaimId]
		INNER JOIN [dbo].Enrollment e ON e.EnrollmentId = c.EnrollmentId
		WHERE c.[ClaimId] = @ClaimId

		INSERT INTO [dbo].[Transaction]
		(
			[TransactionAmount],
			[ConsumerId],
			[Date],
			[Note]
		)
		VALUES
		(
			-@TransactionAmount,
			@ConsumerId,
			GETDATE(),
			@ClaimNumber + ' approved'
		)

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
