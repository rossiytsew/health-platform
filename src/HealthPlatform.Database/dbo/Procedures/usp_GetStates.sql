CREATE PROCEDURE [dbo].[usp_GetStates]
AS
BEGIN
	SELECT 
		[StateId],
		[Name] [StateName],
		[ShortName] [StateShortName]
	FROM [dbo].[State]
END
GO
