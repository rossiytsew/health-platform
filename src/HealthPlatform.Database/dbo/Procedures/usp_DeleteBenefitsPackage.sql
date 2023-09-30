CREATE PROCEDURE [dbo].[usp_DeleteBenefitsPackage]
	@BenefitsPackageId INT
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY		
		DELETE
		FROM [dbo].[BenefitsPackage]
		WHERE [BenefitsPackageId] = @BenefitsPackageId

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
