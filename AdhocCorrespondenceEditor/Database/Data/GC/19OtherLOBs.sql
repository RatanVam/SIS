Go
Declare @lobID int
Declare @DocumentID int

update [dbo].[DocumentDropdownLookupItem]
set DocumentDropdownLookupItemValue = 'IIIB1-Fraud/Concealment/Misrepresentation', 
DocumentDropdownLookupItemCode = 'IIIB1-Fraud/Concealment/Misrepresentation'
where DocumentDropdownLookupItemValue = 'IIIB1-Fraud/ Concealment/Misrepresentation'

update [dbo].[Rule]
set RuleName ='PC_PA_SwithchDocumentVisibility'
where RuleNameSpace = 'AdhocCorrespondenceEditor.Client.PCPAUiRule'