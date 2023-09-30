CREATE PROCEDURE [dbo].[usp_AddClaim]
	@ClaimAmount      FLOAT,
	@Receipt          VARBINARY(MAX),
	@DateOfService    DATE,
	@EnrollmentId     INT,
	@ClaimId          INT OUTPUT
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY		
		INSERT INTO [dbo].[Claim]
		(
			[ClaimAmount],
			[Receipt],
			[EnrollmentId],
			[DateOfService],
			[ClaimNumber]
		)
		SELECT
			@ClaimAmount,
			@Receipt,
			@EnrollmentId,
			@DateOfService,
			d.[Alias] + emp.[Code] + CONVERT(VARCHAR, GETDATE(), 112) + REPLACE(CONVERT(VARCHAR, GETDATE(), 114), ':', '')
		FROM [dbo].[Enrollment] e
		INNER JOIN [dbo].[Consumer] c ON c.[ConsumerId] = e.[ConsumerId]
		INNER JOIN [dbo].[Employer] emp ON emp.[EmployerId] = c.[EmployerId]
		INNER JOIN [dbo].[AdministratorEmployer] ae ON ae.[EmployerId] = emp.[EmployerId]
		INNER JOIN [dbo].[Administrator] a ON a.[AdministratorId] = ae.[AdministratorId]
		INNER JOIN [dbo].[Domain] d ON d.[DomainId] = a.[DomainId]
		WHERE e.[EnrollmentId] = @EnrollmentId

		SELECT @ClaimId = SCOPE_IDENTITY()

		INSERT INTO [dbo].[ClaimStatus] 
		(
			[Status], 
			[Date],
			[ClaimId]
		)
		VALUES 
		(
			0, -- Pending = 0
			GETDATE(),
			@ClaimId
		)

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        ROLLBACK TRANSACTION;
		THROW;
    END CATCH
END
