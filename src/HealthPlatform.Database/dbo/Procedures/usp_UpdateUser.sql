CREATE PROCEDURE [dbo].[usp_UpdateUser]
	@SecurityLoginId    INT,
	@Username           NVARCHAR(64),
	@PasswordHash       NVARCHAR(128) = NULL,
	@FirstName          NVARCHAR(128),
	@LastName           NVARCHAR(128),
	@Email              NVARCHAR(128),
	@Ssn                CHAR(11) = NULL
AS
BEGIN
	BEGIN TRANSACTION;

	DECLARE 
		@LoginType INT,
		@OldUsername NVARCHAR(64),
		@DomainId INT;

	BEGIN TRY
		SELECT
			@LoginType = sl.[LoginType],
			@OldUsername = sl.[Username],
			@DomainId = sl.[DomainId]
		FROM [dbo].[SecurityLogin] sl
		WHERE sl.[SecurityLoginId] = @SecurityLoginId

		UPDATE [dbo].[SecurityLogin]
		SET
			[Username] = @Username
		WHERE [SecurityLoginId] = @SecurityLoginId

		IF @PasswordHash IS NOT NULL
			UPDATE [dbo].[SecurityLogin]
			SET [PasswordHash] = @PasswordHash
			WHERE [SecurityLoginId] = @SecurityLoginId

		UPDATE i
		SET
			i.[Email] = @Email,
			i.[FirstName] = @FirstName,
			i.[LastName] = @LastName,
			i.[Ssn] = @Ssn
		FROM [dbo].[SecurityLogin] sc
		INNER JOIN [dbo].[Individual] i ON i.IndividualId = sc.IndividualId
		WHERE sc.[SecurityLoginId] = @SecurityLoginId
		

		IF @LoginType = 0 -- Administrator = 0
			UPDATE [dbo].[Administrator]
			SET
				[Name] = @Username
			WHERE [Name] = @OldUsername
			AND [DomainId] = @DomainId

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
