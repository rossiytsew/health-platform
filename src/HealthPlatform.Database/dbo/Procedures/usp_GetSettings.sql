CREATE PROCEDURE [dbo].[usp_GetSettings]
	@ObjectId      INT,
	@ObjectType    INT
AS
BEGIN
	SELECT
		s.[Name],
		s.[Type],
		sc.[Value]
	FROM [dbo].[Setting] s
	INNER JOIN [dbo].[SettingConnection] sc ON sc.SettingId = s.SettingId
	WHERE sc.ObjectId = @ObjectId AND sc.ObjectType = @ObjectType
END
