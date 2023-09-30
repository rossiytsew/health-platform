CREATE PROCEDURE [dbo].[usp_AddBenefitsOffering]
	@Name                  NVARCHAR(128),
	@Type                  TINYINT,
	@ContributionAmount    FLOAT,
	@BenefitsPackageId     INT,
	@BenefitsOfferingId    INT OUTPUT
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY		
		INSERT INTO [dbo].[BenefitsOffering] 
		(
			[Name], 
			[Type],
			[ContributionAmount],
			[BenefitsPackageId]
		)
		VALUES 
		(
			@Name,
			@Type,
			@ContributionAmount,
			@BenefitsPackageId
		) 

		SELECT @BenefitsOfferingId = SCOPE_IDENTITY()

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
