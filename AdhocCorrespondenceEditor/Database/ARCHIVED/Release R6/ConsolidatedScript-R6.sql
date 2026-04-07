-- =============================================
-- Author:		Sandhya, Kethineni
-- Create date: 10/22/2024
-- Description:	CLAIM-11443 Rename letter from Denial-Above Ground Tank to Denial-Environmental
-- =============================================

update dbo.Document
set DocumentName = 'Denial-Environmental',
DocumentFriendlyName='Denial-Environmental',
JldFilePath='companyRoot:S:Production://Templates/GeneralClaims/Denial-Environmental.jld'
where DocumentFriendlyName='Denial-Above Ground Tank'

-- =============================================
-- Author:		Sandhya, Kethineni
-- Create date: 11/05/2024
-- Description:	CLAIM-11325 2194787967_FN_Update the 'AICRA Claim Threshold Denial Attny' letter to conform with regulatory requirements.
-- =============================================

update dbo.Document
set DocumentName = 'AICRA Claim Threshold Denial Clmt or Attny',
DocumentFriendlyName='AICRA Claim Threshold Denial Clmt or Attny',
JldFilePath='companyRoot:S:Production://Templates/GeneralClaims/AICRA Claim Threshold Denial Clmt or Attny.jld'
where DocumentFriendlyName='AICRA Claim Threshold Denial Attny'

-- =============================================
-- Author:		Sandhya, Kethineni
-- Create date: 11/20/2024
-- Description:	CLAIM-11419 2194788928_FN_Retire identified letters
-- =============================================
update Document set IsDocumentActive = 0
where DocumentName in (
'AICRA Claim Threshold Denial Clmt',
'Denial-AST Rmval Rplcmnt Only',
'Denial-NghbrTankLeak2InsdProp',
'Denial-Standard',
'Denial-Tank Rmval Rplcmnt Only')

if exists (select * from  CategoryDocument where DocumentId in (select DocumentId from document where DocumentName in (
'AICRA Claim Threshold Denial Clmt',
'Denial-AST Rmval Rplcmnt Only',
'Denial-NghbrTankLeak2InsdProp',
'Denial-Standard',
'Denial-Tank Rmval Rplcmnt Only') and GETDATE() between EffectiveDate and ExpirationDate))
update CategoryDocument set ExpirationDate = DATEADD(YEAR,-100,ExpirationDate)
where DocumentId in (select DocumentId from document where DocumentName in (
'AICRA Claim Threshold Denial Clmt',
'Denial-AST Rmval Rplcmnt Only',
'Denial-NghbrTankLeak2InsdProp',
'Denial-Standard',
'Denial-Tank Rmval Rplcmnt Only'))

-- =============================================
-- Author:		Sandhya, Kethineni
-- Create date: 10/22/2024
-- Description: Work order 1105844	Delete printers
-- =============================================

if exists (select * from LOBPrinter where PrinterId in (select PrinterId from Printer
where PrinterName in (
'PRT_MSA_PMFP1',
'PRT_MSA_PMFP2',
'PRT_WC_PMFP1',
'PRT_WC_PMFP2') and GETDATE() between EffectiveDate and ExpirationDate))
update LOBPrinter
set ExpirationDate = DATEADD(YEAR, -100, ExpirationDate)
where PrinterId in (select PrinterId from Printer
where PrinterName in (
'PRT_MSA_PMFP1',
'PRT_MSA_PMFP2',
'PRT_WC_PMFP1',
'PRT_WC_PMFP2'))


