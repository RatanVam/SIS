USE ACE_Enh

GO

CREATE OR ALTER procedure  [dbo].[GetRule] 
AS
BEGIN

	SET NOCOUNT ON;

	--Rules
	SELECT	
		ru.RuleId,
		ru.RuleName,
		ru.RuleNameSpace,
		ru.RuleMethod,
		ru.ExecutionOrder,
		ruleItem.RuleItemId,
		ruleItem.LOBId,
		ruleItem.CategoryId,
		ruleItem.DocumentId,
		lob.LOBName,
		cat.CategoryName,
		doc.DocumentName,
		ru.EffectiveDate,
		ru.ExpirationDate,
		ruleGroup.RuleGroupName

	FROM [dbo].[Rule] ru
	JOIN [dbo].[RuleItem] ruleItem
	ON ru.RuleId = ruleItem.RuleId
	LEFT JOIN [dbo].[LOB] lob
	ON lob.LOBId = ruleItem.LobId
	LEFT JOIN [dbo].[Category] cat
	ON cat.CategoryId = ruleItem.CategoryId
	LEFT JOIN [dbo].[Document] doc
	ON doc.DocumentId = ruleItem.DocumentId
	LEFT JOIN [dbo].[RuleGroup] ruleGroup
	ON ruleGroup.RuleGroupId = ru.RuleGroupId

	ORDER BY ru.ExecutionOrder 

END

GO