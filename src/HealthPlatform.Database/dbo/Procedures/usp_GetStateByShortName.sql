CREATE PROCEDURE [dbo].[usp_GetStateByShortName]
	@StateShortName NVARCHAR(128)
AS
BEGIN
	SELECT 
		[StateId],
		[Name] [StateName],
		[ShortName] [StateShortName]
	FROM [dbo].[State]
	WHERE [ShortName] = @StateShortName
END
GO