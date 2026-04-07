USE [ACE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Insert into [dbo].[Category] (CategoryName,CategoryFriendlyName,IsCategoryActive,
CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 

('PC_BLANK_LETTER_TEMPLATE_CTGY',		'Blank Letter Templates',	1,SUSER_SNAME(),GETDATE(),null,null),
('PC_BROKER_CTGY',						'Broker',	1,SUSER_SNAME(),GETDATE(),null,null),
('PC_CRIB_CTGY',						'CRIB',	1,SUSER_SNAME(),GETDATE(),null,null),
('PC_NYCIRB_CTGY',						'NY CIRB',	1,SUSER_SNAME(),GETDATE(),null,null),
('PC_PREMIUM_AUDIT_CTGY',				'Premium Audit',	1,SUSER_SNAME(),GETDATE(),null,null),
('PC_PROSPECT-DECLINE_CTGY',			'Prospect Decline',	1,SUSER_SNAME(),GETDATE(),null,null),
('PC_SOLE_PRPRTOR-PARTNER_CTGY',		'Sole Proprietor-Partner',	1,SUSER_SNAME(),GETDATE(),null,null),
('PC_UNDERWRITING_CTGY',				'Underwriting',	1,SUSER_SNAME(),GETDATE(),null,null),
('PC_USL_AND_H_CTGY',					'USL and H',	1,SUSER_SNAME(),GETDATE(),null,null)

go

declare @lobWCU int
declare @cat_PC_1 int,@cat_PC_2 int, @cat_PC_3 int, @cat_PC_4 int, @cat_PC_5 int
declare @cat_PC_6 int,@cat_PC_7 int, @cat_PC_8 int,@cat_PC_9 int


Select @lobWCU=  lobId from dbo.LOB where LOBName='PC-WCU'

Select @cat_PC_1=  CategoryId from [dbo].[Category] where CategoryName='PC_BLANK_LETTER_TEMPLATE_CTGY'
Select @cat_PC_2=  CategoryId from [dbo].[Category] where CategoryName='PC_BROKER_CTGY'
Select @cat_PC_3=  CategoryId from [dbo].[Category] where CategoryName='PC_CRIB_CTGY'
Select @cat_PC_4=  CategoryId from [dbo].[Category] where CategoryName='PC_NYCIRB_CTGY'
Select @cat_PC_5=  CategoryId from [dbo].[Category] where CategoryName='PC_PREMIUM_AUDIT_CTGY'
Select @cat_PC_6=  CategoryId from [dbo].[Category] where CategoryName='PC_PROSPECT-DECLINE_CTGY'
Select @cat_PC_7=  CategoryId from [dbo].[Category] where CategoryName='PC_SOLE_PRPRTOR-PARTNER_CTGY'
Select @cat_PC_8=  CategoryId from [dbo].[Category] where CategoryName='PC_UNDERWRITING_CTGY'
Select @cat_PC_9=  CategoryId from [dbo].[Category] where CategoryName='PC_USL_AND_H_CTGY'


INSERT INTO [dbo].[LOBCategory]
	  ([LOBId]
      ,[CategoryId]
      ,[CategoryOrder]
	  ,[CategoryGroups]
	  ,[EffectiveDate]
	  ,[ExpirationDate]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])

  VALUES
	(@lobWCU,@cat_PC_1,10,'Inspire_ACE_Prod,Inspire_WCU_PolCtr,Inspire_WCU_PolCtr_Mgr,Inspire_Administrators,Inspire_Preview_ES_FA,Inspire_Commercial_Lines',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobWCU,@cat_PC_2,20,'Inspire_ACE_Prod,Inspire_WCU_PolCtr,Inspire_WCU_PolCtr_Mgr,Inspire_Administrators,Inspire_Preview_ES_FA,Inspire_Commercial_Lines',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobWCU,@cat_PC_3,30,'Inspire_ACE_Prod,Inspire_WCU_PolCtr,Inspire_WCU_PolCtr_Mgr,Inspire_Administrators,Inspire_Preview_ES_FA,Inspire_Commercial_Lines',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobWCU,@cat_PC_4,40,'Inspire_ACE_Prod,Inspire_WCU_PolCtr,Inspire_WCU_PolCtr_Mgr,Inspire_Administrators,Inspire_Preview_ES_FA,Inspire_Commercial_Lines',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobWCU,@cat_PC_5,50,'Inspire_ACE_Prod,Inspire_WCU_PolCtr,Inspire_WCU_PolCtr_Mgr,Inspire_Administrators,Inspire_Preview_ES_FA,Inspire_Commercial_Lines',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobWCU,@cat_PC_6,60,'Inspire_ACE_Prod,Inspire_WCU_PolCtr,Inspire_WCU_PolCtr_Mgr,Inspire_Administrators,Inspire_Preview_ES_FA,Inspire_Commercial_Lines',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobWCU,@cat_PC_7,60,'Inspire_ACE_Prod,Inspire_WCU_PolCtr,Inspire_WCU_PolCtr_Mgr,Inspire_Administrators,Inspire_Preview_ES_FA,Inspire_Commercial_Lines',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobWCU,@cat_PC_8,70,'Inspire_ACE_Prod,Inspire_WCU_PolCtr,Inspire_WCU_PolCtr_Mgr,Inspire_Administrators,Inspire_Preview_ES_FA,Inspire_Commercial_Lines',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobWCU,@cat_PC_9,80,'Inspire_ACE_Prod,Inspire_WCU_PolCtr,Inspire_WCU_PolCtr_Mgr,Inspire_Administrators,Inspire_Preview_ES_FA,Inspire_Commercial_Lines',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null)

GO

INSERT [dbo].[Control]
(
       [ControlName]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime] )
	values 
	 ('WcuAddrNmCompanyAddress',SUSER_SNAME(),GETDATE(),null,null),
	 ('WcuCCSection',SUSER_SNAME(),GETDATE(),null,null),
	 ('WcuYearModSection',SUSER_SNAME(),GETDATE(),null,null)

GO


Insert into [dbo].[Document] (DocumentName,DocumentFriendlyName,IsDocumentActive, BaseState,JldFilePath,DocumentType,
CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values

('1st Fraud Notice Complied After Req','1st Fraud Notice Complied After Req','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/1st Fraud Notice Complied After Req.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('1st Fraud Notice Req CRIB Assist','1st Fraud Notice Req CRIB Assist','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/1st Fraud Notice Req CRIB Assist.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Bkr Chg Add Delete Billing Opts','Bkr Chg Add Delete Billing Opts','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Bkr Chg Add Delete Billing Opts.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Blank Letter Template Group','Blank Letter Template Group','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Blank Letter Template Group.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Blank Letter Template Specific','Blank Letter Template Specific','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Blank Letter Template Specific.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Broker Auth to Issue Cert','Broker Auth to Issue Cert','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Broker Auth to Issue Cert.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Broker Authorization Ltr','Broker Authorization Ltr','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Broker Authorization Ltr.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('CRIB Req Relief Redes Letter','CRIB Req Relief Redes Letter','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/CRIB Req Relief Redes Letter.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('CRIB Zero Balance','CRIB Zero Balance','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/CRIB Zero Balance.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('CRIB Req for Records Audit Complete','CRIB Req for Records Audit Complete','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/CRIB Req for Records Audit Complete.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Description of Operations','Description of Operations','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Description of Operations.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Exp Mod Letter Bidding','Exp Mod Letter Bidding','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Exp Mod Letter Bidding.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Exp Mod Letter Bidding-Dates','Exp Mod Letter Bidding-Dates','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Exp Mod Letter Bidding-Dates.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Finance Co Final Request','Finance Co Final Request','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Finance Co Final Request.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Fin Co Notify Fin Co of Prior CN','Fin Co Notify Fin Co of Prior CN','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Fin Co Notify Fin Co of Prior CN.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Fin Co Rec Part of Agremt or Rec Ck','Fin Co Rec Part of Agremt or Rec Ck','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Fin Co Rec Part of Agremt or Rec Ck.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Fin Co Received Complete Agreement','Fin Co Received Complete Agreement','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Fin Co Received Complete Agreement.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Fin Co Req Reinst Too Late','Fin Co Req Reinst Too Late','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Fin Co Req Reinst Too Late.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Fin Co Vol Pol NJM-NJRe','Fin Co Vol Pol NJM-NJRe','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Fin Co Vol Pol NJM-NJRe.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Fraud Letter','Fraud Letter','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Fraud Letter.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Generic Blank Ltr Template Group','Generic Blank Ltr Template Group','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Generic Blank Ltr Template Group.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Generic Blank Ltr Template Specific','Generic Blank Ltr Template Specific','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Generic Blank Ltr Template Specific.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Insured Returned Mail','Insured Returned Mail','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Insured Returned Mail.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Late Retro to CRIB','Late Retro to CRIB','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Late Retro to CRIB.jld','WCU  Retro',SUSER_SNAME(),GETDATE(),null,null),
('Mail Audit','Mail Audit','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Mail Audit.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Need Completed PP1B','Need Completed PP1B','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Need Completed PP1B.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('No Change Audit Correct','No Change Audit Correct','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/No Change Audit Correct.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('No Change Lack of Cooperation','No Change Lack of Cooperation','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/No Change Lack of Cooperation.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('No Midterm Election Change','No Midterm Election Change','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/No Midterm Election Change.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Non Pay to Broker','Non Pay to Broker','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Non Pay to Broker.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('NYCIRB Endorsement Filed','NYCIRB Endorsement Filed','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/NYCIRB Endorsement Filed.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Preliminary Audit Ltr','Preliminary Audit Ltr','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Preliminary Audit Ltr.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Re-Audit Decline','Re-Audit Decline','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Re-Audit Decline.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),

('Received Another PP1B Form','Received Another PP1B Form','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Received Another PP1B Form.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Redesignation Quote Returned Mail','Redesignation Quote Returned Mail','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Redesignation Quote Returned Mail.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Request Bureau File Number','Request Bureau File Number','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Request Bureau File Number.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Request IRS Info','Request IRS Info','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Request IRS Info.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Returning Incomplete PP1B Form','Returning Incomplete PP1B Form','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Returning Incomplete PP1B Form.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Test Audit Reqd Audit not Complete','Test Audit Reqd Audit not Complete','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Test Audit Reqd Audit not Complete.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('USL and H If Any Letter','USL and H If Any Letter','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/USL and H If Any Letter.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Waiver of Subrogation Ltr','Waiver of Subrogation Ltr','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterWCU/Waiver of Subrogation Ltr.jld','WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null)


go






declare @lobWCU int
declare @cat_PC_1 int,@cat_PC_2 int, @cat_PC_3 int, @cat_PC_4 int, @cat_PC_5 int
declare @cat_PC_6 int,@cat_PC_7 int, @cat_PC_8 int,@cat_PC_9 int


Select @lobWCU=  lobId from dbo.LOB where LOBName='PC-WCU'

Select @cat_PC_1=  CategoryId from [dbo].[Category] where CategoryName='PC_BLANK_LETTER_TEMPLATE_CTGY'
Select @cat_PC_2=  CategoryId from [dbo].[Category] where CategoryName='PC_BROKER_CTGY'
Select @cat_PC_3=  CategoryId from [dbo].[Category] where CategoryName='PC_CRIB_CTGY'
Select @cat_PC_4=  CategoryId from [dbo].[Category] where CategoryName='PC_NYCIRB_CTGY'
Select @cat_PC_5=  CategoryId from [dbo].[Category] where CategoryName='PC_PREMIUM_AUDIT_CTGY'
Select @cat_PC_6=  CategoryId from [dbo].[Category] where CategoryName='PC_PROSPECT-DECLINE_CTGY'
Select @cat_PC_7=  CategoryId from [dbo].[Category] where CategoryName='PC_SOLE_PRPRTOR-PARTNER_CTGY'
Select @cat_PC_8=  CategoryId from [dbo].[Category] where CategoryName='PC_UNDERWRITING_CTGY'
Select @cat_PC_9=  CategoryId from [dbo].[Category] where CategoryName='PC_USL_AND_H_CTGY'


declare  @doc1 int, @doc2 int, @doc3 int, @doc4 int, @doc5 int, @doc6 int, @doc7 int, @doc8 int, @doc9 int, 
@doc10 int, @doc11 int, @doc12 int, @doc13 int, @doc14 int, @doc15 int, @doc16 int, @doc17 int, @doc18 int, @doc19 int, 
@doc20 int, @doc21 int, @doc22 int, @doc23 int, @doc24 int, @doc25 int, @doc26 int, @doc27 int, @doc28 int, @doc29 int, 
@doc30 int, @doc31 int, @doc32 int, @doc33 int, @doc34 int, @doc35 int, @doc36 int, @doc37 int, @doc38 int, @doc39 int, @doc40 int, @doc41 int


Select @doc1=  DocumentId from [dbo].[Document] where DocumentName='1st Fraud Notice Complied After Req'
Select @doc2=  DocumentId from [dbo].[Document] where DocumentName='1st Fraud Notice Req CRIB Assist'
Select @doc3=  DocumentId from [dbo].[Document] where DocumentName='Bkr Chg Add Delete Billing Opts'
Select @doc4=  DocumentId from [dbo].[Document] where DocumentName='Blank Letter Template Group'
Select @doc5=  DocumentId from [dbo].[Document] where DocumentName='Blank Letter Template Specific'
Select @doc6=  DocumentId from [dbo].[Document] where DocumentName='Broker Auth to Issue Cert'
Select @doc7=  DocumentId from [dbo].[Document] where DocumentName='Broker Authorization Ltr'
Select @doc8=  DocumentId from [dbo].[Document] where DocumentName='CRIB Req for Records Audit Complete'
Select @doc9=  DocumentId from [dbo].[Document] where DocumentName='CRIB Req Relief Redes Letter'
Select @doc10=  DocumentId from [dbo].[Document] where DocumentName='CRIB Zero Balance'
Select @doc11=  DocumentId from [dbo].[Document] where DocumentName='Description of Operations'
Select @doc12=  DocumentId from [dbo].[Document] where DocumentName='Exp Mod Letter Bidding'
Select @doc13=  DocumentId from [dbo].[Document] where DocumentName='Exp Mod Letter Bidding-Dates'
Select @doc14=  DocumentId from [dbo].[Document] where DocumentName='Fin Co Notify Fin Co of Prior CN'
Select @doc15=  DocumentId from [dbo].[Document] where DocumentName='Fin Co Rec Part of Agremt or Rec Ck'
Select @doc16=  DocumentId from [dbo].[Document] where DocumentName='Fin Co Received Complete Agreement'
Select @doc17=  DocumentId from [dbo].[Document] where DocumentName='Fin Co Req Reinst Too Late'
Select @doc18=  DocumentId from [dbo].[Document] where DocumentName='Fin Co Vol Pol NJM-NJRe'
Select @doc19=  DocumentId from [dbo].[Document] where DocumentName='Finance Co Final Request'
Select @doc20=  DocumentId from [dbo].[Document] where DocumentName='Fraud Letter'
Select @doc21=  DocumentId from [dbo].[Document] where DocumentName='Generic Blank Ltr Template Group'
Select @doc22=  DocumentId from [dbo].[Document] where DocumentName='Generic Blank Ltr Template Specific'
Select @doc23=  DocumentId from [dbo].[Document] where DocumentName='Insured Returned Mail'
Select @doc24=  DocumentId from [dbo].[Document] where DocumentName='Late Retro to CRIB'
Select @doc25=  DocumentId from [dbo].[Document] where DocumentName='Mail Audit'
Select @doc26=  DocumentId from [dbo].[Document] where DocumentName='Need Completed PP1B'
Select @doc27=  DocumentId from [dbo].[Document] where DocumentName='No Change Audit Correct'
Select @doc28=  DocumentId from [dbo].[Document] where DocumentName='No Change Lack of Cooperation'
Select @doc29=  DocumentId from [dbo].[Document] where DocumentName='No Midterm Election Change'
Select @doc30=  DocumentId from [dbo].[Document] where DocumentName='Non Pay to Broker'
Select @doc31=  DocumentId from [dbo].[Document] where DocumentName='NYCIRB Endorsement Filed'

Select @doc32=  DocumentId from [dbo].[Document] where DocumentName='Preliminary Audit Ltr'
Select @doc33=  DocumentId from [dbo].[Document] where DocumentName='Re-Audit Decline'

Select @doc34=  DocumentId from [dbo].[Document] where DocumentName='Received Another PP1B Form'
Select @doc35=  DocumentId from [dbo].[Document] where DocumentName='Redesignation Quote Returned Mail'
Select @doc36=  DocumentId from [dbo].[Document] where DocumentName='Request Bureau File Number'
Select @doc37=  DocumentId from [dbo].[Document] where DocumentName='Request IRS Info'
Select @doc38=  DocumentId from [dbo].[Document] where DocumentName='Returning Incomplete PP1B Form'
Select @doc39=  DocumentId from [dbo].[Document] where DocumentName='Test Audit Reqd Audit not Complete'
Select @doc40=  DocumentId from [dbo].[Document] where DocumentName='USL and H If Any Letter'
Select @doc41=  DocumentId from [dbo].[Document] where DocumentName='Waiver of Subrogation Ltr'






INSERT [dbo].[CategoryDocument] (DocumentId,CategoryId,DocumentOrder, EffectiveDate, ExpirationDate,CreatedBy, CreatedDateTime, UpdatedBy, UpdatedDateTime)
VALUES

(@doc4,@cat_PC_1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@cat_PC_1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@cat_PC_1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@cat_PC_1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

(@doc3,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc30,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

(@doc9,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc36,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

(@doc31,@cat_PC_4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

(@doc1,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc8,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc25,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc33,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc39,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

(@doc35,@cat_PC_6,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

(@doc26,@cat_PC_7,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc29,@cat_PC_7,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc34,@cat_PC_7,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc38,@cat_PC_7,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

(@doc11,@cat_PC_8,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc12,@cat_PC_8,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@cat_PC_8,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@cat_PC_8,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@cat_PC_8,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@cat_PC_8,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc17,@cat_PC_8,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc18,@cat_PC_8,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@cat_PC_8,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@cat_PC_8,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc32,@cat_PC_8,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc37,@cat_PC_8,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc41,@cat_PC_8,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

(@doc40,@cat_PC_9,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)


GO



declare  @doc1 int, @doc2 int, @doc3 int, @doc4 int, @doc5 int, @doc6 int, @doc7 int, @doc8 int, @doc9 int, 
@doc10 int, @doc11 int, @doc12 int, @doc13 int, @doc14 int, @doc15 int, @doc16 int, @doc17 int, @doc18 int, @doc19 int, 
@doc20 int, @doc21 int, @doc22 int, @doc23 int, @doc24 int, @doc25 int, @doc26 int, @doc27 int, @doc28 int, @doc29 int, 
@doc30 int, @doc31 int, @doc32 int, @doc33 int, @doc34 int, @doc35 int, @doc36 int, @doc37 int, @doc38 int, @doc39 int, @doc40 int, @doc41 int


Select @doc1=  DocumentId from [dbo].[Document] where DocumentName='1st Fraud Notice Complied After Req'
Select @doc2=  DocumentId from [dbo].[Document] where DocumentName='1st Fraud Notice Req CRIB Assist'
Select @doc3=  DocumentId from [dbo].[Document] where DocumentName='Bkr Chg Add Delete Billing Opts'
Select @doc4=  DocumentId from [dbo].[Document] where DocumentName='Blank Letter Template Group'
Select @doc5=  DocumentId from [dbo].[Document] where DocumentName='Blank Letter Template Specific'
Select @doc6=  DocumentId from [dbo].[Document] where DocumentName='Broker Auth to Issue Cert'
Select @doc7=  DocumentId from [dbo].[Document] where DocumentName='Broker Authorization Ltr'
Select @doc8=  DocumentId from [dbo].[Document] where DocumentName='CRIB Req for Records Audit Complete'
Select @doc9=  DocumentId from [dbo].[Document] where DocumentName='CRIB Req Relief Redes Letter'
Select @doc10=  DocumentId from [dbo].[Document] where DocumentName='CRIB Zero Balance'
Select @doc11=  DocumentId from [dbo].[Document] where DocumentName='Description of Operations'
Select @doc12=  DocumentId from [dbo].[Document] where DocumentName='Exp Mod Letter Bidding'
Select @doc13=  DocumentId from [dbo].[Document] where DocumentName='Exp Mod Letter Bidding-Dates'
Select @doc14=  DocumentId from [dbo].[Document] where DocumentName='Fin Co Notify Fin Co of Prior CN'
Select @doc15=  DocumentId from [dbo].[Document] where DocumentName='Fin Co Rec Part of Agremt or Rec Ck'
Select @doc16=  DocumentId from [dbo].[Document] where DocumentName='Fin Co Received Complete Agreement'
Select @doc17=  DocumentId from [dbo].[Document] where DocumentName='Fin Co Req Reinst Too Late'
Select @doc18=  DocumentId from [dbo].[Document] where DocumentName='Fin Co Vol Pol NJM-NJRe'
Select @doc19=  DocumentId from [dbo].[Document] where DocumentName='Finance Co Final Request'
Select @doc20=  DocumentId from [dbo].[Document] where DocumentName='Fraud Letter'
Select @doc21=  DocumentId from [dbo].[Document] where DocumentName='Generic Blank Ltr Template Group'
Select @doc22=  DocumentId from [dbo].[Document] where DocumentName='Generic Blank Ltr Template Specific'
Select @doc23=  DocumentId from [dbo].[Document] where DocumentName='Insured Returned Mail'
Select @doc24=  DocumentId from [dbo].[Document] where DocumentName='Late Retro to CRIB'
Select @doc25=  DocumentId from [dbo].[Document] where DocumentName='Mail Audit'
Select @doc26=  DocumentId from [dbo].[Document] where DocumentName='Need Completed PP1B'
Select @doc27=  DocumentId from [dbo].[Document] where DocumentName='No Change Audit Correct'
Select @doc28=  DocumentId from [dbo].[Document] where DocumentName='No Change Lack of Cooperation'
Select @doc29=  DocumentId from [dbo].[Document] where DocumentName='No Midterm Election Change'
Select @doc30=  DocumentId from [dbo].[Document] where DocumentName='Non Pay to Broker'
Select @doc31=  DocumentId from [dbo].[Document] where DocumentName='NYCIRB Endorsement Filed'
Select @doc32=  DocumentId from [dbo].[Document] where DocumentName='Preliminary Audit Ltr'
Select @doc33=  DocumentId from [dbo].[Document] where DocumentName='Re-Audit Decline'
Select @doc34=  DocumentId from [dbo].[Document] where DocumentName='Received Another PP1B Form'
Select @doc35=  DocumentId from [dbo].[Document] where DocumentName='Redesignation Quote Returned Mail'
Select @doc36=  DocumentId from [dbo].[Document] where DocumentName='Request Bureau File Number'
Select @doc37=  DocumentId from [dbo].[Document] where DocumentName='Request IRS Info'
Select @doc38=  DocumentId from [dbo].[Document] where DocumentName='Returning Incomplete PP1B Form'
Select @doc39=  DocumentId from [dbo].[Document] where DocumentName='Test Audit Reqd Audit not Complete'
Select @doc40=  DocumentId from [dbo].[Document] where DocumentName='USL and H If Any Letter'
Select @doc41=  DocumentId from [dbo].[Document] where DocumentName='Waiver of Subrogation Ltr'


--Controls

declare  @ctrlAddr int, @ctrlCCSection int, @ctrlModSection int, @ctrlPrinter int

Select @ctrlAddr=  ControlId from [dbo].[Control] where ControlName='WcuAddrNmCompanyAddress'
Select @ctrlCCSection=  ControlId from [dbo].[Control] where ControlName='WcuCCSection'
Select @ctrlModSection=  ControlId from [dbo].[Control] where ControlName='WcuYearModSection'
Select @ctrlPrinter=  ControlId from [dbo].[Control] where ControlName='PrinterDropdown'

 INSERT [dbo].[DocumentControl] (
       [DocumentId]
      ,[ControlId]
      ,[ControlOrder]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES

(@doc1,@ctrlPrinter,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlCCSection,200,SUSER_SNAME(),GETDATE(),null,null),

(@doc2,@ctrlPrinter,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlCCSection,200,SUSER_SNAME(),GETDATE(),null,null),

(@doc3,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc3,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc3,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc4,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc4,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc4,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc5,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc6,@ctrlPrinter,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@ctrlCCSection,200,SUSER_SNAME(),GETDATE(),null,null),

(@doc7,@ctrlPrinter,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlCCSection,200,SUSER_SNAME(),GETDATE(),null,null),

(@doc8,@ctrlPrinter,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc8,@ctrlCCSection,200,SUSER_SNAME(),GETDATE(),null,null),

(@doc9,@ctrlPrinter,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@ctrlCCSection,200,SUSER_SNAME(),GETDATE(),null,null),

(@doc10,@ctrlPrinter,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@ctrlCCSection,200,SUSER_SNAME(),GETDATE(),null,null),

(@doc11,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc12,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc12,@ctrlModSection,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc12,@ctrlPrinter,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc12,@ctrlCCSection,400,SUSER_SNAME(),GETDATE(),null,null),

(@doc13,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@ctrlModSection,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@ctrlPrinter,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@ctrlCCSection,400,SUSER_SNAME(),GETDATE(),null,null),

(@doc14,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc15,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc16,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc17,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc17,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc17,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc18,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc18,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc19,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc20,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc21,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc22,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc23,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc24,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc25,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),

(@doc26,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc26,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc26,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc27,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc28,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc29,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc29,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc29,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc30,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc30,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc30,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc31,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc31,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc32,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc32,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc33,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc33,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc33,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc34,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc34,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc34,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc35,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc35,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc35,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc36,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc36,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc37,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc37,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc37,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc38,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc38,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc38,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc39,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc39,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc40,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc40,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc40,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc41,@ctrlAddr,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc41,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc41,@ctrlCCSection,300,SUSER_SNAME(),GETDATE(),null,null)


GO


declare @lobIdPa int,@lobWCU int, @lob int

Select @lobWCU=  lobId from dbo.LOB where LOBName='PC-WCU'
print @lobWCU

 INSERT [dbo].[Configuration] (
	   [LOBId]
	  ,[ConfigKey]
	  ,[ConfigValue]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES
(@lobWCU,'POL_PK','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'BILL_PK','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'BILL_FK','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'AUTHOR_EXEC_IND','N',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'WCU_CSF_TYPE','M',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'BILL_PK','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'SRC_SYS','ADHOC',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'BARCODE_IND','Y',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'CERT_IND','N',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'POL_FK','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'CC_BCC_IND','Y',SUSER_SNAME(),GETDATE(),null,null),

(@lobWCU,'ARCHIVE_IND','Y',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'PRINT_IND','DEPT',SUSER_SNAME(),GETDATE(),null,null)

GO

