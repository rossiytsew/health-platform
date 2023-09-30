CREATE PROCEDURE [dbo].[usp_AddUser]
	@Username           NVARCHAR(64),
	@LoginType          TINYINT,
	@PasswordHash       NVARCHAR(128),
	@DomainId           INT,
	@EmployerId         INT = NULL,
	@FirstName          NVARCHAR(128),
	@LastName           NVARCHAR(128),
	@Email              NVARCHAR(128),
	@SecurityLoginId    INT OUTPUT
AS
BEGIN
	BEGIN TRANSACTION;

	DECLARE @IndividualId INT;

	BEGIN TRY		
		INSERT INTO [dbo].[Individual] ([FirstName], [LastName], [Email])
		VALUES (@FirstName, @LastName, @Email) 

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
			@LoginType,
			@DomainId,
			@EmployerId,
			@IndividualId,
			@PasswordHash
		)

		SELECT @SecurityLoginId = SCOPE_IDENTITY()

		IF @LoginType = 0 -- Administrator = 0
			INSERT INTO [dbo].[Administrator] ([DomainId], [Name])
			VALUES (@DomainId, @Username)

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END