EXEC dbo.usp_AddBenefitsPackage
	@Name = 'Benefits Package 1W',
	@StartDate = '2023-01-01',
	@EndDate = '2023-12-31',
	@PayrollFrequency = 0, -- Weekly = 0
	@EmployerId = 1,
	@BenefitsPackageId = 0
GO
EXEC dbo.usp_AddBenefitsPackage
	@Name = 'Benefits Package 2W',
	@StartDate = '2023-02-02',
	@EndDate = '2023-12-1',
	@PayrollFrequency = 0, -- Weekly = 0
	@EmployerId = 1,
	@BenefitsPackageId = 0
GO
EXEC dbo.usp_AddBenefitsPackage
	@Name = 'Benefits Package 1M',
	@StartDate = '2023-01-01',
	@EndDate = '2023-12-31',
	@PayrollFrequency = 1, -- Monthly = 1
	@EmployerId = 1,
	@BenefitsPackageId = 0
GO
EXEC dbo.usp_InitializeBenefitsPackage
	@BenefitsPackageId = 3
GO