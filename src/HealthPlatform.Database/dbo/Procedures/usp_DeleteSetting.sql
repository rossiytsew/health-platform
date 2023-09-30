CREATE PROCEDURE [dbo].[usp_DeleteSetting]
	@ObjectId      INT,
	@ObjectType    INT,
	@Name          NVARCHAR(128)
AS
BEGIN
	DELETE sc
	FROM [dbo].[SettingConnection] sc
	INNER JOIN [dbo].[Setting] s ON s.SettingId = sc.SettingId
	WHERE s.[Name] = @Name
		AND sc.[ObjectId] = @ObjectId
		AND sc.[ObjectType] = @ObjectType
END
