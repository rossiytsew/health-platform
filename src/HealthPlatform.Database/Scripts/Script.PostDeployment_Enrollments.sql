EXEC dbo.usp_AddEnrollment
	@ElectionAmount = 250,
	@ConsumerId = 1,
	@BenefitsOfferingId = 4,
	@EnrollmentId = 0
GO
EXEC dbo.usp_AddEnrollment
	@ElectionAmount = 500,
	@ConsumerId = 1,
	@BenefitsOfferingId = 5,
	@EnrollmentId = 0
GO
EXEC dbo.usp_AddEnrollment
	@ElectionAmount = 400,
	@ConsumerId = 2,
	@BenefitsOfferingId = 5,
	@EnrollmentId = 0
GO