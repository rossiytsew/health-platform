CREATE PROCEDURE [dbo].[usp_UpdateBenefitsOffering]
	@BenefitsOfferingId    INT,
	@Name                  NVARCHAR(128),
	@Type                  TINYINT,
	@ContributionAmount    FLOAT
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY
		UPDATE [dbo].[BenefitsOffering]
		SET
			[Name] = @Name,
			[Type] = @Type,
			[ContributionAmount] = @ContributionAmount
		WHERE [BenefitsOfferingId] = @BenefitsOfferingId

 		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		THROW;
	END CATCH
END
