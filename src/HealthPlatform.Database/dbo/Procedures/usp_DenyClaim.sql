CREATE PROCEDURE [dbo].[usp_DenyClaim]
	@ClaimId    INT,
	@Notes		NVARCHAR(512)
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY	
	
		UPDATE cs
		SET 
			cs.[Status] = 2, -- Deny = 2
			cs.[Note] = @Notes,
			cs.[Date] = GETDATE()
		FROM [dbo].[Claim] c
		INNER JOIN [dbo].[ClaimStatus] cs ON cs.[ClaimId] = c.[ClaimId]
		WHERE c.[ClaimId] = @ClaimId

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
