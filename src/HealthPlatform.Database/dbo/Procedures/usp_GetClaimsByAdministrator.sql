CREATE PROCEDURE [dbo].[usp_GetClaimsByAdministrator]
	@AdministratorName    NVARCHAR(64),
    @DomainId             INT,
	@ClaimNumber          NVARCHAR(64) = NULL,
	@EmployerId           INT = NULL,
	@Status               INT = NULL,
    @PerPage              INT = NULL,
    @Page                 INT = NULL,
    @Count                INT OUTPUT
AS
BEGIN
	CREATE TABLE #Claim
    (
        [ClaimId]               INT              NOT NULL,
        [ClaimNumber]           NVARCHAR(64)     NOT NULL,
        [ClaimAmount]           FLOAT            NOT NULL,
        [DateOfService]         DATE             NOT NULL,
        [Status]                INT              NOT NULL,
        [EnrollmentId]          INT              NOT NULL,
        [ElectionAmount]        FLOAT            NOT NULL,
        [BenefitsOfferingId]    INT              NOT NULL,
        [ContributionAmount]    FLOAT            NOT NULL,
        [Name]                  NVARCHAR(128)    NOT NULL,
        [Type]                  INT              NOT NULL,
        [ConsumerId]            INT              NOT NULL,
        [EmployerId]            INT              NOT NULL,
        [RowNum]                INT              NOT NULL
    )

    INSERT INTO #Claim
    (
        [ClaimId],
        [ClaimNumber],
        [ClaimAmount],
        [DateOfService],
        [Status],
        [EnrollmentId],
        [ElectionAmount],
        [BenefitsOfferingId],
        [ContributionAmount],
        [Name],
        [Type],
        [ConsumerId],
        [EmployerId],
        [RowNum]
    )
    SELECT
        c.[ClaimId],
        c.[ClaimNumber],
        c.[ClaimAmount],
        c.[DateOfService],
        cs.[Status],
        e.[EnrollmentId],
		e.[ElectionAmount],
		bo.[BenefitsOfferingId],
		bo.[ContributionAmount],
		bo.[Name],
		bo.[Type],
        con.[ConsumerId],
        con.[EmployerId],
        ROW_NUMBER() OVER (ORDER BY c.[ClaimId]) AS [RowNum]
    FROM [dbo].[Claim] c
    INNER JOIN [dbo].[ClaimStatus] cs ON cs.[ClaimId] = c.[ClaimId]
    INNER JOIN [dbo].[Enrollment] e ON e.[EnrollmentId] = c.[EnrollmentId]
	INNER JOIN [dbo].[BenefitsOffering] bo ON bo.[BenefitsOfferingId] = e.[BenefitsOfferingId]
    INNER JOIN [dbo].[Consumer] con ON con.[ConsumerId] = e.[ConsumerId]
    INNER JOIN [dbo].[AdministratorEmployer] ae ON ae.[EmployerId] = con.[EmployerId]
    INNER JOIN [dbo].[Administrator] a ON a.[AdministratorId] = ae.[AdministratorId]
    WHERE a.[Name] = @AdministratorName AND a.[DomainId] = @DomainId
    AND (@ClaimNumber IS NULL OR c.[ClaimNumber] LIKE '%' + @ClaimNumber + '%')
    AND (@EmployerId IS NULL OR con.[EmployerId] = @EmployerId)
    AND (@Status IS NULL OR cs.[Status] = @Status)

    SELECT
        c.[ClaimId],
        c.[ClaimNumber],
        c.[ClaimAmount],
        c.[DateOfService],
        c.[Status],
        c.[EnrollmentId],
        c.[ElectionAmount],
        c.[BenefitsOfferingId],
        c.[ContributionAmount],
        c.[Name],
        c.[Type],
        e.[EmployerId],
        e.[Name] [EmployerName],
        e.[Code] [EmployerCode],
        con.[ConsumerId],
        i.[FirstName] + ' ' + i.[LastName] [ConsumerFullName]
    FROM #Claim c
    INNER JOIN [dbo].[Employer] e ON e.[EmployerId] = c.[EmployerId]
    INNER JOIN [dbo].[Consumer] con ON con.[ConsumerId] = c.[ConsumerId]
    INNER JOIN [dbo].[Individual] i ON i.[IndividualId] = con.[IndividualId]
    WHERE @PerPage IS NULL OR @Page IS NULL
    OR ([RowNum] > (@Page - 1) * @PerPage AND [RowNum] <= @Page * @PerPage)

    SELECT
        @Count = COUNT(1)
    FROM #Claim
END
GO
