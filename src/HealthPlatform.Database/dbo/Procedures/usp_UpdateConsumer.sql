CREATE PROCEDURE [dbo].[usp_UpdateConsumer]
	@ConsumerId         INT,
	@Username           NVARCHAR(64),
	@PasswordHash       NVARCHAR(128) = NULL,
	@FirstName          NVARCHAR(128),
	@LastName           NVARCHAR(128),
	@Ssn                CHAR(11),
	@Street             NVARCHAR(256),
	@City               NVARCHAR(128),
	@ZipCode            NVARCHAR(16),
	@StateId            INT,
	@PhoneNumber        VARCHAR(16)
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY
		UPDATE sc
		SET sc.[Username] = @Username
		FROM [dbo].[Consumer] c
		INNER JOIN [dbo].[SecurityLogin] sc ON sc.[IndividualId] = c.[IndividualId]
		WHERE c.[ConsumerId] = @ConsumerId

		IF @PasswordHash IS NOT NULL
			UPDATE sc
		    SET sc.[PasswordHash] = @PasswordHash
		    FROM [dbo].[Consumer] c
		    INNER JOIN [dbo].[SecurityLogin] sc ON sc.[IndividualId] = c.[IndividualId]
		    WHERE c.[ConsumerId] = @ConsumerId

		UPDATE i
		SET
			i.[FirstName] = @FirstName,
			i.[LastName] = @LastName,
			i.[Ssn] = @Ssn
		FROM [dbo].[Consumer] c
		INNER JOIN [dbo].[Individual] i ON i.[IndividualId] = c.[IndividualId]
		WHERE c.[ConsumerId] = @ConsumerId

		UPDATE a
		SET
			a.[Street] = @Street,
			a.[City] = @City,
			a.[ZipCode] = @ZipCode,
			a.[StateId] = @StateId
		FROM [dbo].[AddressConnection] ac
		INNER JOIN [dbo].[Address] a ON a.[AddressId] = ac.[AddressId]
		WHERE ac.[ObjectId] = @ConsumerId
		AND ac.[ObjectType] = 2 -- Consumer = 2

		UPDATE pn
		SET
			pn.[Number] = @PhoneNumber
		FROM [dbo].[AddressConnection] ac
		INNER JOIN [dbo].[PhoneNumber] pn ON pn.[AddressId] = ac.[AddressId]
		WHERE ac.[ObjectId] = @ConsumerId
		AND ac.[ObjectType] = 2 -- Consumer = 2

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
