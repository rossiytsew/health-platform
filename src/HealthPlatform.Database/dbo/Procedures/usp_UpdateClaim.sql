CREATE PROCEDURE [dbo].[usp_UpdateClaim]
	@ClaimId          INT,
	@ClaimAmount      FLOAT,
	@DateOfService    DATE,
	@EnrollmentId     INT
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY		

		UPDATE [dbo].[Claim]
		SET
			[ClaimAmount] = @ClaimAmount,
			[EnrollmentId] = @EnrollmentId,
			[DateOfService] = @DateOfService
		WHERE [ClaimId] = @ClaimId

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
