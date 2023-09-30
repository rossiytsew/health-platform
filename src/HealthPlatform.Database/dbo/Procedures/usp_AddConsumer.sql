CREATE PROCEDURE [dbo].[usp_AddConsumer]
	@Username           NVARCHAR(64),
	@PasswordHash       NVARCHAR(128),
	@DomainId           INT,
	@EmployerId         INT,
	@FirstName          NVARCHAR(128),
	@LastName           NVARCHAR(128),
	@Ssn                CHAR(11),
	@Street             NVARCHAR(256),
	@City               NVARCHAR(128),
	@ZipCode            NVARCHAR(16),
	@StateId            INT,
	@PhoneNumber        VARCHAR(16),
	@ConsumerId         INT OUTPUT,
	@SecurityLoginId    INT OUTPUT,
	@AddressId          INT OUTPUT
AS
BEGIN
	BEGIN TRANSACTION;

	DECLARE @IndividualId INT;

	BEGIN TRY
		INSERT INTO [dbo].[Individual] ([FirstName], [LastName], [Ssn])
		VALUES (@FirstName, @LastName, @Ssn) 

		SELECT @IndividualId = SCOPE_IDENTITY()

		INSERT INTO [dbo].[SecurityLogin] 
		(
			[Username], 
			[LoginType], 
			[DomainId], 
			[EmployerId], 
			[IndividualId],
			[PasswordHash]
		)
		VALUES 
		(
			@Username, 
			2, -- Consumer = 2
			@DomainId,
			@EmployerId,
			@IndividualId,
			@PasswordHash
		)

		SELECT @SecurityLoginId = SCOPE_IDENTITY()

		INSERT INTO [dbo].[Address] ([Street], [City], [ZipCode], [StateId])
		VALUES (@Street, @City, @ZipCode, @StateId)

		SELECT @AddressId = SCOPE_IDENTITY()

		INSERT INTO [dbo].[PhoneNumber] ([Number], [AddressId])
		VALUES (@PhoneNumber, @AddressId)

		INSERT INTO [dbo].[Consumer] ([IndividualId], [EmployerId])
		VALUES (@IndividualId, @EmployerId)

		SELECT @ConsumerId = SCOPE_IDENTITY()

		INSERT INTO [dbo].[AddressConnection] ([AddressId], [ObjectId], [ObjectType])
		VALUES (@AddressId, @ConsumerId, 2) -- Consumer = 2

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
