CREATE PROCEDURE [dbo].[usp_GetStateByName]
	@StateName NVARCHAR(128)
AS
BEGIN
	SELECT 
		[StateId],
		[Name] [StateName],
		[ShortName] [StateShortName]
	FROM [dbo].[State]
	WHERE [Name] = @StateName
END
GO