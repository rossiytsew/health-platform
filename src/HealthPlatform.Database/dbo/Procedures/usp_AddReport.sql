CREATE PROCEDURE [dbo].[usp_AddReport]
	@AdministratorName            NVARCHAR(64),
	@DomainId                     INT,
	@Type                         INT,
	@Format                       INT,
	@RequiredEmailNotification    BIT,
	@ReportId                     INT    OUTPUT
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY
		DECLARE @AdministratorId  INT;

		SELECT
			@AdministratorId = a.AdministratorId
		FROM [dbo].[Administrator] a
		WHERE a.[Name] = @AdministratorName
		AND a.[DomainId] = @DomainId

		IF @AdministratorId IS NULL
			RAISERROR ('No administrator with this name.', 16, 1);

		INSERT INTO [dbo].[Report] 
		(
			[Type],
			[Status],
			[Format],
			[DateTime],
			[RequiredEmailNotification],
			[AdministratorId]
		)
		VALUES
		(
			@Type,
			0, -- Requested = 0
			@Format,
			GETDATE(),
			@RequiredEmailNotification,
			@AdministratorId
		)

		SELECT @ReportId = SCOPE_IDENTITY()

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
