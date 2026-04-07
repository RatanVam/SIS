USE ACE

GO

CREATE OR ALTER procedure  [dbo].[GetRule] 
AS
BEGIN

	SET NOCOUNT ON;

	--Rules
	SELECT	
		rule1.RuleId,
		rule1.RuleName,
		rule1.RuleNameSpace,
		rule1.RuleMethod,
		rule1.ExecutionOrder,
		ruleItem.RuleItemId,
		ruleItem.LOBId,
		ruleItem.CategoryId,
		ruleItem.DocumentId,
		lob.LOBName,
		cat.CategoryName,
		doc.DocumentName,
		rule1.EffectiveDate,
		rule1.ExpirationDate

	FROM [dbo].[Rule] rule1
	JOIN [dbo].[RuleItem] ruleItem
	ON rule1.RuleId = ruleItem.RuleId
	LEFT JOIN [dbo].[LOB] lob
	ON lob.LOBId = ruleItem.LobId
	LEFT JOIN [dbo].[Category] cat
	ON cat.CategoryId = ruleItem.CategoryId
	LEFT JOIN [dbo].[Document] doc
	ON doc.DocumentId = ruleItem.DocumentId

	ORDER BY rule1.ExecutionOrder 

END

GO