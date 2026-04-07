-- =============================================
-- Author:		<Kethenei, Sandhya>
-- Create date: <10/02/2024>
-- Description:	<Claim 11247 - 2175876958_FN_Retire the manual versions of the C-8.4 & C-8.1>
-- =============================================
update Document set IsDocumentActive = 0
where DocumentName in ('C-8.1','C-8.4')

update CategoryDocument set ExpirationDate = DATEADD(YEAR,-100,ExpirationDate)
where DocumentId in (select DocumentId from document where DocumentName in ('C-8.1','C-8.4'))