EXEC [dbo].[usp_AddDomain]
	@Name = 'Bank of America',
	@Alias = 'BOA',
	@Street = '2001 Pennsylvania Ave NW FRNT 1',
	@City = 'Washington',
	@ZipCode = '20006',
	@StateId = 47,
	@PhoneNumber = '1 800-432-1000',
	@DomainId = 0,
	@AddressId = 0
GO
EXEC [dbo].[usp_AddDomain]
	@Name = 'JPMorgan Chase Bank',
	@Alias = 'JPM',
	@Street = '1 Chase Manhattan Plaza, 25th Floor',
	@City = 'New York',
	@ZipCode = '43271',
	@StateId = 32,
	@PhoneNumber = '+1 212-552-2192',
	@DomainId = 0,
	@AddressId = 0
GO
EXEC [dbo].[usp_AddDomain]
	@Name = 'Goldman Sachs Group',
	@Alias = 'GSG',
	@Street = '125 High Street, 20th Floor',
	@City = 'Boston',
	@ZipCode = '02120',
	@StateId = 21,
	@PhoneNumber = '+1 617-204-2000',
	@DomainId = 0,
	@AddressId = 0
GO