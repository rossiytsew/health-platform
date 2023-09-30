CREATE PROCEDURE [dbo].[usp_GetPendingPayments]
AS
BEGIN
	SELECT
		p.[PaymentId],
		p.[PaymentAmount],
		e.[ConsumerId]
	FROM [dbo].[Payment] p
	INNER JOIN [dbo].[Enrollment] e ON e.[EnrollmentId] = p.[EnrollmentId]
	WHERE p.[Status] = 0 -- Pending = 0
	AND p.[Date] < GETDATE()
END
