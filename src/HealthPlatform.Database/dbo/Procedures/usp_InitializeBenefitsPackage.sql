CREATE PROCEDURE [dbo].[usp_InitializeBenefitsPackage]
	@BenefitsPackageId    INT
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY		
		UPDATE [dbo].[BenefitsPackageStatus]
		SET
			[Status] = 1, -- Initialized = 1
			[Date] = GETDATE()
		WHERE [BenefitsPackageId] = @BenefitsPackageId

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
