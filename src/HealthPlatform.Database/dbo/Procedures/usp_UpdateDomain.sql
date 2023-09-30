CREATE PROCEDURE [dbo].[usp_UpdateDomain]
	@DomainId       INT,
	@Name           NVARCHAR(128),
	@Alias          NVARCHAR(128),
	@Street         NVARCHAR(256),
	@City           NVARCHAR(128),
	@ZipCode        NVARCHAR(16),
	@StateId        INT,
	@PhoneNumber    VARCHAR(16)
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY
		UPDATE [dbo].[Domain]
		SET 
			[Name] = @Name,
			[Alias] = @Alias
		WHERE [DomainId] = @DomainId

		UPDATE a
		SET
			a.[City] = @City,
			a.[Street] = @Street,
			a.[ZipCode] = @ZipCode,
			a.[StateId] = @StateId
		FROM [dbo].[Domain] d
		INNER JOIN [dbo].[AddressConnection] ac on ac.[ObjectId] = d.[DomainId]
			AND ac.[ObjectType] = 0 -- Domain = 0
		INNER JOIN [dbo].[Address] a on a.[AddressId] = ac.[AddressId]
		WHERE d.[DomainId] = @DomainId

		UPDATE pn
		SET
			pn.[Number] = @PhoneNumber
		FROM [dbo].[Domain] d
		INNER JOIN [dbo].[AddressConnection] ac on ac.[ObjectId] = d.[DomainId]
			AND ac.[ObjectType] = 0 -- Domain = 0
		INNER JOIN [dbo].[PhoneNumber] pn on pn.[AddressId] = ac.[AddressId]
		WHERE d.[DomainId] = @DomainId

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
GO
