CREATE PROCEDURE [dbo].[usp_GetConsumerBalance]
	@ConsumerId INT
AS
BEGIN
	DECLARE @Balance FLOAT;

	SELECT
		@Balance = SUM([TransactionAmount])
	FROM [dbo].[Transaction]
	WHERE [ConsumerId] = @ConsumerId

	SELECT COALESCE(@Balance, 0.0)
END
