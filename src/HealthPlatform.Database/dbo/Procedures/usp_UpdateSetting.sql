CREATE PROCEDURE [dbo].[usp_UpdateSetting]
	@ObjectId      INT,
	@ObjectType    INT,
	@Name          NVARCHAR(128),
	@Value         NVARCHAR(64)
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY		
		UPDATE sc
		SET
			sc.[Value] = @Value
		FROM [dbo].[SettingConnection] sc
		INNER JOIN [dbo].[Setting] s ON s.SettingId = sc.SettingId
		WHERE s.[Name] = @Name
			AND sc.[ObjectId] = @ObjectId
			AND sc.[ObjectType] = @ObjectType

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
