USE [ACE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Insert into [dbo].[Category] (CategoryName,CategoryFriendlyName,IsCategoryActive,
CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
('BC_UW_ACCOUNTS_RECEIVABLE_CTGY',		'Accounts Receivable',	1,SUSER_SNAME(),GETDATE(),null,null),
('BC_UW_CASH_MANAGEMENT_REMIT_CTGY',	'Cash Management Remittance',	1,SUSER_SNAME(),GETDATE(),null,null),
('BC_UW_CREDIT_AND_COLLECTION_CTGY',	'Credit and Collection',	1,SUSER_SNAME(),GETDATE(),null,null),
('BC_UW_BLANK_LETTER_TEMPLATE',			'Blank Letter Templates',	1,SUSER_SNAME(),GETDATE(),null,null),
('BC_UW_GENERAL_CTGY',					'General',	1,SUSER_SNAME(),GETDATE(),null,null),

--BC WCU
('BC_ACCOUNTS_RECEIVABLE_CTGY',			'Accounts Receivable',	1,SUSER_SNAME(),GETDATE(),null,null),
('BC_CASH_MANAGEMENT_REMIT_CTGY',		'Cash Management Remittance',	1,SUSER_SNAME(),GETDATE(),null,null),
('BC_CREDIT_AND_COLLECTION_CTGY',		'Credit and Collection',	1,SUSER_SNAME(),GETDATE(),null,null)

go

Insert into [dbo].[Document] (DocumentName,DocumentFriendlyName,IsDocumentActive, BaseState,JldFilePath,DocumentType,
CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('PL Request Reissue of Check',		'Request Reissue of Check',	1,						NULL,	'companyRoot:S:Production://Templates/BillingCenter/PL Request Reissue of Check.jld',	'POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PL Return Pymts',					'Return Pymts',	1,									NULL,	'companyRoot:S:Production://Templates/BillingCenter/PL Return Pymts.jld',	'POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PL Not Honored Pymt on Pending CN',		'Not Honored Pymt on Pending Cancel',	1,	NULL,	'companyRoot:S:Production://Templates/BillingCenter/PL Not Honored Pymt on Pending CN.jld',	'CM  Collections - Cancel Notices',SUSER_SNAME(),GETDATE(),null,null),
('PL Not Honored Pymt Orig CN DT Stnd',		'Not Honored Pymt Orig CN Date Stnds',	1,	NULL,	'companyRoot:S:Production://Templates/BillingCenter/PL Not Honored Pymt Orig CN DT Stnd.jld',	'CM  Collections - Cancel Notices',SUSER_SNAME(),GETDATE(),null,null),
('PL Not Honored Pymt Request Replace',		'Not Honored Pymt Request Replacement',	1,	NULL,	'companyRoot:S:Production://Templates/BillingCenter/PL Not Honored Pymt Request Replace.jld',	'POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PL Partial Pymt Pending CN Stands',		'Partial Pymt Pending CN Stands',	1,		NULL,	'companyRoot:S:Production://Templates/BillingCenter/PL Partial Pymt Pending CN Stands.jld',	'CM  Collections - Cancel Notices',SUSER_SNAME(),GETDATE(),null,null),
('PL Pymt Accepted CN Stands',		'Pymt Accepted Cancellation Stands',	1,			NULL,	'companyRoot:S:Production://Templates/BillingCenter/PL Pymt Accepted CN Stands.jld',	'CM  Collections - Cancel Notices',SUSER_SNAME(),GETDATE(),null,null),
('PL Return Pymt Letter',			'Return Pymt Letter',	1,							NULL,	'companyRoot:S:Production://Templates/BillingCenter/PL Return Pymt Letter.jld',	'CM  Collections - Cancel Notices',SUSER_SNAME(),GETDATE(),null,null),
('PL BC Blank Letter Template',		'Blank Letter Template',	1,						NULL,	'companyRoot:S:Production://Templates/BillingCenter/PL BC Blank Letter Template.jld',	'POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PL Policyholder Acct Statement',		'Policyholder Accounting Statement',	1,		NULL,	'companyRoot:S:Production://Templates/BillingCenter/PL Policyholder Acct Statement.jld',	'POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Manual Invoice',					'Manual Invoice',	1,								NULL,	'companyRoot:S:Production://Templates/BillingCenter/Manual Invoice.jld',	'POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('DD-Request for Updated Information',	'DD-Request for Updated Information',	1,		NULL,	'companyRoot:S:Production://Templates/BillingCenter/DD-Request for Updated Information.jld',	'POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('EBPP Failed Payment Letter',		'EBPP Failed Payment Letter',	1,					NULL,	'companyRoot:S:Production://Templates/BillingCenter/EBPP Failed Payment Letter.jld',	'POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),


-- for BC-WCU
('2nd Request For Unearned Commission',	'2nd Request For Unearned Commission',	1,		NULL,	'companyRoot:S:Production://Templates/BillingCenterWCU/2nd Request for Unearned Commission.jld',	'CM  Billing',SUSER_SNAME(),GETDATE(),null,null),
('Policyholder Accounting Statement',	'Policyholder Accounting Statement',	1,		NULL,	'companyRoot:S:Production://Templates/BillingCenterWCU/Policyholder Accounting Statement.jld',		'WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Manual Invoice',						'Manual Invoice',	1,							NULL,	'companyRoot:S:Production://Templates/BillingCenterWCU/Manual Invoice.jld',							'WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('EBPP Failed Payment Letter',			'EBPP Failed Payment Letter',	1,				NULL,	'companyRoot:S:Production://Templates/BillingCenterWCU/EBPP Failed Payment Letter.jld',				'WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Return Pymts',						'Return Pymts',	1,								NULL,	'companyRoot:S:Production://Templates/BillingCenterWCU/Return Pymts.jld',							'WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Not Honored Pymt on Pending Cancel',	'Not Honored Pymt on Pending CN',	1,			NULL,	'companyRoot:S:Production://Templates/BillingCenterWCU/Not Honored Pymt on Pending Cancel.jld',		'WCU  Non Payment Cancellation and Reinstatement',SUSER_SNAME(),GETDATE(),null,null),
('Not Honored Pymt Orig CN Date Stnds',	'Not Honored Pymt Orig CN Date Stnds',	1,		NULL,	'companyRoot:S:Production://Templates/BillingCenterWCU/Not Honored Pymt Orig CN Date Stnds.jld',	'WCU  Non Payment Cancellation and Reinstatement',SUSER_SNAME(),GETDATE(),null,null),
('Not Honored Pymt Request Replacemnt',	'Not Honored Pymt Request Replacemnt',	1,		NULL,	'companyRoot:S:Production://Templates/BillingCenterWCU/Not Honored Pymt Request Replacemnt.jld',	'WCU  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Pymt Accepted Cancellation Stands',	'Pymt Accepted Cancellation Stands',	1,		NULL,	'companyRoot:S:Production://Templates/BillingCenterWCU/Pymt Accepted Cancellation Stands.jld',		'WCU  Non Payment Cancellation and Reinstatement',SUSER_SNAME(),GETDATE(),null,null),
('Return Pymt Letter',					'Return Pymt Letter',	1,						NULL,	'companyRoot:S:Production://Templates/BillingCenterWCU/Return Pymt Letter.jld',						'WCU  Non Payment Cancellation and Reinstatement',SUSER_SNAME(),GETDATE(),null,null),
('Partial Pymt Pending CN Stands',		'Partial Pymt Pending CN Stands',	1,			NULL,	'companyRoot:S:Production://Templates/BillingCenterWCU/Partial Pymt Pending CN Stands.jld',			'WCU  Non Payment Cancellation and Reinstatement',SUSER_SNAME(),GETDATE(),null,null)


go

INSERT [dbo].[Control]
(
       [ControlName]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime] )
	values 
	 ('BCPAAddresseeOneAndTwo',SUSER_SNAME(),GETDATE(),null,null),
	 ('BCPACcSection',SUSER_SNAME(),GETDATE(),null,null),
	 ('BCPAAddresseewAttentionNm',SUSER_SNAME(),GETDATE(),null,null),
	 ('BCPAActStmtAddresseeOneTwo',SUSER_SNAME(),GETDATE(),null,null),
	 ('RemittanceIndicator',SUSER_SNAME(),GETDATE(),null,null),

	 --BC - Wcu
	 ('BCWCUCcSection',SUSER_SNAME(),GETDATE(),null,null),
	 ('BCWCUAddresseeAndAttentionwDba',SUSER_SNAME(),GETDATE(),null,null),
	 ('BCWCUAddresseewDba',SUSER_SNAME(),GETDATE(),null,null),
	 ('BCWCUAddresseewAttentionNmProducer',SUSER_SNAME(),GETDATE(),null,null),
	 ('BCWCUProducerCcSection',SUSER_SNAME(),GETDATE(),null,null)


  

declare @lobIdPa int,@lobWCU int
declare @cat_BC_UW_ACCOUNTS int,@cat_BC_UW_CASH int, @cat_BC_UW_CREDIT int, @cat_BC_UW_BLANK int, @cat_BC_UW_GENERAL int
declare @cat_BC_WCU_CREDIT int,@cat_BC_WCU_REMIT int, @cat_BC_WCU_RECI int

Select @lobIdPa=  lobId from dbo.LOB where LOBName='BC-PA'
Select @lobWCU=  lobId from dbo.LOB where LOBName='BC-WCU'

Select @cat_BC_UW_ACCOUNTS=  CategoryId from [dbo].[Category] where CategoryName='BC_UW_ACCOUNTS_RECEIVABLE_CTGY'
Select @cat_BC_UW_CASH=  CategoryId from [dbo].[Category] where CategoryName='BC_UW_CASH_MANAGEMENT_REMIT_CTGY'
Select @cat_BC_UW_CREDIT=  CategoryId from [dbo].[Category] where CategoryName='BC_UW_CREDIT_AND_COLLECTION_CTGY'
Select @cat_BC_UW_BLANK=  CategoryId from [dbo].[Category] where CategoryName='BC_UW_BLANK_LETTER_TEMPLATE'
Select @cat_BC_UW_GENERAL=  CategoryId from [dbo].[Category] where CategoryName='BC_UW_GENERAL_CTGY'

--wcu
Select @cat_BC_WCU_RECI=  CategoryId from [dbo].[Category] where CategoryName='BC_ACCOUNTS_RECEIVABLE_CTGY'
Select @cat_BC_WCU_REMIT=  CategoryId from [dbo].[Category] where CategoryName='BC_CASH_MANAGEMENT_REMIT_CTGY'
Select @cat_BC_WCU_CREDIT=  CategoryId from [dbo].[Category] where CategoryName='BC_CREDIT_AND_COLLECTION_CTGY'



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
	(@lobIdPa,@cat_BC_UW_ACCOUNTS,10,'Inspire_ACE_Prod,Inspire_Accounts_Receivable,Inspire_CNSLT_AR',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobIdPa,@cat_BC_UW_CASH,20,'Inspire_ACE_Prod,Inspire_Remittance,Inspire_CNSLT_Remit',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobIdPa,@cat_BC_UW_CREDIT,30,'Inspire_ACE_Prod,Inspire_Credit_and_Collections,Inspire_CNSLT_CredandColl',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobIdPa,@cat_BC_UW_BLANK,40,'Inspire_ACE_Prod,Inspire_Blank_Letter_Template,Inspire_CNSLT_BLT',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobIdPa,@cat_BC_UW_GENERAL,50,'Inspire_ACE_Prod,Inspire_Commercial_Lines,Inspire_Accounts_Receivable,Inspire_Blank_Letter_Template,Inspire_Remittance,Inspire_Credit_and_Collections,Inspire_CNSLT_AR,Inspire_CNSLT_BLT,Inspire_CNSLT_Remit,Inspire_CNSLT_CredandColl,Inspire_PL_HUD_Admin',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),

	--BC-WCU
	(@lobWCU,@cat_BC_WCU_RECI,60,'Inspire_ACE_Prod,Inspire_Accounts_Receivable,Inspire_CNSLT_AR',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobWCU,@cat_BC_WCU_REMIT,70,'Inspire_ACE_Prod,Inspire_Remittance,Inspire_CNSLT_Remit',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobWCU,@cat_BC_WCU_CREDIT,80,'Inspire_ACE_Prod,Inspire_Credit_and_Collections,Inspire_CNSLT_CredandColl',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null)

GO


declare @lobIdPa int,@lobWCU int
declare @cat_BC_UW_ACCOUNTS int,@cat_BC_UW_CASH int, @cat_BC_UW_CREDIT int, @cat_BC_UW_BLANK int, @cat_BC_UW_GENERAL int
declare @cat_BC_WCU_CREDIT int,@cat_BC_WCU_REMIT int, @cat_BC_WCU_RECI int

Select @lobIdPa=  lobId from dbo.LOB where LOBName='BC-PA'

Select @cat_BC_UW_ACCOUNTS=  CategoryId from [dbo].[Category] where CategoryName='BC_UW_ACCOUNTS_RECEIVABLE_CTGY'
Select @cat_BC_UW_CASH=  CategoryId from [dbo].[Category] where CategoryName='BC_UW_CASH_MANAGEMENT_REMIT_CTGY'
Select @cat_BC_UW_CREDIT=  CategoryId from [dbo].[Category] where CategoryName='BC_UW_CREDIT_AND_COLLECTION_CTGY'
Select @cat_BC_UW_BLANK=  CategoryId from [dbo].[Category] where CategoryName='BC_UW_BLANK_LETTER_TEMPLATE'
Select @cat_BC_UW_GENERAL=  CategoryId from [dbo].[Category] where CategoryName='BC_UW_GENERAL_CTGY'

--BCU
Select @lobWCU=  lobId from dbo.LOB where LOBName='BC-WCU'

Select @cat_BC_WCU_RECI=  CategoryId from [dbo].[Category] where CategoryName='BC_ACCOUNTS_RECEIVABLE_CTGY'
Select @cat_BC_WCU_REMIT=  CategoryId from [dbo].[Category] where CategoryName='BC_CASH_MANAGEMENT_REMIT_CTGY'
Select @cat_BC_WCU_CREDIT=  CategoryId from [dbo].[Category] where CategoryName='BC_CREDIT_AND_COLLECTION_CTGY'


declare  @docddremove int, @docddwait int, @docplreq int, @docplclaim int, @docplreturn int, @docddremovecancel int, @docplnotpen int, @docplnotstnd int,
 @docplnotreplace int,  @docplpartialstand int, @docplpymt int, @docplreturnletter int, @docplblank int,
 @docplpolicy int,  @docmanual int, @docddescrow int,  @docddrequest int,  @docebpp int

 declare @docpl2ndWCU int, @docplPolWCU int, @docplManualWCU int, @docplEBPPWCU int, @docplReturnpymWCU int, @docplnotCancelWCU int
, @docplNOTSTNDSWCU int, @docplnotreplaceWCU int, @docplpymtWCU int, @docplreturnWCU int, @docplpartialWCU int

Select @docplreq=  DocumentId from [dbo].[Document] where DocumentName='PL Request Reissue of Check'
Select @docplreturn=  DocumentId from [dbo].[Document] where DocumentName='PL Return Pymts'
Select @docplnotpen=  DocumentId from [dbo].[Document] where DocumentName='PL Not Honored Pymt on Pending CN'
Select @docplnotstnd=  DocumentId from [dbo].[Document] where DocumentName='PL Not Honored Pymt Orig CN DT Stnd'
Select @docplnotreplace=  DocumentId from [dbo].[Document] where DocumentName='PL Not Honored Pymt Request Replace'
Select @docplpartialstand=  DocumentId from [dbo].[Document] where DocumentName='PL Partial Pymt Pending CN Stands'
Select @docplpymt=  DocumentId from [dbo].[Document] where DocumentName='PL Pymt Accepted CN Stands'
Select @docplreturnletter=  DocumentId from [dbo].[Document] where DocumentName='PL Return Pymt Letter'
Select @docplblank=  DocumentId from [dbo].[Document] where DocumentName='PL BC Blank Letter Template'
Select @docplpolicy=  DocumentId from [dbo].[Document] where DocumentName='PL Policyholder Acct Statement'
Select @docmanual=  DocumentId from [dbo].[Document] where DocumentName='Manual Invoice' AND DocumentType='POLDOC  Correspondence'
Select @docddrequest=  DocumentId from [dbo].[Document] where DocumentName='DD-Request for Updated Information'
Select @docebpp=  DocumentId from [dbo].[Document] where DocumentName='EBPP Failed Payment Letter'AND DocumentType='POLDOC  Correspondence'

--WCU
Select @docpl2ndWCU=  DocumentId from [dbo].[Document] where DocumentName='2nd Request For Unearned Commission'
Select @docplPolWCU=  DocumentId from [dbo].[Document] where DocumentName='Policyholder Accounting Statement'
Select @docplManualWCU=  DocumentId from [dbo].[Document] where DocumentName='Manual Invoice'AND DocumentType='WCU  Correspondence'
Select @docplEBPPWCU=  DocumentId from [dbo].[Document] where DocumentName='EBPP Failed Payment Letter'AND DocumentType='WCU  Correspondence'
Select @docplReturnpymWCU=  DocumentId from [dbo].[Document] where DocumentName='Return Pymts'
Select @docplnotCancelWCU=  DocumentId from [dbo].[Document] where DocumentName='Not Honored Pymt on Pending Cancel'
Select @docplNOTSTNDSWCU=  DocumentId from [dbo].[Document] where DocumentName='Not Honored Pymt Orig CN Date Stnds'
Select @docplnotreplaceWCU=  DocumentId from [dbo].[Document] where DocumentName='Not Honored Pymt Request Replacemnt'
Select @docplpymtWCU=  DocumentId from [dbo].[Document] where DocumentName='Pymt Accepted Cancellation Stands'
Select @docplreturnWCU=  DocumentId from [dbo].[Document] where DocumentName='Return Pymt Letter'
Select @docplpartialWCU=  DocumentId from [dbo].[Document] where DocumentName='Partial Pymt Pending CN Stands'



INSERT [dbo].[CategoryDocument] (DocumentId,CategoryId,DocumentOrder, EffectiveDate, ExpirationDate,CreatedBy, CreatedDateTime, UpdatedBy, UpdatedDateTime)
VALUES

(@docddrequest,@cat_BC_UW_ACCOUNTS,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docebpp,@cat_BC_UW_ACCOUNTS,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docplreq,@cat_BC_UW_ACCOUNTS,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docplblank,@cat_BC_UW_BLANK,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docplreturn,@cat_BC_UW_CASH,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docplnotpen,@cat_BC_UW_CREDIT,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docplnotstnd,@cat_BC_UW_CREDIT,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docplnotreplace,@cat_BC_UW_CREDIT,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docplpartialstand,@cat_BC_UW_CREDIT,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docplpymt,@cat_BC_UW_CREDIT,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docplreturnletter,@cat_BC_UW_CREDIT,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docmanual,@cat_BC_UW_GENERAL,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docplpolicy,@cat_BC_UW_GENERAL,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

--wcu
(@docpl2ndWCU,@cat_BC_WCU_RECI,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docplPolWCU,@cat_BC_WCU_RECI,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docplManualWCU,@cat_BC_WCU_RECI,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docplEBPPWCU,@cat_BC_WCU_RECI,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docplReturnpymWCU,@cat_BC_WCU_REMIT,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docplnotCancelWCU,@cat_BC_WCU_CREDIT,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docplNOTSTNDSWCU,@cat_BC_WCU_CREDIT,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docplnotreplaceWCU,@cat_BC_WCU_CREDIT,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docplpymtWCU,@cat_BC_WCU_CREDIT,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docplreturnWCU,@cat_BC_WCU_CREDIT,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@docplpartialWCU,@cat_BC_WCU_CREDIT,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)



GO

declare  @docddremove int, @docddwait int, @docplreq int, @docplclaim int, @docplreturn int, @docddremovecancel int, @docplnotpen int, @docplnotstnd int,
 @docplnotreplace int,  @docplpartialstand int, @docplpymt int, @docplreturnletter int, @docplblank int,
 @docplpolicy int,  @docmanual int, @docddescrow int,  @docddrequest int,  @docebpp int

  declare @docpl2ndWCU int, @docplPolWCU int, @docplManualWCU int, @docplEBPPWCU int, @docplReturnpymWCU int, @docplnotCancelWCU int
, @docplNOTSTNDSWCU int, @docplnotreplaceWCU int, @docplpymtWCU int, @docplreturnWCU int, @docplpartialWCU int


Select @docplreq=  DocumentId from [dbo].[Document] where DocumentName='PL Request Reissue of Check'
Select @docplreturn=  DocumentId from [dbo].[Document] where DocumentName='PL Return Pymts'
Select @docplnotpen=  DocumentId from [dbo].[Document] where DocumentName='PL Not Honored Pymt on Pending CN'
Select @docplnotstnd=  DocumentId from [dbo].[Document] where DocumentName='PL Not Honored Pymt Orig CN DT Stnd'
Select @docplnotreplace=  DocumentId from [dbo].[Document] where DocumentName='PL Not Honored Pymt Request Replace'
Select @docplpartialstand=  DocumentId from [dbo].[Document] where DocumentName='PL Partial Pymt Pending CN Stands'
Select @docplpymt=  DocumentId from [dbo].[Document] where DocumentName='PL Pymt Accepted CN Stands'
Select @docplreturnletter=  DocumentId from [dbo].[Document] where DocumentName='PL Return Pymt Letter'
Select @docplblank=  DocumentId from [dbo].[Document] where DocumentName='PL BC Blank Letter Template'
Select @docplpolicy=  DocumentId from [dbo].[Document] where DocumentName='PL Policyholder Acct Statement'
Select @docmanual=  DocumentId from [dbo].[Document] where DocumentName='Manual Invoice' AND DocumentType='POLDOC  Correspondence'
Select @docddrequest=  DocumentId from [dbo].[Document] where DocumentName='DD-Request for Updated Information'
Select @docebpp=  DocumentId from [dbo].[Document] where DocumentName='EBPP Failed Payment Letter' AND DocumentType='POLDOC  Correspondence'


--BC-WCU
Select @docpl2ndWCU=  DocumentId from [dbo].[Document] where DocumentName='2nd Request For Unearned Commission'
Select @docplPolWCU=  DocumentId from [dbo].[Document] where DocumentName='Policyholder Accounting Statement'
Select @docplManualWCU=  DocumentId from [dbo].[Document] where DocumentName='Manual Invoice'AND DocumentType='WCU  Correspondence'
Select @docplEBPPWCU=  DocumentId from [dbo].[Document] where DocumentName='EBPP Failed Payment Letter'AND DocumentType='WCU  Correspondence'
Select @docplReturnpymWCU=  DocumentId from [dbo].[Document] where DocumentName='Return Pymts'
Select @docplnotCancelWCU=  DocumentId from [dbo].[Document] where DocumentName='Not Honored Pymt on Pending Cancel'
Select @docplNOTSTNDSWCU=  DocumentId from [dbo].[Document] where DocumentName='Not Honored Pymt Orig CN Date Stnds'
Select @docplnotreplaceWCU=  DocumentId from [dbo].[Document] where DocumentName='Not Honored Pymt Request Replacemnt'
Select @docplpymtWCU=  DocumentId from [dbo].[Document] where DocumentName='Pymt Accepted Cancellation Stands'
Select @docplreturnWCU=  DocumentId from [dbo].[Document] where DocumentName='Return Pymt Letter'
Select @docplpartialWCU=  DocumentId from [dbo].[Document] where DocumentName='Partial Pymt Pending CN Stands'

--Controls

declare  @ctrlOnentwo int, @ctrlcc int, @ctrlattn int, @ctrlline int, @ctrlbcpaa int, @ctrlremitt int, @ctlpinter int
declare @ctrlbcCCWCU int, @ctrlbcAdWCU int, @ctlbcDBAWCU int, @ctlbcDBAProdCCWCU int,@ctlbcDBAProdWCU int

Select @ctrlOnentwo=  ControlId from [dbo].[Control] where ControlName='BCPAAddresseeOneAndTwo'
Select @ctrlcc=  ControlId from [dbo].[Control] where ControlName='BCPACcSection'
Select @ctrlattn=  ControlId from [dbo].[Control] where ControlName='BCPAAddresseewAttentionNm'
Select @ctrlbcpaa=  ControlId from [dbo].[Control] where ControlName='BCPAActStmtAddresseeOneTwo'
Select @ctrlremitt=  ControlId from [dbo].[Control] where ControlName='RemittanceIndicator'
Select @ctlpinter=  ControlId from [dbo].[Control] where ControlName='PrinterDropdown'

--WCU
Select @ctrlbcCCWCU=  ControlId from [dbo].[Control] where ControlName='BCWCUCcSection'
Select @ctrlbcAdWCU=  ControlId from [dbo].[Control] where ControlName='BCWCUAddresseeAndAttentionwDba'
Select @ctlbcDBAWCU=  ControlId from [dbo].[Control] where ControlName='BCWCUAddresseewDba'
Select @ctlbcDBAProdWCU=  ControlId from [dbo].[Control] where ControlName='BCWCUAddresseewAttentionNmProducer'
Select @ctlbcDBAProdCCWCU=  ControlId from [dbo].[Control] where ControlName='BCWCUProducerCcSection'

 INSERT [dbo].[DocumentControl] (
       [DocumentId]
      ,[ControlId]
      ,[ControlOrder]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES


(@docddrequest,@ctrlOnentwo,100,SUSER_SNAME(),GETDATE(),null,null),
(@docddrequest,@ctlpinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@docddrequest,@ctrlcc,300,SUSER_SNAME(),GETDATE(),null,null),

(@docplreq,@ctrlOnentwo,100,SUSER_SNAME(),GETDATE(),null,null),
(@docplreq,@ctlpinter,300,SUSER_SNAME(),GETDATE(),null,null),
(@docplreq,@ctrlcc,400,SUSER_SNAME(),GETDATE(),null,null),


(@docebpp,@ctrlOnentwo,100,SUSER_SNAME(),GETDATE(),null,null),
(@docebpp,@ctlpinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@docebpp,@ctrlcc,300,SUSER_SNAME(),GETDATE(),null,null),

(@docplblank,@ctrlattn,100,SUSER_SNAME(),GETDATE(),null,null),
(@docplblank,@ctlpinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@docplblank,@ctrlcc,300,SUSER_SNAME(),GETDATE(),null,null),


(@docplreturn,@ctrlOnentwo,100,SUSER_SNAME(),GETDATE(),null,null),
(@docplreturn,@ctlpinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@docplreturn,@ctrlcc,300,SUSER_SNAME(),GETDATE(),null,null),

(@docplnotpen,@ctrlattn,100,SUSER_SNAME(),GETDATE(),null,null),
(@docplnotpen,@ctlpinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@docplnotpen,@ctrlcc,300,SUSER_SNAME(),GETDATE(),null,null),

(@docplnotstnd,@ctlpinter,300,SUSER_SNAME(),GETDATE(),null,null),
(@docplnotstnd,@ctrlcc,400,SUSER_SNAME(),GETDATE(),null,null),

(@docplnotreplace,@ctrlOnentwo,100,SUSER_SNAME(),GETDATE(),null,null),
(@docplnotreplace,@ctlpinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@docplnotreplace,@ctrlcc,300,SUSER_SNAME(),GETDATE(),null,null),

(@docplpartialstand,@ctrlattn,100,SUSER_SNAME(),GETDATE(),null,null),
(@docplpartialstand,@ctlpinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@docplpartialstand,@ctrlcc,300,SUSER_SNAME(),GETDATE(),null,null),

(@docplpymt,@ctrlOnentwo,100,SUSER_SNAME(),GETDATE(),null,null),
(@docplpymt,@ctlpinter,300,SUSER_SNAME(),GETDATE(),null,null),
(@docplpymt,@ctrlcc,300,SUSER_SNAME(),GETDATE(),null,null),

(@docplreturnletter,@ctrlOnentwo,100,SUSER_SNAME(),GETDATE(),null,null),
(@docplreturnletter,@ctlpinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@docplreturnletter,@ctrlcc,300,SUSER_SNAME(),GETDATE(),null,null),

(@docmanual,@ctrlbcpaa,100,SUSER_SNAME(),GETDATE(),null,null),
(@docmanual,@ctlpinter,200,SUSER_SNAME(),GETDATE(),null,null),


(@docplpolicy,@ctrlbcpaa,100,SUSER_SNAME(),GETDATE(),null,null),
(@docplpolicy,@ctrlremitt,200,SUSER_SNAME(),GETDATE(),null,null),
(@docplpolicy,@ctlpinter,300,SUSER_SNAME(),GETDATE(),null,null),


--WCU
(@docpl2ndWCU,@ctlbcDBAProdWCU,100,SUSER_SNAME(),GETDATE(),null,null),
(@docpl2ndWCU,@ctlpinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@docpl2ndWCU,@ctlbcDBAProdCCWCU,300,SUSER_SNAME(),GETDATE(),null,null),

(@docplPolWCU, @ctlbcDBAWCU,100,SUSER_SNAME(),GETDATE(),null,null),
(@docplPolWCU,@ctrlremitt,200,SUSER_SNAME(),GETDATE(),null,null),
(@docplPolWCU,@ctlpinter,300,SUSER_SNAME(),GETDATE(),null,null),

(@docplManualWCU,@ctlbcDBAWCU,100,SUSER_SNAME(),GETDATE(),null,null),
(@docplManualWCU,@ctlpinter,200,SUSER_SNAME(),GETDATE(),null,null),

(@docplEBPPWCU,@ctrlattn,100,SUSER_SNAME(),GETDATE(),null,null),
(@docplEBPPWCU,@ctlpinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@docplEBPPWCU,@ctrlbcCCWCU,300,SUSER_SNAME(),GETDATE(),null,null),

(@docplReturnpymWCU,@ctrlbcAdWCU,100,SUSER_SNAME(),GETDATE(),null,null),
(@docplReturnpymWCU,@ctlpinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@docplReturnpymWCU,@ctrlbcCCWCU,300,SUSER_SNAME(),GETDATE(),null,null),

(@docplnotCancelWCU,@ctrlbcAdWCU,100,SUSER_SNAME(),GETDATE(),null,null),
(@docplnotCancelWCU,@ctlpinter,200,SUSER_SNAME(),GETDATE(),null,null),

(@docplNOTSTNDSWCU,@ctrlattn,100,SUSER_SNAME(),GETDATE(),null,null),
(@docplNOTSTNDSWCU,@ctlpinter,200,SUSER_SNAME(),GETDATE(),null,null),

(@docplnotreplaceWCU,@ctrlattn,100,SUSER_SNAME(),GETDATE(),null,null),
(@docplnotreplaceWCU,@ctlpinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@docplnotreplaceWCU,@ctrlbcCCWCU,300,SUSER_SNAME(),GETDATE(),null,null),

(@docplpymtWCU,@ctrlattn,100,SUSER_SNAME(),GETDATE(),null,null),
(@docplpymtWCU,@ctlpinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@docplpymtWCU,@ctrlbcCCWCU,300,SUSER_SNAME(),GETDATE(),null,null),

(@docplreturnWCU,@ctrlattn,100,SUSER_SNAME(),GETDATE(),null,null),
(@docplreturnWCU,@ctlpinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@docplreturnWCU,@ctrlbcCCWCU,300,SUSER_SNAME(),GETDATE(),null,null),

(@docplpartialWCU,@ctrlattn,100,SUSER_SNAME(),GETDATE(),null,null),
(@docplpartialWCU,@ctlpinter,200,SUSER_SNAME(),GETDATE(),null,null),
(@docplpartialWCU,@ctrlbcCCWCU,300,SUSER_SNAME(),GETDATE(),null,null)


GO


declare @lobIdPa int,@lobWCU int, @lob int

Select @lobIdPa=  lobId from dbo.LOB where LOBName='BC-PA'
Select @lobWCU=  lobId from dbo.LOB where LOBName='BC-WCU'

 INSERT [dbo].[Configuration] (
	   [LOBId]
	  ,[ConfigKey]
	  ,[ConfigValue]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES

(@lobIdPa,'BILL_PK','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdPa,'SRC_SYS','ADHOC',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdPa,'BARCODE_IND','N',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdPa,'CERT_IND','N',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdPa,'ARCHIVE_IND','Y',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdPa,'PRINT_IND','DEPT',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdPa,'BILL_FK','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdPa,'CC_BCC_IND','Y',SUSER_SNAME(),GETDATE(),null,null),

--WCU
(@lobWCU,'BILL_PK','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'SRC_SYS','ADHOC',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'BARCODE_IND','N',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'CERT_IND','N',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'ARCHIVE_IND','Y',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'PRINT_IND','DEPT',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'BILL_FK','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'CC_BCC_IND','Y',SUSER_SNAME(),GETDATE(),null,null)

GO

declare @lobIdPCCA int,@lobIdPCCGL int, @lobIdPCBOP int,@lobIdPCCUMB int 
declare @lobIdPCMULTI int,@lobIdBCPA int, @lobIdBCWCU int,@lobIdPCPA int 
declare @lobIdPCHO int,@lobIdPCDW int, @lobIdPCUMB int,@lobIdGC int 
declare @lobIdWCC int,@lobIdPCWCU int 


Select @lobIdPCCA=  lobId from dbo.LOB where LOBName='PC-CA'
Select @lobIdPCCGL=  lobId from dbo.LOB where LOBName='PC-CGL'
Select @lobIdPCBOP=  lobId from dbo.LOB where LOBName='PC-BOP'
Select @lobIdPCCUMB=  lobId from dbo.LOB where LOBName='PC-CUMB'
Select @lobIdPCMULTI=  lobId from dbo.LOB where LOBName='PC-MULTI'

Select @lobIdBCPA=  lobId from dbo.LOB where LOBName='BC-PA'
Select @lobIdBCWCU=  lobId from dbo.LOB where LOBName='BC-WCU'

Select @lobIdPCPA=  lobId from dbo.LOB where LOBName='PC-PA'
Select @lobIdPCHO=  lobId from dbo.LOB where LOBName='PC-HO'
Select @lobIdPCDW=  lobId from dbo.LOB where LOBName='PC-DW'
Select @lobIdPCUMB=  lobId from dbo.LOB where LOBName='PC-UMB'

Select @lobIdGC=  lobId from dbo.LOB where LOBName='GC'
Select @lobIdWCC=  lobId from dbo.LOB where LOBName='WCC'
Select @lobIdPCWCU=  lobId from dbo.LOB where LOBName='PC-WCU'

 INSERT [dbo].[Configuration] (
	   [LOBId]
	  ,[ConfigKey]
	  ,[ConfigValue]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES

(@lobIdPCCA,'TICKET_JSON','Ticket.json',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdPCCGL,'TICKET_JSON','Ticket.json',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdPCBOP,'TICKET_JSON','Ticket.json',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdPCCUMB,'TICKET_JSON','Ticket.json',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdPCMULTI,'TICKET_JSON','Ticket.json',SUSER_SNAME(),GETDATE(),null,null),

(@lobIdBCPA,'TICKET_JSON','Ticket.json',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdBCWCU,'TICKET_JSON','WCU-Ticket.json',SUSER_SNAME(),GETDATE(),null,null),

(@lobIdPCPA,'TICKET_JSON','PL-Ticket.json',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdPCHO,'TICKET_JSON','PL-Ticket.json',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdPCDW,'TICKET_JSON','PL-Ticket.json',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdPCUMB,'TICKET_JSON','PL-Ticket.json',SUSER_SNAME(),GETDATE(),null,null),

(@lobIdGC,'TICKET_JSON','GC-Ticket.json',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdWCC,'TICKET_JSON','WCC-Ticket.json',SUSER_SNAME(),GETDATE(),null,null),
(@lobIdPCWCU,'TICKET_JSON','WCUPC-Ticket.json',SUSER_SNAME(),GETDATE(),null,null)












