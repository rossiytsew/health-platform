CREATE PROCEDURE [dbo].[usp_GetEmployersByAdministratorId]
	@AdministratorId INT
AS
BEGIN
	SELECT
        e.[EmployerId],
        e.[Name],
        e.[Code],
        ad.[AddressId],
		ad.[Street],
		ad.[City],
		ad.[ZipCode],
		s.[StateId],
		s.[Name] [StateName],
		s.[ShortName] [StateShortName],
		pn.[Number] [PhoneNumber]
    FROM [dbo].[Employer] e
    INNER JOIN [dbo].[AdministratorEmployer] ae ON ae.[EmployerId] = e.[EmployerId]
    INNER JOIN [dbo].[AddressConnection] ac ON ac.[ObjectId] = e.[EmployerId]
		AND ac.[ObjectType] = 1 -- Employer = 1
	INNER JOIN [dbo].[Address] ad ON ad.[AddressId] = ac.AddressId
	INNER JOIN [dbo].[State] s ON s.[StateId] = ad.[StateId]
	INNER JOIN [dbo].[PhoneNumber] pn ON pn.[AddressId] = ad.[AddressId]
    WHERE ae.[AdministratorId] = @AdministratorId
END
