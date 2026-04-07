USE ACE

GO


CREATE OR ALTER procedure  [dbo].[GetRuleLookup] 
AS
BEGIN

	SET NOCOUNT ON;

	--Rules
	SELECT	
		RuleItemId,
		LookupKey,
		LookupValue	
	FROM [dbo].[RuleLookup] 


END

GO