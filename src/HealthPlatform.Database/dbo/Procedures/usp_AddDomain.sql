CREATE PROCEDURE [dbo].[usp_AddDomain]
	@Name           NVARCHAR(128),
	@Alias          NVARCHAR(128),
	@Street         NVARCHAR(256),
	@City           NVARCHAR(128),
	@ZipCode        NVARCHAR(16),
	@StateId        INT,
	@PhoneNumber    VARCHAR(16),
	@DomainId       INT    OUTPUT,
	@AddressId      INT    OUTPUT
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY		
		INSERT INTO [dbo].[Domain] ([Name], [Alias])
		VALUES (@Name, @Alias)

		SELECT @DomainId = SCOPE_IDENTITY()

		INSERT INTO [dbo].[Address] ([Street], [City], [ZipCode], [StateId])
		VALUES (@Street, @City, @ZipCode, @StateId)

		SELECT @AddressId = SCOPE_IDENTITY()

		INSERT INTO [dbo].[PhoneNumber] ([Number], [AddressId])
		VALUES (@PhoneNumber, @AddressId)

		INSERT INTO [dbo].[AddressConnection] ([AddressId], [ObjectId], [ObjectType])
		VALUES (@AddressId, @DomainId, 0) -- Domain = 0

		INSERT INTO [dbo].[SettingConnection] ([ObjectId], [ObjectType], [SettingId], [Value])
		SELECT 
			@DomainId,
			0, -- Domain = 0
			s.SettingId,
			s.[Default]
		FROM [dbo].[Setting] s

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
GO
