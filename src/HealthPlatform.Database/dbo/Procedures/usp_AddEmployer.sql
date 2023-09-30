CREATE PROCEDURE [dbo].[usp_AddEmployer]
	@Name                 NVARCHAR(128),
	@Code                 NVARCHAR(32),
	@Logo                 VARBINARY(MAX) = NULL,
	@Street               NVARCHAR(256),
	@City                 NVARCHAR(128),
	@ZipCode              NVARCHAR(16),
	@StateId              INT,
	@PhoneNumber          VARCHAR(16),
	@AdministratorName    NVARCHAR(64),
	@DomainId             INT,
	@EmployerId           INT    OUTPUT,
	@AddressId            INT    OUTPUT
AS
BEGIN
	BEGIN TRANSACTION;

	DECLARE @AdministratorId  INT;

	BEGIN TRY		
		INSERT INTO [dbo].[Employer] ([Name], [Code], [Logo])
		VALUES (@Name, @Code, @Logo) 

		SELECT @EmployerId = SCOPE_IDENTITY()

		INSERT INTO [dbo].[Address] ([Street], [City], [ZipCode], [StateId])
		VALUES (@Street, @City, @ZipCode, @StateId)

		SELECT @AddressId = SCOPE_IDENTITY()

		INSERT INTO [dbo].[PhoneNumber] ([Number], [AddressId])
		VALUES (@PhoneNumber, @AddressId)

		INSERT INTO [dbo].[AddressConnection] ([AddressId], [ObjectId], [ObjectType])
		VALUES (@AddressId, @EmployerId, 1) -- Employer = 1

		SELECT
			@AdministratorId = a.AdministratorId
		FROM [dbo].[Administrator] a
		WHERE a.[Name] = @AdministratorName
		AND a.[DomainId] = @DomainId

		IF @AdministratorId IS NULL
			RAISERROR ('No administrator with this name.', 16, 1);

		INSERT INTO [dbo].[AdministratorEmployer] ([AdministratorId], [EmployerId])
		VALUES (@AdministratorId, @EmployerId)
		
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
GO
