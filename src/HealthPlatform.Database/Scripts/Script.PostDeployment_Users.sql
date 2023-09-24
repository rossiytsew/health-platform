-- Administrator Users
EXEC dbo.usp_AddUser
	@Username = 'slava.rossiytsev',
	@LoginType = 0,
	@PasswordHash = N'5/bAs3tg9nCMY4L7x0s/f3J+XpdQzVk3U9GjdVGm7a5XQ1EY',
	@DomainId = 1,
	@FirstName = 'Slava',
	@LastName = 'Rossiytsev',
	@Email = 'slava.rossiytsev@gmail.com',
	@SecurityLoginId = 0
GO
EXEC dbo.usp_AddUser
	@Username = 'andrew.dodson',
	@LoginType = 0,
	@PasswordHash = N'ZmntYoo0dRwefZ0mYkXC5hZiKJmohB8v9iRDYqAwo2JOtVox',
	@DomainId = 1,
	@FirstName = 'Andrew',
	@LastName = 'Dodson',
	@Email = 'andrew.dodson@gmail.com',
	@SecurityLoginId = 0
GO
EXEC dbo.usp_AddUser
	@Username = 'kate.robinson',
	@LoginType = 0,
	@PasswordHash = N'UCnRW0tObT5gbUMzOcRrcYskbw7H8XhwjYIid+cznoq1EtAL',
	@DomainId = 2,
	@FirstName = 'Kate',
	@LastName = 'Robinson',
	@Email = 'kate.robinson@gmail.com',
	@SecurityLoginId = 0
GO
EXEC dbo.usp_AddUser
	@Username = 'amica.scott',
	@LoginType = 0,
	@PasswordHash = N'oABuvQ5cXlFBRjPmEHKxZvjtYbv19F/lcGO5/0+3QREAMKVK',
	@DomainId = 2,
	@FirstName = 'Amica',
	@LastName = 'Scott',
	@Email = 'amica.scott@gmail.com',
	@SecurityLoginId = 0
GO
EXEC dbo.usp_AddUser
	@Username = 'mike.larson',
	@LoginType = 0,
	@PasswordHash = N'E2UkPvdPzAYeakFfr7h44IRFlpsZmVVkD14FnePSBdFq+bCT',
	@DomainId = 1,
	@FirstName = 'Mike',
	@LastName = 'Larson',
	@Email = 'mike.larson@gmail.com',
	@SecurityLoginId = 0
GO
EXEC dbo.usp_AddUser
	@Username = 'tim.klein',
	@LoginType = 0,
	@PasswordHash = N'0vCPIwnoVTHg0UgIlyBOt4qF3loVQTmJxLt6WiBy+VcAAEob',
	@DomainId = 3,
	@FirstName = 'Tim',
	@LastName = 'Klein',
	@Email = 'tim.klein@gmail.com',
	@SecurityLoginId = 0
GO

-- Employer Users
EXEC dbo.usp_AddUser
	@Username = 'margo.hendricks',
	@LoginType = 1,
	@PasswordHash = N'uJUjC4vDSdocT+xeDFH2/OA/MDcqXzVfUJTg7B1fYgA1bEp9',
	@DomainId = 1,
	@FirstName = 'Margo',
	@LastName = 'Hendricks',
	@Email = 'margo.hendricks@gmail.com',
	@EmployerId = 1,
	@SecurityLoginId = 0
GO
EXEC dbo.usp_AddUser
	@Username = 'james.jones',
	@LoginType = 1,
	@PasswordHash = N'2qmO2Omp003dpMpqEyWEb80a05JEKdmCSBnLgl1nLoPj6htg',
	@DomainId = 1,
	@FirstName = 'James',
	@LastName = 'Jones',
	@Email = 'james.jones@gmail.com',
	@EmployerId = 1,
	@SecurityLoginId = 0
GO
EXEC dbo.usp_AddUser
	@Username = 'mary.brown',
	@LoginType = 1,
	@PasswordHash = N'Rj0BSVQp8NzzZN3gJy6V7O/y4A9lDNF84kyDaeVoRQa779vp',
	@DomainId = 1,
	@FirstName = 'Mary',
	@LastName = 'Brown',
	@Email = 'mary.brown@gmail.com',
	@EmployerId = 1,
	@SecurityLoginId = 0
GO
EXEC dbo.usp_AddUser
	@Username = 'tom.williams',
	@LoginType = 1,
	@PasswordHash = N'aYJP8K3F1kN9sI+fbvmLQusbIQDGQAMxgLVOilyh/NycXB2C',
	@DomainId = 1,
	@FirstName = 'Tom',
	@LastName = 'Williams',
	@Email = 'tom.williams@gmail.com',
	@EmployerId = 1,
	@SecurityLoginId = 0
GO
EXEC dbo.usp_AddUser
	@Username = 'leila.garcia',
	@LoginType = 1,
	@PasswordHash = N'McdvkrxC0PunN4i9thDVdjKKsgrmxj+5xj5Qxf1NtYHkQWjJ',
	@DomainId = 1,
	@FirstName = 'Leila',
	@LastName = 'Garcia',
	@Email = 'leila.garcia@gmail.com',
	@EmployerId = 2,
	@SecurityLoginId = 0
GO