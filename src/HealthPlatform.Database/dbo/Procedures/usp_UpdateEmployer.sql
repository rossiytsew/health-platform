CREATE PROCEDURE [dbo].[usp_UpdateEmployer]
	@EmployerId       INT,
	@Name             NVARCHAR(128),
	@Code             NVARCHAR(32),
	@Logo             VARBINARY(MAX) = NULL,
	@Street           NVARCHAR(256),
	@City             NVARCHAR(128),
	@ZipCode          NVARCHAR(16),
	@StateId          INT,
	@PhoneNumber      VARCHAR(16)
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY
		UPDATE [dbo].[Employer]
		SET 
			[Name] = @Name,
			[Code] = @Code,
			[Logo] = @Logo
		WHERE [EmployerId] = @EmployerId

		UPDATE a
		SET
			a.[City] = @City,
			a.[Street] = @Street,
			a.[ZipCode] = @ZipCode,
			a.[StateId] = @StateId
		FROM [dbo].[Employer] e
		INNER JOIN [dbo].[AddressConnection] ac on ac.[ObjectId] = e.[EmployerId]
			AND ac.ObjectType = 1 -- Employer = 1
		INNER JOIN [dbo].[Address] a on a.[AddressId] = ac.[AddressId]
		WHERE e.[EmployerId] = @EmployerId

		UPDATE pn
		SET
			pn.[Number] = @PhoneNumber
		FROM [dbo].[Employer] e
		INNER JOIN [dbo].[AddressConnection] ac on ac.ObjectId = e.[EmployerId]
			AND ac.ObjectType = 1 -- Employer = 1
		INNER JOIN [dbo].[PhoneNumber] pn on pn.[AddressId] = ac.[AddressId]
		WHERE e.[EmployerId] = @EmployerId

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
GO

