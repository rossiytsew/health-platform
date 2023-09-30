CREATE PROCEDURE [dbo].[usp_UpdateBenefitsPackage]
	@BenefitsPackageId    INT,
	@Name                 NVARCHAR(128),
	@StartDate            DATE,
	@EndDate              DATE,
	@PayrollFrequency     TINYINT
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY		
		UPDATE [dbo].[BenefitsPackage]
		SET
			[Name] = @Name,
			[StartDate] = @StartDate,
			[EndDate] = @EndDate,
			[PayrollFrequency] = @PayrollFrequency
		WHERE [BenefitsPackageId] = @BenefitsPackageId

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
