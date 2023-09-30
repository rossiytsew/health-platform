CREATE PROCEDURE [dbo].[usp_AddBenefitsPackage]
	@Name                 NVARCHAR(128),
	@StartDate            DATE,
	@EndDate              DATE,
	@EmployerId           INT,
	@PayrollFrequency     TINYINT,
	@BenefitsPackageId    INT OUTPUT
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY		
		INSERT INTO [dbo].[BenefitsPackage]
		(
			[Name],
			[StartDate],
			[EndDate],
			[EmployerId],
			[PayrollFrequency]
		)
		VALUES
		(
			@Name,
			@StartDate,
			@EndDate,
			@EmployerId,
			@PayrollFrequency
		)

		SELECT @BenefitsPackageId = SCOPE_IDENTITY()

		INSERT INTO [dbo].[BenefitsPackageStatus] 
		(
			[Status], 
			[Date],
			[BenefitsPackageId]
		)
		VALUES 
		(
			0, -- NotInitialized = 0
			GETDATE(),
			@BenefitsPackageId
		)

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
