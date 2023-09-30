﻿CREATE PROCEDURE [dbo].[usp_GetConsumersByAdministratorId]
	@AdministratorId INT
AS
BEGIN
	SELECT
        c.[ConsumerId],
        sl.[SecurityLoginId],
        sl.[Username],
        sl.[PasswordHash],
        i.[FirstName],
        i.[LastName],
        i.[Email],
        i.[Ssn],
        ad.[AddressId],
		ad.[Street],
		ad.[City],
		ad.[ZipCode],
		s.[StateId],
		s.[Name] [StateName],
		s.[ShortName] [StateShortName],
		pn.[Number] [PhoneNumber]
    FROM [dbo].[Consumer] c
    INNER JOIN [dbo].[Individual] i ON i.[IndividualId] = c.[IndividualId]
    INNER JOIN [dbo].[SecurityLogin] sl ON sl.[IndividualId] = c.[IndividualId]
    INNER JOIN [dbo].[AdministratorEmployer] ae ON ae.[EmployerId] = sl.[EmployerId]
    INNER JOIN [dbo].[AddressConnection] ac ON ac.[ObjectId] = c.[ConsumerId]
		AND ac.[ObjectType] = 2 -- Consumer = 2
	INNER JOIN [dbo].[Address] ad ON ad.[AddressId] = ac.AddressId
	INNER JOIN [dbo].[State] s ON s.[StateId] = ad.[StateId]
	INNER JOIN [dbo].[PhoneNumber] pn ON pn.[AddressId] = ad.[AddressId]
    WHERE ae.[AdministratorId] = @AdministratorId
END
