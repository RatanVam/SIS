IF COL_LENGTH('Document','DocumentOtherType') IS NULL
alter table Document
add DocumentOtherType varchar(100) null

Go

update document set documentOtherType='GINV  Torts Insurance Verification' where documentFriendlyName='1st Sub - Ltr to Tort'
update document set documentOtherType='GAPPR  Salvage Document' where documentFriendlyName='Abandonment Ltr'
update document set documentOtherType='GMED  Authorization' where documentFriendlyName='Ack w Authorization'
update document set documentOtherType='GMED  Authorization' where documentFriendlyName='Additional Information Form'
update document set documentOtherType='GLGL  Affidavit' where documentFriendlyName='AFFI No Insurance'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='Affidavit-No Ins w NJ PIP App-Attny'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='Affidavit-No Ins w NJ PIP App-Clmt'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='Affidavit-No Ins w PA PIP App-Attny'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='Affidavit-No Ins w PA PIP App-Clmt'
update document set documentOtherType='GLGL  Affidavit' where documentFriendlyName='Affidavit-No Ins wo PIP App-Attny'
update document set documentOtherType='GLGL  Affidavit' where documentFriendlyName='Affidavit-No Ins wo PIP App-Clmt'
update document set documentOtherType='GMED  Authorization' where documentFriendlyName='Authorization to Attorney'
update document set documentOtherType='GMED  Authorization' where documentFriendlyName='Authorization to Clmt and Insd'
update document set documentOtherType='GCOM  Form' where documentFriendlyName='Authorization-Medical'
update document set documentOtherType='GMED  Authorization' where documentFriendlyName='Authorization-PIP Claim'
update document set documentOtherType='GMED  Authorization' where documentFriendlyName='Authorization-Wage Loss'
update document set documentOtherType='GLGL  Release' where documentFriendlyName='Certification of Automobile Repair'
update document set documentOtherType='GINV  Statement' where documentFriendlyName='Clmt Report'
update document set documentOtherType='GLGL  Notice' where documentFriendlyName='Concurrent Info Request'
update document set documentOtherType='GLGL  Release' where documentFriendlyName='Co-Primary Release'
update document set documentOtherType='GMED  Authorization' where documentFriendlyName='CT Explain Letter'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='DE Explain Ltr'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='Death Explain Letter'
update document set documentOtherType='GLGL  Deletion of Coverage' where documentFriendlyName='Delete Coverage'
update document set documentOtherType='GFIN  Financial Interest' where documentFriendlyName='Delete Insd Name From Ck'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='Dependent Survivor Benefits'
update document set documentOtherType='GFIN  Wage and Salary' where documentFriendlyName='Disability Stmt from Doctor'
update document set documentOtherType='GINV  Statement' where documentFriendlyName='Document Request Ltr'
update document set documentOtherType='GMED  Independent Medical Exam' where documentFriendlyName='DPR Plan IME Attorney'
update document set documentOtherType='GMED  Independent Medical Exam' where documentFriendlyName='DPR Plan IME Clmt'
update document set documentOtherType='GGEN  Miscellaneous' where documentFriendlyName='Dram Shop Questionnaire'
update document set documentOtherType='GGEN  Miscellaneous' where documentFriendlyName='Dram Shop to Establishment'
update document set documentOtherType='GINV  Statement' where documentFriendlyName='Endorsed Jewel-Fur Ltr'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='Explain Ltr-Precert Inj Party'
update document set documentOtherType='GLGL  Reservation of Rights' where documentFriendlyName='First Notice of Lawsuit'
update document set documentOtherType='GLGL  Release' where documentFriendlyName='Flood Release'
update document set documentOtherType='GMED  Authorization' where documentFriendlyName='Florida Ack to Atty'
update document set documentOtherType='GINV  Statement' where documentFriendlyName='Freeze Loss Questionnaire'
update document set documentOtherType='GLGL  Release' where documentFriendlyName='General BI Release'
update document set documentOtherType='GLGL  Release' where documentFriendlyName='General PD Release-1st Party'
update document set documentOtherType='GLGL  Release' where documentFriendlyName='General PD Release-3rd Party'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='HIP Explain Ltr-Precert Inj Party'
update document set documentOtherType='GMED  Authorization' where documentFriendlyName='HIPAA Authorization'
update document set documentOtherType='GLGL  Affidavit' where documentFriendlyName='HO Pub Adj Rep Ltr'
update document set documentOtherType='GLGL  Release' where documentFriendlyName='HO Tort Settlement Agreement Ltr'
update document set documentOtherType='GFIN  Wage and Salary' where documentFriendlyName='HO-1st Sub-Ltr to Tort'
update document set documentOtherType='GLGL  Release' where documentFriendlyName='Hold Harmless Ltr'
update document set documentOtherType='GMED  Medical Records' where documentFriendlyName='Hospital Records Request Ltr'
update document set documentOtherType='GMED  Independent Medical Exam' where documentFriendlyName='IME Enclosure'
update document set documentOtherType='GINV  Statement' where documentFriendlyName='Insd Incident Report'
update document set documentOtherType='GINV  Statement' where documentFriendlyName='Inventory Follow-up Ltr'
update document set documentOtherType='GLGL  Power of Attorney' where documentFriendlyName='Limited Power of Attorney'
update document set documentOtherType='GINV  Statement' where documentFriendlyName='Loss of Use Ltr'
update document set documentOtherType='GAPPR  Salvage Document' where documentFriendlyName='Ltr of Authorization'
update document set documentOtherType='GINV  Torts Insurance Verification' where documentFriendlyName='Ltr to Tort-Insurance Coverage'
update document set documentOtherType='GINV  Statement' where documentFriendlyName='Ltr to Witness-Statement Needed'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='MD Explain Letter'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='Med Pay Death Letter'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='Med Pay Ltr'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='Med Pay Ltr - School and Church Buses'
update document set documentOtherType='GLGL  Release' where documentFriendlyName='Med Pay Release'
update document set documentOtherType='GMED  Medical Records' where documentFriendlyName='Medical Records Request'
update document set documentOtherType='GFIN  Medicare' where documentFriendlyName='Medicare Eligibility Req Ltr' and JldFilePath like '%GeneralClaims%'
update document set documentOtherType='GLGL  Release' where documentFriendlyName='Minor Release and Trust Form UM-UIM'
update document set documentOtherType='GLGL  Release' where documentFriendlyName='Minor Release-BI'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='NJ Delay Insured P1'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='NJ Unacceptable PIP1'
update document set documentOtherType='GAPPR  Salvage Document' where documentFriendlyName='No Financial Interest Ltr'
update document set documentOtherType='GAPPR  Salvage Document' where documentFriendlyName='Notarized Mileage Error Ltr'
update document set documentOtherType='GLGL  Notice' where documentFriendlyName='Notice of Rights Ltr'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='NY 2nd Notice Ltr-Injured Party'
update document set documentOtherType='GLGL  Notice' where documentFriendlyName='NY APIP Subro Agreement Ltr'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='NY Coverage Ltr'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='NY Delay Insured P1'
update document set documentOtherType='GFIN  Wage and Salary' where documentFriendlyName='NY Employers Wage Ver Rpt'
update document set documentOtherType='GFIN  Lien Document' where documentFriendlyName='NY Fire District Ltr'
update document set documentOtherType='GLGL  Notice' where documentFriendlyName='NY OBEL Election Ltr'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='NY Unacceptable PIP1'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='ODS Explain Ltr'
update document set documentOtherType='GMED  Authorization' where documentFriendlyName='Out of State Ack w Auths'
update document set documentOtherType='GMED  Authorization' where documentFriendlyName='Out of State Clmt Inj No Attny'
update document set documentOtherType='GMED  Authorization' where documentFriendlyName='Out of State Clmt Not Repr'
update document set documentOtherType='GMED  Authorization' where documentFriendlyName='Out of State New Adj to Attny'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='PA Delay Insured P1'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='PA Explain Ltr'
update document set documentOtherType='MGEN  Conversion Documents' where documentFriendlyName='PA Unable to Contact Ltr'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='PA Unacceptable PIP1'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='PA Victims of Domestic Abuse Ltr'
update document set documentOtherType='GLGL  Release' where documentFriendlyName='PD Release for Subrogation'
update document set documentOtherType='GINV  Discovery' where documentFriendlyName='PIP File Request Ltr'
update document set documentOtherType='GMED  Medical' where documentFriendlyName='PIP Hospital Record Request'
update document set documentOtherType='GLGL  Release' where documentFriendlyName='PIP Reservation of Rights'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='PIP Reservation of Rights'
update document set documentOtherType='GGEN  Miscellaneous' where documentFriendlyName='PIP Subro-NY Assignment Agreement'
update document set documentOtherType='GINV  Plea and Outcome Disposition' where documentFriendlyName='Plea and Outcome'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='Precert-Coverage Undetermined'
update document set documentOtherType='GFIN  Proof of Loss' where documentFriendlyName='Proof of Loss'
update document set documentOtherType='GINV  Statement' where documentFriendlyName='Recoverable Deprec Ltr'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='Reg Ltr'
update document set documentOtherType='MGEN  Conversion Documents' where documentFriendlyName='Reparations Replacement Service'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='Representation Acknowledged'
update document set documentOtherType='GLGL  Reservation of Rights' where documentFriendlyName='Reservation of Rights'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='Reservation of Rights-Multi State'
update document set documentOtherType='GMED  Authorization' where documentFriendlyName='Status Ltr w Authorizations'
update document set documentOtherType='GINV  Investigative Document' where documentFriendlyName='Subrogation Ltr to Tort'
update document set documentOtherType='GFIN  W9' where documentFriendlyName='Tax ID Num Request Ltr'
update document set documentOtherType='GINV  Statement' where documentFriendlyName='Theft Ltr'
update document set documentOtherType='MGEN  PIP Application' where documentFriendlyName='Thirty Day Ltr'
update document set documentOtherType='GLGL  Release' where documentFriendlyName='Tort Settlement Agreement Ltr'
update document set documentOtherType='GMED  Authorization' where documentFriendlyName='UIM Ack w Authorization'
update document set documentOtherType='GMED  Authorization' where documentFriendlyName='UM Ack w Authorization'
update document set documentOtherType='GINV  Torts Insurance Verification' where documentFriendlyName='UMC Ltr to Clmt'
update document set documentOtherType='GINV  Torts Insurance Verification' where documentFriendlyName='UMC Ltr to Insd'
update document set documentOtherType='GLGL  Release' where documentFriendlyName='UM-UIM Release and Trust BI'
update document set documentOtherType='GLGL  Release' where documentFriendlyName='UM-UIM Release and Trust BI-PD'
update document set documentOtherType='GLGL  Release' where documentFriendlyName='UM-UIM Release and Trust PD'
update document set documentOtherType='GINV  Statement' where documentFriendlyName='Veh Theft Questionnaire Ltr'
update document set documentOtherType='GFIN  Wage and Salary' where documentFriendlyName='Wage and Salary Verification-Multi State'
update document set documentOtherType='GFIN  Wage and Salary' where documentFriendlyName='Wage Loss Check'
update document set documentOtherType='GINV  Statement' where documentFriendlyName='Witness Ltr'
update document set documentOtherType='GFIN  Wage and Salary' where documentFriendlyName='Insd Contact Ltr-Suit'

Go


/****** Object:  StoredProcedure [dbo].[GetDocument]    Script Date: 7/18/2024 6:37:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Sandhya, Ketheneni
-- Create date: 7/18/2024
-- Description:	Update SP to add IsInboundIdRequired Column
-- =============================================
ALTER   procedure  [dbo].[GetDocument] 
AS
BEGIN

	SET NOCOUNT ON;
	Declare @currentDate datetime
	SELECT @currentDate = GETDATE()
	--Documents
	SELECT 
		doc.DocumentId,
		DocumentName,
		DocumentFriendlyName,
		IsDocumentActive,
		BaseState,
		JldFilePath,
		DocumentType,
		DocumentOrder,
		cat.CategoryId,
		CategoryName,
		CategoryFriendlyName,
		IsCategoryActive,
		DocumentOtherType
	FROM [dbo].[Document] doc
	JOIN [dbo].[CategoryDocument] catdoc
	ON doc.DocumentId = catdoc.DocumentId
	JOIN [dbo].[Category] cat
	ON catdoc.CategoryId= cat.CategoryId
	WHERE @currentDate between EffectiveDate AND ExpirationDate
	Order BY catdoc.DocumentOrder 


END

Go