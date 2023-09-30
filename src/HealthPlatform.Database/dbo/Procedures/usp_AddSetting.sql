CREATE PROCEDURE [dbo].[usp_AddSetting]
	@ObjectId      INT,
	@ObjectType    INT,
	@Name          NVARCHAR(128),
	@Value         NVARCHAR(64)
AS
BEGIN
	INSERT INTO [dbo].[SettingConnection] 
	(
		[ObjectId], 
		[ObjectType], 
		[Value], 
		[SettingId]
	)
	SELECT
		@ObjectId,
		@ObjectType,
		@Value,
		[SettingId]
	FROM [dbo].[Setting]
	WHERE [Name] = @Name
END
