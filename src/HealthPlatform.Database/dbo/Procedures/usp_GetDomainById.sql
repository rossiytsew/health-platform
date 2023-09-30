CREATE PROCEDURE [dbo].[usp_GetDomainById]
	@DomainId INT
AS
BEGIN
	SELECT 
		d.[DomainId],
		d.[Name],
		d.[Alias],
		a.[AddressId],
		a.[Street],
		a.[City],
		a.[ZipCode],
		s.[StateId],
		s.[Name] [StateName],
		s.[ShortName] [StateShortName],
		pn.[Number] [PhoneNumber]
	FROM [dbo].[Domain] d
	INNER JOIN [dbo].[AddressConnection] ac ON ac.ObjectId = d.DomainId
		and ac.ObjectType = 0 -- Domain = 0
	INNER JOIN [dbo].[Address] a ON a.AddressId = ac.AddressId
	INNER JOIN [dbo].[PhoneNumber] pn ON pn.AddressId = a.AddressId
	INNER JOIN [dbo].[State] s ON s.StateId = a.StateId
	WHERE d.[DomainId] = @DomainId
END
