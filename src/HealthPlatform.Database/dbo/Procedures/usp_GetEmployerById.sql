CREATE PROCEDURE [dbo].[usp_GetEmployerById]
	@EmployerId INT,
	@AdministratorName NVARCHAR(64) = NULL,
	@DomainId INT = NULL
AS
BEGIN
	SELECT
		e.[EmployerId],
		e.[Name],
		e.[Code],
		e.[Logo],
		a.[AddressId],
		a.[Street],
		a.[City],
		a.[ZipCode],
		s.[StateId],
		s.[Name] [StateName],
		s.[ShortName] [StateShortName],
		pn.[Number] [PhoneNumber]
	FROM [dbo].[Employer] e
    INNER JOIN [dbo].[AddressConnection] ac 
    	ON ac.ObjectId = e.EmployerId
    	AND ac.ObjectType = 1 -- Employer = 1
    INNER JOIN [dbo].[Address] a ON a.[AddressId] = ac.[AddressId]
    INNER JOIN [dbo].[PhoneNumber] pn ON pn.[AddressId] = a.[AddressId]
    INNER JOIN [dbo].[State] s ON s.[StateId]= a.[StateId]
	INNER JOIN [dbo].[AdministratorEmployer] ae ON ae.[EmployerId] = e.[EmployerId]
    INNER JOIN [dbo].[Administrator] ad ON ad.[AdministratorId] = ae.[AdministratorId]
	WHERE e.[EmployerId] = @EmployerId
	AND (@AdministratorName IS NULL OR ad.[Name] = @AdministratorName)
	AND (@DomainId IS NULL OR ad.[DomainId] = @DomainId)
END
