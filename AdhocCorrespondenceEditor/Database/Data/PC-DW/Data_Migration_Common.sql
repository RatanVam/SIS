USE [ACE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Insert into [dbo].[Category] (CategoryName,CategoryFriendlyName,IsCategoryActive,
CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 

('PL_GENERAL_DW',		'DW General',		1,SUSER_SNAME(),GETDATE(),null,null),
('PL_UNDERWRITING_DW',	'DW Underwriter',	1,SUSER_SNAME(),GETDATE(),null,null),
('PL_MAILER_SHEET_DW',	'PL Multiline',	1,SUSER_SNAME(),GETDATE(),null,null)

go

declare @lobWCU int
declare @cat_PC_1 int,@cat_PC_2 int, @cat_PC_3 int, @cat_PC_4 int


Select @lobWCU=  lobId from dbo.LOB where LOBName='PC-DW'

Select @cat_PC_1=  CategoryId from [dbo].[Category] where CategoryName='PL_GENERAL_DW'
Select @cat_PC_2=  CategoryId from [dbo].[Category] where CategoryName='PL_UNDERWRITING_DW'
Select @cat_PC_3=  CategoryId from [dbo].[Category] where CategoryName='PL_MAILER_SHEET_DW'


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
	(@lobWCU,@cat_PC_1,10,'Inspire_ACE_Prod,Inspire_CNSLT_PersLines,Inspire_Personal_Lines,Inspire_PL_HD_CSR,Inspire_PL_HD_SS,Inspire_CNSLT_PL_HUD_Admin,Inspire_PL_MailerSheet,Inspire_PL_HD_SUP_UW_RCT,Inspire_PL_HD_Audit',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobWCU,@cat_PC_2,20,'Inspire_ACE_Prod,Inspire_CNSLT_PersLines,Inspire_Personal_Lines,Inspire_PL_HD_CSR,Inspire_PL_HD_SS,Inspire_CNSLT_PL_HUD_Admin,Inspire_PL_MailerSheet,Inspire_PL_HD_SUP_UW_RCT,Inspire_PL_HD_Audit',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobWCU,@cat_PC_3,30,'Inspire_ACE_Prod,Inspire_CNSLT_PersLines,Inspire_Personal_Lines,Inspire_PL_HD_CSR,Inspire_PL_HD_SS,Inspire_CNSLT_PL_HUD_Admin,Inspire_PL_MailerSheet,Inspire_PL_HD_SUP_UW_RCT,Inspire_PL_HD_Audit',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null)

GO

INSERT [dbo].[Control]
(
       [ControlName]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime] )
	values 

	  ('PCDWCertificateHolderName',SUSER_SNAME(),GETDATE(),null,null),
	  ('PCDWAddrNmOneTwoThreeDrpdGreetNm',SUSER_SNAME(),GETDATE(),null,null)

GO



Insert into [dbo].[Document] (DocumentName,DocumentFriendlyName,IsDocumentActive, BaseState,JldFilePath,DocumentType,
CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values


('Wind and Hail Cov Verification-DW','Wind and Hail Cov Verification',1,NULL,'companyRoot:S:Production://Templates/PolicyCenterDwelling/Wind and Hail Cov Verification-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Paid Receipt-DW','Paid Receipt',1,NULL,'companyRoot:S:Production://Templates/PolicyCenterDwelling/Paid Receipt-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PL DW Mailer Sheet','PL Mailer Sheet',1,NULL,'companyRoot:S:Production://Templates/PolicyCenterDwelling/PL DW Mailer Sheet.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Business or Farm Use-DW','Business or Farm Use',1,NULL,'companyRoot:S:Production://Templates/PolicyCenterDwelling/Business or Farm Use-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Cancel Nonrenew-DW','Cancel Nonrenew',1,'NJ','companyRoot:S:Production://Templates/PolicyCenterDwelling/Cancel Nonrenew-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Cancel Nonrenew Mortgagee-DW','Cancel Nonrenew Mortgagee',1,NULL,'companyRoot:S:Production://Templates/PolicyCenterDwelling/Cancel Nonrenew Mortgagee-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Cancel Nonrenew Withdrawal-DW','Cancel Nonrenew Withdrawal',1,NULL,'companyRoot:S:Production://Templates/PolicyCenterDwelling/Cancel Nonrenew Withdrawal-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Certificate of Insurance-DW','Certificate of Insurance',1,NULL,'companyRoot:S:Production://Templates/PolicyCenterDwelling/Certificate of Insurance-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Claim Denial Letter-DW','Claim Denial Letter',1,NULL,'companyRoot:S:Production://Templates/PolicyCenterDwelling/Claim Denial Letter-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Claim Review Repairs Required-DW','Claim Review-Repairs Required',1,NULL,'companyRoot:S:Production://Templates/PolicyCenterDwelling/Claim Review Repairs Required-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Executor-Executrix-POA-DW','Executor-Executrix-POA',1,NULL,'companyRoot:S:Production://Templates/PolicyCenterDwelling/Executor-Executrix-POA-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Follow up Needed-DW','Follow up Needed',1,NULL,'companyRoot:S:Production://Templates/PolicyCenterDwelling/Follow up Needed-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Guaranteed Replacement Cov-DW','Guaranteed Replacement Cov',1,NULL,'companyRoot:S:Production://Templates/PolicyCenterDwelling/Guaranteed Replacement Cov-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Intent to Renew-DW','Intent to Renew',1,NULL,'companyRoot:S:Production://Templates/PolicyCenterDwelling/Intent to Renew-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('NJ Decline Ltr-DW','NJ Decline Ltr',1,'NJ','companyRoot:S:Production://Templates/PolicyCenterDwelling/NJ Decline Ltr-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PENN Death Generic Letter-DW','PENN Death Generic Letter-DW',1,'PA','companyRoot:S:Production://Templates/PolicyCenterDwelling/PENN Death Generic Letter-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PENN Refusal to Write Notice-DW','PENN Refusal to Write Notice-DW',1,'PA','companyRoot:S:Production://Templates/PolicyCenterDwelling/PENN Refusal to Write Notice-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PENN Termination Notice-DW','PENN Termination Notice-DW',1,'PA','companyRoot:S:Production://Templates/PolicyCenterDwelling/PENN Termination Notice-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PL DW Blank Letter Template','PL Blank Letter Template',1,NULL,'companyRoot:S:Production://Templates/PolicyCenterDwelling/PL DW Blank Letter Template.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('RCT Results Cover Letter-DW','RCT Results Cover Letter',1,NULL,'companyRoot:S:Production://Templates/PolicyCenterDwelling/RCT Results Cover Letter-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Replacement Cost Analysis-DW','Replacement Cost Analysis-DW',1,NULL,'companyRoot:S:Production://Templates/PolicyCenterDwelling/Replacement Cost Analysis-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Request Deed-DW','Request Deed',1,NULL,'companyRoot:S:Production://Templates/PolicyCenterDwelling/Request Deed-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Underwriting Reinstate-DW','Underwriting Reinstate',1,NULL,'companyRoot:S:Production://Templates/PolicyCenterDwelling/Underwriting Reinstate-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Unsecured Pool-DW','Unsecured Pool',1,NULL,'companyRoot:S:Production://Templates/PolicyCenterDwelling/Unsecured Pool-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('CT Cancel Nonrenew-DW','CT Cancel Nonrenew',1,'CT','companyRoot:S:Production://Templates/PolicyCenterDwelling/CT Cancel Nonrenew-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('CT Decline Ltr-DW','CT Decline Ltr',1,'CT','companyRoot:S:Production://Templates/PolicyCenterDwelling/CT Decline Ltr-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('OH Cancel Nonrenew-DW','OH Cancel Nonrenew',1,'OH','companyRoot:S:Production://Templates/PolicyCenterDwelling/OH Cancel Nonrenew-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Discovery of Material Risk Factor During UW Period-DW','Discovery of Material Risk Factor During UW Period',1,'MD','companyRoot:S:Production://Templates/PolicyCenterDwelling/Discovery of Material Risk Factor During UW Period-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('MD Cancel Nonrenew-DW','MD Cancel Nonrenew',1,'MD','companyRoot:S:Production://Templates/PolicyCenterDwelling/MD Cancel Nonrenew-DW.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null)


go



declare @lobWCU int
declare @cat_PC_1 int,@cat_PC_2 int, @cat_PC_3 int



Select @lobWCU=  lobId from dbo.LOB where LOBName='PC-DW'


Select @cat_PC_1=  CategoryId from [dbo].[Category] where CategoryName='PL_GENERAL_DW'
Select @cat_PC_3=  CategoryId from [dbo].[Category] where CategoryName='PL_UNDERWRITING_DW'
Select @cat_PC_2=  CategoryId from [dbo].[Category] where CategoryName='PL_MAILER_SHEET_DW'


declare  @doc1 int, @doc2 int, @doc3 int, @doc4 int, @doc5 int,  @doc7 int, @doc8 int, @doc9 int, 
@doc10 int, @doc11 int, @doc12 int, @doc13 int, @doc14 int, @doc15 int, @doc16 int, @doc17 int, @doc18 int, @doc19 int, 
@doc20 int, @doc21 int, @doc22 int, @doc23 int, @doc24 int, @doc25 int, @doc26 int, @doc27 int, @doc28 int,@doc29 int ,@doc30 int

Select @doc1=  DocumentId from [dbo].[Document] where DocumentName='Wind and Hail Cov Verification-DW'
Select @doc2=  DocumentId from [dbo].[Document] where DocumentName='Paid Receipt-DW'
Select @doc3=  DocumentId from [dbo].[Document] where DocumentName='PL DW Mailer Sheet'
Select @doc4=  DocumentId from [dbo].[Document] where DocumentName='Business or Farm Use-DW'
Select @doc5=  DocumentId from [dbo].[Document] where DocumentName='Cancel Nonrenew-DW'
Select @doc7=  DocumentId from [dbo].[Document] where DocumentName='Cancel Nonrenew Mortgagee-DW'
Select @doc8=  DocumentId from [dbo].[Document] where DocumentName='Cancel Nonrenew Withdrawal-DW'

Select @doc9=  DocumentId from [dbo].[Document] where DocumentName='Certificate of Insurance-DW'
Select @doc10=  DocumentId from [dbo].[Document] where DocumentName='Claim Denial Letter-DW'
Select @doc11=  DocumentId from [dbo].[Document] where DocumentName='Claim Review Repairs Required-DW'
Select @doc12=  DocumentId from [dbo].[Document] where DocumentName='Executor-Executrix-POA-DW'
Select @doc13=  DocumentId from [dbo].[Document] where DocumentName='Follow up Needed-DW'
Select @doc14=  DocumentId from [dbo].[Document] where DocumentName='Guaranteed Replacement Cov-DW'
Select @doc15=  DocumentId from [dbo].[Document] where DocumentName='Intent to Renew-DW'
Select @doc16=  DocumentId from [dbo].[Document] where DocumentName='NJ Decline Ltr-DW'
Select @doc17=  DocumentId from [dbo].[Document] where DocumentName='PENN Death Generic Letter-DW'
Select @doc18=  DocumentId from [dbo].[Document] where DocumentName='PENN Refusal to Write Notice-DW'
Select @doc19=  DocumentId from [dbo].[Document] where DocumentName='PENN Termination Notice-DW'
Select @doc20=  DocumentId from [dbo].[Document] where DocumentName='PL DW Blank Letter Template'
Select @doc21=  DocumentId from [dbo].[Document] where DocumentName='RCT Results Cover Letter-DW'
Select @doc22=  DocumentId from [dbo].[Document] where DocumentName='Replacement Cost Analysis-DW'
Select @doc23=  DocumentId from [dbo].[Document] where DocumentName='Request Deed-DW'
Select @doc24=  DocumentId from [dbo].[Document] where DocumentName='Underwriting Reinstate-DW'
Select @doc25=  DocumentId from [dbo].[Document] where DocumentName='Unsecured Pool-DW'
Select @doc26=  DocumentId from [dbo].[Document] where DocumentName='CT Cancel Nonrenew-DW'
Select @doc27=  DocumentId from [dbo].[Document] where DocumentName='CT Decline Ltr-DW'
Select @doc28=  DocumentId from [dbo].[Document] where DocumentName='OH Cancel Nonrenew-DW'
Select @doc29=  DocumentId from [dbo].[Document] where DocumentName='Discovery of Material Risk Factor During UW Period-DW'
Select @doc30=  DocumentId from [dbo].[Document] where DocumentName='MD Cancel Nonrenew-DW'

INSERT [dbo].[CategoryDocument] (DocumentId,CategoryId,DocumentOrder, EffectiveDate, ExpirationDate,CreatedBy, CreatedDateTime, UpdatedBy, UpdatedDateTime)
VALUES
(@doc1,@cat_PC_1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@cat_PC_1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

(@doc3,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

--underwriting
(@doc4,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc8,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc12,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc17,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc18,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc25,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc26,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc29,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc30,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)

GO



declare  @doc1 int, @doc2 int, @doc3 int, @doc4 int, @doc5 int, @doc6 int, @doc7 int, @doc8 int, @doc9 int, 
@doc10 int, @doc11 int, @doc12 int, @doc13 int, @doc14 int, @doc15 int, @doc16 int, @doc17 int, @doc18 int, @doc19 int, 
@doc20 int, @doc21 int, @doc22 int, @doc23 int, @doc24 int, @doc25 int, @doc26 int, @doc27 int, @doc28 int,@doc29 int

Select @doc1=  DocumentId from [dbo].[Document] where DocumentName='Wind and Hail Cov Verification-DW'
Select @doc2=  DocumentId from [dbo].[Document] where DocumentName='Paid Receipt-DW'
Select @doc3=  DocumentId from [dbo].[Document] where DocumentName='PL DW Mailer Sheet'
Select @doc4=  DocumentId from [dbo].[Document] where DocumentName='Business or Farm Use-DW'
Select @doc5=  DocumentId from [dbo].[Document] where DocumentName='Cancel Nonrenew-DW'
Select @doc6=  DocumentId from [dbo].[Document] where DocumentName='Cancel Nonrenew Mortgagee-DW'
Select @doc7=  DocumentId from [dbo].[Document] where DocumentName='Cancel Nonrenew Withdrawal-DW'
Select @doc8=  DocumentId from [dbo].[Document] where DocumentName='Certificate of Insurance-DW'
Select @doc9=  DocumentId from [dbo].[Document] where DocumentName='Claim Denial Letter-DW'
Select @doc10=  DocumentId from [dbo].[Document] where DocumentName='Claim Review Repairs Required-DW'
Select @doc11=  DocumentId from [dbo].[Document] where DocumentName='Executor-Executrix-POA-DW'
Select @doc12=  DocumentId from [dbo].[Document] where DocumentName='Follow up Needed-DW'
Select @doc13=  DocumentId from [dbo].[Document] where DocumentName='Guaranteed Replacement Cov-DW'
Select @doc14=  DocumentId from [dbo].[Document] where DocumentName='Intent to Renew-DW'
Select @doc15=  DocumentId from [dbo].[Document] where DocumentName='NJ Decline Ltr-DW'
Select @doc16=  DocumentId from [dbo].[Document] where DocumentName='PENN Death Generic Letter-DW'
Select @doc17=  DocumentId from [dbo].[Document] where DocumentName='PENN Refusal to Write Notice-DW'
Select @doc18=  DocumentId from [dbo].[Document] where DocumentName='PENN Termination Notice-DW'
Select @doc19=  DocumentId from [dbo].[Document] where DocumentName='PL DW Blank Letter Template'
Select @doc20=  DocumentId from [dbo].[Document] where DocumentName='RCT Results Cover Letter-DW'
Select @doc21=  DocumentId from [dbo].[Document] where DocumentName='Replacement Cost Analysis-DW'
Select @doc22=  DocumentId from [dbo].[Document] where DocumentName='Request Deed-DW'
Select @doc23=  DocumentId from [dbo].[Document] where DocumentName='Underwriting Reinstate-DW'
Select @doc24=  DocumentId from [dbo].[Document] where DocumentName='Unsecured Pool-DW'
Select @doc25=  DocumentId from [dbo].[Document] where DocumentName='CT Cancel Nonrenew-DW'
Select @doc26=  DocumentId from [dbo].[Document] where DocumentName='CT Decline Ltr-DW'
Select @doc27=  DocumentId from [dbo].[Document] where DocumentName='OH Cancel Nonrenew-DW'
Select @doc28=  DocumentId from [dbo].[Document] where DocumentName='Discovery of Material Risk Factor During UW Period-DW'
Select @doc29=  DocumentId from [dbo].[Document] where DocumentName='MD Cancel Nonrenew-DW'


--Controls

declare  @ctrlEmail int, @ctrlFax int, @ctrlAddress int, @ctrlPrinter int, @ctrlSelectCommn int
declare  @ctrlAddtCheckbox int, @ctrlAdd123 int, @ctrlcertifi int, @ctrl123greet int
declare  @ctrlMPrinterCheck int, @ctrlMail int,@ctrlLetter int, @ctrlDrpGreet int


Select @ctrlSelectCommn=  ControlId from [dbo].[Control] where ControlName='SelectCommunicationSection'
Select @ctrlAddtCheckbox=  ControlId from [dbo].[Control] where ControlName='PCUMBAddtlPolNumCheckboxwCheckboxLst'
Select @ctrlAdd123=  ControlId from [dbo].[Control] where ControlName='PLAddresseeNameOneTwoAndThree'
Select @ctrlcertifi=  ControlId from [dbo].[Control] where ControlName='PCDWCertificateHolderName'
Select @ctrl123greet=  ControlId from [dbo].[Control] where ControlName='PLAddrNmOneTwoThreewGreetNm'
Select @ctrlEmail=  ControlId from [dbo].[Control] where ControlName='EmailwCheckbox'
Select @ctrlFax=  ControlId from [dbo].[Control] where ControlName='FaxwCheckbox'
Select @ctrlAddress=  ControlId from [dbo].[Control] where ControlName='PLAddresseeNameOneTwoAndThree'
Select @ctrlMPrinterCheck=  ControlId from [dbo].[Control] where ControlName='PrinterDropdownwCheckbox'
Select @ctrlMail=  ControlId from [dbo].[Control] where ControlName='UsMailCheckbox'
Select @ctrlPrinter=  ControlId from [dbo].[Control] where ControlName='PrinterDropdown'
Select @ctrlLetter=  ControlId from [dbo].[Control] where ControlName=    'LetterDatePicker'
Select @ctrlDrpGreet=  ControlId from [dbo].[Control] where ControlName=    'PCDWAddrNmOneTwoThreeDrpdGreetNm'



 INSERT [dbo].[DocumentControl] (
       [DocumentId]
      ,[ControlId]
      ,[ControlOrder]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES


(@doc1,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc2,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc3,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc3,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),

(@doc4,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc4,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc4,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc4,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc4,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc4,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc5,@ctrlDrpGreet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@ctrlLetter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@ctrlMPrinterCheck,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc6,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@ctrlLetter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@ctrlMPrinterCheck,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc7,@ctrlDrpGreet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc8,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc8,@ctrlcertifi,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc8,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc8,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc8,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc8,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc8,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc9,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc10,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc11,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc12,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc12,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),

(@doc13,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc14,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc15,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc16,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc17,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc17,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc17,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc17,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),

(@doc18,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc18,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null),

(@doc19,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc20,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc21,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc22,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc23,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc24,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc25,@ctrlDrpGreet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc25,@ctrlLetter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc25,@ctrlMPrinterCheck,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc26,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc26,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc26,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc26,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc26,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc26,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc27,@ctrlDrpGreet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@ctrlLetter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@ctrlMPrinterCheck,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc28,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc29,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc29,@ctrlLetter,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc29,@ctrlMPrinterCheck,300,SUSER_SNAME(),GETDATE(),null,null)

GO


declare @lobIdPa int,@lobWCU int, @lob int

Select @lobWCU=  lobId from dbo.LOB where LOBName='PC-DW'


 INSERT [dbo].[Configuration] (
	   [LOBId]
	  ,[ConfigKey]
	  ,[ConfigValue]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES

(@lobWCU,'PRINT_IND_NO','N',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'PRINT_IND_BATCH','BATCH',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'PRINT_IND_BOTH','BOTH',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'POL_FK','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'EMAIL_FROM','DoNotReply@njm.com',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'EMAIL_BODY','dwelling',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'EMAIL_SUBJECT','Requested NJM Dwelling Information',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'CERT_IND','N',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'POL_PK','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'SRC_SYS','ADHOC',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'BARCODE_IND','N',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'ARCHIVE_IND','Y',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'PRINT_IND','DEPT',SUSER_SNAME(),GETDATE(),null,null)

GO
