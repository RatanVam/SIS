USE [ACE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Insert into [dbo].[Category] (CategoryName,CategoryFriendlyName,IsCategoryActive,
CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 

('PL_GENERAL_UMB',		'UMB General',		1,SUSER_SNAME(),GETDATE(),null,null),
('PL_UNDERWRITING_UMB',	'UMB Underwriter',	1,SUSER_SNAME(),GETDATE(),null,null),
('PL_POLICY_AUDIT_UMB',	'UMB Policy Audit',	1,SUSER_SNAME(),GETDATE(),null,null),
('PL_MAILER_SHEET_UMB',	'PL Multiline',		1,SUSER_SNAME(),GETDATE(),null,null)

go

declare @lobWCU int
declare @cat_PC_1 int,@cat_PC_2 int, @cat_PC_3 int, @cat_PC_4 int


Select @lobWCU=  lobId from dbo.LOB where LOBName='PC-UMB'

Select @cat_PC_1=  CategoryId from [dbo].[Category] where CategoryName='PL_GENERAL_UMB'
Select @cat_PC_2=  CategoryId from [dbo].[Category] where CategoryName='PL_UNDERWRITING_UMB'
Select @cat_PC_3=  CategoryId from [dbo].[Category] where CategoryName='PL_POLICY_AUDIT_UMB'
Select @cat_PC_4=  CategoryId from [dbo].[Category] where CategoryName='PL_MAILER_SHEET_UMB'


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
	(@lobWCU,@cat_PC_1,10,'Inspire_ACE_Prod,Inspire_CNSLT_PersLines,Inspire_Personal_Lines,Inspire_PL_UM_SS,Inspire_UMB_Submission,Inspire_PL_MailerSheet,Inspire_PL_HUD_Admin',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobWCU,@cat_PC_2,20,'Inspire_ACE_Prod,Inspire_CNSLT_PersLines,Inspire_Personal_Lines,Inspire_PL_UM_SS,Inspire_UMB_Submission,Inspire_PL_MailerSheet,Inspire_PL_HUD_Admin',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobWCU,@cat_PC_3,30,'Inspire_ACE_Prod,Inspire_CNSLT_PersLines,Inspire_Personal_Lines,Inspire_PL_UM_SS,Inspire_UMB_Submission,Inspire_PL_MailerSheet,Inspire_PL_HUD_Admin',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobWCU,@cat_PC_4,40,'Inspire_ACE_Prod,Inspire_CNSLT_PersLines,Inspire_Personal_Lines,Inspire_PL_UM_SS,Inspire_UMB_Submission,Inspire_PL_MailerSheet,Inspire_PL_HUD_Admin',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null)

GO

INSERT [dbo].[Control]
(
       [ControlName]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime] )
	values 
	
	  ('SelectCommunicationSection',SUSER_SNAME(),GETDATE(),null,null) ,

	  --Category:  UMB Underwriter 
	  ('LetterDatePicker',SUSER_SNAME(),GETDATE(),null,null),
	  ('PLClaimViolationSection',SUSER_SNAME(),GETDATE(),null,null),
	  ('PLDriverSection',SUSER_SNAME(),GETDATE(),null,null),
	  ('PCUMBCancelWithdrawalSection',SUSER_SNAME(),GETDATE(),null,null),
	  ('PCUMBClaimsAutoCheckboxSection',SUSER_SNAME(),GETDATE(),null,null),
	  ('PCUMBClaimsHomeCheckboxSection',SUSER_SNAME(),GETDATE(),null,null),
	  ('PCUMBDrivingRecCheckboxSection' ,SUSER_SNAME(),GETDATE(),null,null),
	  ('PCUMBDrvRecCheckboxandClaimViolationSection',SUSER_SNAME(),GETDATE(),null,null),
	  ('PCUMBInspectionCheckboxSection',SUSER_SNAME(),GETDATE(),null,null),
	
	  ('PCUMBMidtermCancelReasonSection',SUSER_SNAME(),GETDATE(),null,null),
	 -- ('PCUMBNonrenewalReasonSection' ,SUSER_SNAME(),GETDATE(),null,null),
	--  ('PCUMBNonrenewalWithdrawalSection',SUSER_SNAME(),GETDATE(),null,null),
	  ('PCUMBOhMidtermCancellationSection',SUSER_SNAME(),GETDATE(),null,null),
	--  ('PCUMBPennTermReasonsSection',SUSER_SNAME(),GETDATE(),null,null),
	  ('PCUMBRiskLocCheckbox',SUSER_SNAME(),GETDATE(),null,null),
	  --ends here


	 ('EmailwCheckbox',SUSER_SNAME(),GETDATE(),null,null),
	 ('FaxwCheckbox',SUSER_SNAME(),GETDATE(),null,null),
	 ('PLAddresseeNameOneTwoAndThree',SUSER_SNAME(),GETDATE(),null,null),
	 ('PLAddrNmOneTwoThreewGreetNm',SUSER_SNAME(),GETDATE(),null,null),
	 ('PCUMBAddtlPolNumCheckboxwCheckboxLst',SUSER_SNAME(),GETDATE(),null,null),
	 ('PrinterDropdownwCheckbox',SUSER_SNAME(),GETDATE(),null,null),
	 ('UsMailCheckbox',SUSER_SNAME(),GETDATE(),null,null),

	 --General
	  ('PCUMBCompleteAddressSection',SUSER_SNAME(),GETDATE(),null,null),
	  ('PCUMBVacantLndCompleteInfoSection',SUSER_SNAME(),GETDATE(),null,null),
	  ('PCUMBNameOnDeedSection',SUSER_SNAME(),GETDATE(),null,null),
	  ('PCUMBPropertyInfoSection',SUSER_SNAME(),GETDATE(),null,null),
	  ('PCUMBWatercraftSection',SUSER_SNAME(),GETDATE(),null,null),
	  ('PCUMBVehiclesSection',SUSER_SNAME(),GETDATE(),null,null),
	  ('PCUMBBusinessUsePropertySection' ,SUSER_SNAME(),GETDATE(),null,null),
	  ('PCUMBDriverInfoSection',SUSER_SNAME(),GETDATE(),null,null),
	  ('PCUMBAccidentInfoSection',SUSER_SNAME(),GETDATE(),null,null) 

GO



Insert into [dbo].[Document] (DocumentName,DocumentFriendlyName,IsDocumentActive, BaseState,JldFilePath,DocumentType,
CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values

('Additional Info Submission-UMB','Additional Info Submission','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterUmbrella/Additional Info Submission-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Additional Info Existing Policy-UMB','Additional Info Existing Policy','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterUmbrella/Additional Info Existing Policy-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Drive Other Car Coverage-UMB','Drive Other Car Coverage','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterUmbrella/Drive Other Car Coverage-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PL UMB Mailer Sheet','PL Mailer Sheet','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterUmbrella/PL UMB Mailer Sheet.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Additional Info-Policy Audit-UMB','Additional Info-Policy Audit','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterUmbrella/Additional Info-Policy Audit-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Audit Letter-UMB','Audit Letter','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterUmbrella/Audit Letter-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Third Party Application-UMB','Third Party Application','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterUmbrella/Third Party Application-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Third Party Designee Add-Delete-UMB','Third Party Designee Add-Delete','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterUmbrella/Third Party Designee Add-Delete-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Audit Correction Letter-UMB','Audit Correction Letter','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterUmbrella/Audit Correction Letter-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Certificate of Insurance-UMB','Certificate of Insurance','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterUmbrella/Certificate of Insurance-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Inspection Letter-Policy-UMB','Inspection Letter-Policy','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterUmbrella/Inspection Letter-Policy-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Midterm Cancellation-UMB','Midterm Cancellation','1','NJ','companyRoot:S:Production://Templates/PolicyCenterUmbrella/Midterm Cancellation-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Midterm Cancel Withdrawal-UMB','Midterm Cancel Withdrawal','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterUmbrella/Midterm Cancel Withdrawal-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('NJ Decline Ltr-UMB','NJ Decline Ltr','1','NJ','companyRoot:S:Production://Templates/PolicyCenterUmbrella/NJ Decline Ltr-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Notice of Nonrenewal-UMB','Notice of Nonrenewal','1','NJ','companyRoot:S:Production://Templates/PolicyCenterUmbrella/Notice of Nonrenewal-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PENN Refusal to Write Notice-UMB','PENN Refusal to Write Notice-UMB','1','PA','companyRoot:S:Production://Templates/PolicyCenterUmbrella/PENN Refusal to Write Notice-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PL UMB Blank Letter Template','PL Blank Letter Template','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterUmbrella/PL UMB Blank Letter Template.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PENN Termination Notice-UMB','PENN Termination Notice-UMB','1','PA','companyRoot:S:Production://Templates/PolicyCenterUmbrella/PENN Termination Notice-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Underwriting Reinstate-UMB','Underwriting Reinstate','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterUmbrella/Underwriting Reinstate-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Notice of Nonrenewal Withdrawal-UMB','Notice of Nonrenewal Withdrawal','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterUmbrella/Notice of Nonrenewal Withdrawal-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('CT Decline Ltr-UMB','CT Decline Ltr','1','CT','companyRoot:S:Production://Templates/PolicyCenterUmbrella/CT Decline Ltr-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('CT Midterm Cancellation-UMB','CT Midterm Cancellation','1','CT','companyRoot:S:Production://Templates/PolicyCenterUmbrella/CT Midterm Cancellation-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('CT Notice of Nonrenewal-UMB','CT Notice of Nonrenewal','1','CT','companyRoot:S:Production://Templates/PolicyCenterUmbrella/CT Notice of Nonrenewal-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('OH Midterm Cancellation-UMB','OH Midterm Cancellation','1','OH','companyRoot:S:Production://Templates/PolicyCenterUmbrella/OH Midterm Cancellation-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('OH Notice of Nonrenewal-UMB','OH Notice of Nonrenewal','1','OH','companyRoot:S:Production://Templates/PolicyCenterUmbrella/OH Notice of Nonrenewal-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Discovery of Material Risk Factor During UW Period-UMB','Discovery of Material Risk Factor During UW Period','1','MD','companyRoot:S:Production://Templates/PolicyCenterUmbrella/Discovery of Material Risk Factor During UW Period-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('MD Cancel Nonrenewal-UMB','MD Cancel Nonrenewal','1','MD','companyRoot:S:Production://Templates/PolicyCenterUmbrella/MD Cancel Nonrenewal-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('MD Decline Ltr-UMB','MD Decline Ltr','1','MD','companyRoot:S:Production://Templates/PolicyCenterUmbrella/MD Decline Ltr-UMB.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null)


go



declare @lobWCU int
declare @cat_PC_1 int,@cat_PC_2 int, @cat_PC_3 int, @cat_PC_4 int



Select @lobWCU=  lobId from dbo.LOB where LOBName='PC-UMB'


Select @cat_PC_1=  CategoryId from [dbo].[Category] where CategoryName='PL_GENERAL_UMB'
Select @cat_PC_2=  CategoryId from [dbo].[Category] where CategoryName='PL_UNDERWRITING_UMB'
Select @cat_PC_3=  CategoryId from [dbo].[Category] where CategoryName='PL_POLICY_AUDIT_UMB'
Select @cat_PC_4=  CategoryId from [dbo].[Category] where CategoryName='PL_MAILER_SHEET_UMB'


declare  @doc1 int, @doc2 int, @doc3 int, @doc4 int, @doc5 int, @doc6 int, @doc7 int, @doc8 int, @doc9 int, 
@doc10 int, @doc11 int, @doc12 int, @doc13 int, @doc14 int, @doc15 int, @doc16 int, @doc17 int, @doc18 int, @doc19 int, 
@doc20 int, @doc21 int, @doc22 int, @doc23 int, @doc24 int, @doc25 int, @doc26 int, @doc27 int, @doc28 int


Select @doc1=  DocumentId from [dbo].[Document] where DocumentName='Additional Info Submission-UMB'
Select @doc2=  DocumentId from [dbo].[Document] where DocumentName='Additional Info Existing Policy-UMB'
Select @doc3=  DocumentId from [dbo].[Document] where DocumentName='Drive Other Car Coverage-UMB'
Select @doc4=  DocumentId from [dbo].[Document] where DocumentName='PL UMB Mailer Sheet'
Select @doc5=  DocumentId from [dbo].[Document] where DocumentName='Additional Info-Policy Audit-UMB'
Select @doc6=  DocumentId from [dbo].[Document] where DocumentName='Audit Letter-UMB'
Select @doc7=  DocumentId from [dbo].[Document] where DocumentName='Third Party Application-UMB'
Select @doc8=  DocumentId from [dbo].[Document] where DocumentName='Third Party Designee Add-Delete-UMB'

Select @doc9=  DocumentId from [dbo].[Document] where DocumentName='Audit Correction Letter-UMB'
Select @doc10=  DocumentId from [dbo].[Document] where DocumentName='Certificate of Insurance-UMB'
Select @doc11=  DocumentId from [dbo].[Document] where DocumentName='Inspection Letter-Policy-UMB'
Select @doc12=  DocumentId from [dbo].[Document] where DocumentName='Midterm Cancellation-UMB'
Select @doc13=  DocumentId from [dbo].[Document] where DocumentName='Midterm Cancel Withdrawal-UMB'
Select @doc14=  DocumentId from [dbo].[Document] where DocumentName='NJ Decline Ltr-UMB'
Select @doc15=  DocumentId from [dbo].[Document] where DocumentName='Notice of Nonrenewal-UMB'
Select @doc16=  DocumentId from [dbo].[Document] where DocumentName='PENN Refusal to Write Notice-UMB'
Select @doc17=  DocumentId from [dbo].[Document] where DocumentName='PL UMB Blank Letter Template'
Select @doc18=  DocumentId from [dbo].[Document] where DocumentName='PENN Termination Notice-UMB'
Select @doc19=  DocumentId from [dbo].[Document] where DocumentName='Underwriting Reinstate-UMB'
Select @doc20=  DocumentId from [dbo].[Document] where DocumentName='Notice of Nonrenewal Withdrawal-UMB'
Select @doc21=  DocumentId from [dbo].[Document] where DocumentName='CT Decline Ltr-UMB'
Select @doc22=  DocumentId from [dbo].[Document] where DocumentName='CT Midterm Cancellation-UMB'
Select @doc23=  DocumentId from [dbo].[Document] where DocumentName='CT Notice of Nonrenewal-UMB'
Select @doc24=  DocumentId from [dbo].[Document] where DocumentName='OH Midterm Cancellation-UMB'
Select @doc25=  DocumentId from [dbo].[Document] where DocumentName='OH Notice of Nonrenewal-UMB'
Select @doc26=  DocumentId from [dbo].[Document] where DocumentName='Discovery of Material Risk Factor During UW Period-UMB'
Select @doc27=  DocumentId from [dbo].[Document] where DocumentName='MD Cancel Nonrenewal-UMB'
Select @doc28=  DocumentId from [dbo].[Document] where DocumentName='MD Decline Ltr-UMB'



INSERT [dbo].[CategoryDocument] (DocumentId,CategoryId,DocumentOrder, EffectiveDate, ExpirationDate,CreatedBy, CreatedDateTime, UpdatedBy, UpdatedDateTime)
VALUES

--underwriting
(@doc9,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc12,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc17,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc18,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc25,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc26,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),


(@doc1,@cat_PC_1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@cat_PC_1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc3,@cat_PC_1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

(@doc4,@cat_PC_4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

(@doc5,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc8,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)



GO



declare  @doc1 int, @doc2 int, @doc3 int, @doc4 int, @doc5 int, @doc6 int, @doc7 int, @doc8 int, @doc9 int, 
@doc10 int, @doc11 int, @doc12 int, @doc13 int, @doc14 int, @doc15 int, @doc16 int, @doc17 int, @doc18 int, @doc19 int, 
@doc20 int, @doc21 int, @doc22 int, @doc23 int, @doc24 int, @doc25 int, @doc26 int, @doc27 int, @doc28 int

Select @doc5=  DocumentId from [dbo].[Document] where DocumentName='Additional Info-Policy Audit-UMB'
Select @doc6=  DocumentId from [dbo].[Document] where DocumentName='Audit Letter-UMB'
Select @doc7=  DocumentId from [dbo].[Document] where DocumentName='Third Party Application-UMB'
Select @doc8=  DocumentId from [dbo].[Document] where DocumentName='Third Party Designee Add-Delete-UMB'
Select @doc4=  DocumentId from [dbo].[Document] where DocumentName='PL UMB Mailer Sheet'


Select @doc1=  DocumentId from [dbo].[Document] where DocumentName='Additional Info Submission-UMB'
Select @doc2=  DocumentId from [dbo].[Document] where DocumentName='Additional Info Existing Policy-UMB'
Select @doc3=  DocumentId from [dbo].[Document] where DocumentName='Drive Other Car Coverage-UMB'
Select @doc9=  DocumentId from [dbo].[Document] where DocumentName='Audit Correction Letter-UMB'
Select @doc10=  DocumentId from [dbo].[Document] where DocumentName='Certificate of Insurance-UMB'
Select @doc11=  DocumentId from [dbo].[Document] where DocumentName='Inspection Letter-Policy-UMB'
Select @doc12=  DocumentId from [dbo].[Document] where DocumentName='Midterm Cancellation-UMB'
Select @doc13=  DocumentId from [dbo].[Document] where DocumentName='Midterm Cancel Withdrawal-UMB'
Select @doc14=  DocumentId from [dbo].[Document] where DocumentName='NJ Decline Ltr-UMB'
Select @doc15=  DocumentId from [dbo].[Document] where DocumentName='Notice of Nonrenewal-UMB'
Select @doc16=  DocumentId from [dbo].[Document] where DocumentName='PENN Refusal to Write Notice-UMB'
Select @doc17=  DocumentId from [dbo].[Document] where DocumentName='PL UMB Blank Letter Template'
Select @doc18=  DocumentId from [dbo].[Document] where DocumentName='PENN Termination Notice-UMB'
Select @doc19=  DocumentId from [dbo].[Document] where DocumentName='Underwriting Reinstate-UMB'
Select @doc20=  DocumentId from [dbo].[Document] where DocumentName='Notice of Nonrenewal Withdrawal-UMB'
Select @doc21=  DocumentId from [dbo].[Document] where DocumentName='CT Decline Ltr-UMB'
Select @doc22=  DocumentId from [dbo].[Document] where DocumentName='CT Midterm Cancellation-UMB'
Select @doc23=  DocumentId from [dbo].[Document] where DocumentName='CT Notice of Nonrenewal-UMB'
Select @doc24=  DocumentId from [dbo].[Document] where DocumentName='OH Midterm Cancellation-UMB'
Select @doc25=  DocumentId from [dbo].[Document] where DocumentName='OH Notice of Nonrenewal-UMB'
Select @doc26=  DocumentId from [dbo].[Document] where DocumentName='Discovery of Material Risk Factor During UW Period-UMB'
Select @doc27=  DocumentId from [dbo].[Document] where DocumentName='MD Cancel Nonrenewal-UMB'
Select @doc28=  DocumentId from [dbo].[Document] where DocumentName='MD Decline Ltr-UMB'


--Controls

declare  @ctrlEmail int, @ctrlFax int, @ctrlAddress int, @ctrlPrinter int, @ctrlSelectCommn int
declare  @ctrlAddressNm int, @ctrlPCUCheck int, @ctrlMPrinterCheck int, @ctrlMail int

declare  @ctrlComplete int, @ctrlLand int, @ctrldeed int, @ctrlPropery int
declare  @ctrlWater int, @ctrlVehicle int, @ctrlBusiness int, @ctrlDriver int, @ctrlaccident int

declare  @ctrl14 int,@ctrl15 int,@ctrl16 int,@ctrl17 int,@ctrl18 int,@ctrl19 int,@ctrl20 int,@ctrl21 int
declare  @ctrl22 int,@ctrl23 int,@ctrl24 int,@ctrl25 int,@ctrl26 int,@ctrl27 int,@ctrl28 int


Select @ctrlSelectCommn=  ControlId from [dbo].[Control] where ControlName='SelectCommunicationSection'

Select @ctrlEmail=  ControlId from [dbo].[Control] where ControlName='EmailwCheckbox'
Select @ctrlFax=  ControlId from [dbo].[Control] where ControlName='FaxwCheckbox'
Select @ctrlAddress=  ControlId from [dbo].[Control] where ControlName='PLAddresseeNameOneTwoAndThree'
Select @ctrlAddressNm=  ControlId from [dbo].[Control] where ControlName='PLAddrNmOneTwoThreewGreetNm'
Select @ctrlPCUCheck=  ControlId from [dbo].[Control] where ControlName='PCUMBAddtlPolNumCheckboxwCheckboxLst'
Select @ctrlMPrinterCheck=  ControlId from [dbo].[Control] where ControlName='PrinterDropdownwCheckbox'
Select @ctrlMail=  ControlId from [dbo].[Control] where ControlName='UsMailCheckbox'
Select @ctrlPrinter=  ControlId from [dbo].[Control] where ControlName='PrinterDropdown'

--general
Select @ctrlComplete=  ControlId from [dbo].[Control] where ControlName=  'PCUMBCompleteAddressSection'
Select @ctrlLand=  ControlId from [dbo].[Control] where ControlName=	  'PCUMBVacantLndCompleteInfoSection'
Select @ctrldeed=  ControlId from [dbo].[Control] where ControlName=	  'PCUMBNameOnDeedSection'
Select @ctrlPropery=  ControlId from [dbo].[Control] where ControlName=	  'PCUMBPropertyInfoSection'
Select @ctrlWater=  ControlId from [dbo].[Control] where ControlName=	  'PCUMBWatercraftSection'
Select @ctrlVehicle=  ControlId from [dbo].[Control] where ControlName=	  'PCUMBVehiclesSection'
Select @ctrlBusiness=  ControlId from [dbo].[Control] where ControlName=  'PCUMBBusinessUsePropertySection'
Select @ctrlDriver=  ControlId from [dbo].[Control] where ControlName=	  'PCUMBDriverInfoSection'
Select @ctrlaccident=  ControlId from [dbo].[Control] where ControlName=  'PCUMBAccidentInfoSection'

--Underwtiter
Select @ctrl14=  ControlId from [dbo].[Control] where ControlName=    'LetterDatePicker'
Select @ctrl15=  ControlId from [dbo].[Control] where ControlName=	  'PLClaimViolationSection'
Select @ctrl16=  ControlId from [dbo].[Control] where ControlName=	  'PLDriverSection'
Select @ctrl17=  ControlId from [dbo].[Control] where ControlName=	  'PCUMBCancelWithdrawalSection'

Select @ctrl18=  ControlId from [dbo].[Control] where ControlName=	  'PCUMBClaimsAutoCheckboxSection'
Select @ctrl19=  ControlId from [dbo].[Control] where ControlName=	  'PCUMBClaimsHomeCheckboxSection'
Select @ctrl20=  ControlId from [dbo].[Control] where ControlName=    'PCUMBDrivingRecCheckboxSection'
Select @ctrl21=  ControlId from [dbo].[Control] where ControlName=	  'PCUMBDrvRecCheckboxandClaimViolationSection'
Select @ctrl22=  ControlId from [dbo].[Control] where ControlName=    'PCUMBInspectionCheckboxSection'
Select @ctrl23=  ControlId from [dbo].[Control] where ControlName=    'PCUMBMidtermCancelReasonSection'

Select @ctrl24=  ControlId from [dbo].[Control] where ControlName=	  'PCUMBMidtermCancelReasonSection'
Select @ctrl25=  ControlId from [dbo].[Control] where ControlName=	  'PCUMBMidtermCancelReasonSection'
Select @ctrl26=  ControlId from [dbo].[Control] where ControlName=	  'PCUMBOhMidtermCancellationSection'
Select @ctrl27=  ControlId from [dbo].[Control] where ControlName=	  'PCUMBMidtermCancelReasonSection'
Select @ctrl28=  ControlId from [dbo].[Control] where ControlName=	  'PCUMBRiskLocCheckbox'


 INSERT [dbo].[DocumentControl] (
       [DocumentId]
      ,[ControlId]
      ,[ControlOrder]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES

--underwriting
(@doc28,@ctrlAddressNm,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrl15,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrlSelectCommn,210,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),


(@doc27,@ctrlAddress,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@ctrl15,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@ctrl16,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@ctrl14,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@ctrlPrinter,500,SUSER_SNAME(),GETDATE(),null,null),

(@doc26,@ctrlAddressNm,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc26,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc26,@ctrlMPrinterCheck,210,SUSER_SNAME(),GETDATE(),null,null),
(@doc26,@ctrlEmail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc26,@ctrlFax,400,SUSER_SNAME(),GETDATE(),null,null),

(@doc25,@ctrlAddress,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc25,@ctrl26,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc25,@ctrl15,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc25,@ctrl14,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc25,@ctrlPrinter,500,SUSER_SNAME(),GETDATE(),null,null),


(@doc24,@ctrlAddress,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@ctrl26,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@ctrl15,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@ctrl14,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@ctrlPrinter,500,SUSER_SNAME(),GETDATE(),null,null),

(@doc23,@ctrlAddress,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@ctrl14,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@ctrlPrinter,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc22,@ctrlAddress,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@ctrl15,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@ctrl14,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@ctrlPrinter,400,SUSER_SNAME(),GETDATE(),null,null),

(@doc21,@ctrlAddressNm,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@ctrl15,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@ctrlSelectCommn,210,SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc20,@ctrlAddress,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrl25,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlSelectCommn,210,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),


(@doc19,@ctrlAddressNm,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlMail,210,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlMPrinterCheck,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlEmail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlFax,500,SUSER_SNAME(),GETDATE(),null,null),

(@doc18,@ctrlAddress,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc18,@ctrl27,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc18,@ctrlPrinter,300,SUSER_SNAME(),GETDATE(),null,null),

(@doc17,@ctrlAddressNm,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc17,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc17,@ctrlMail,210,SUSER_SNAME(),GETDATE(),null,null),
(@doc17,@ctrlMPrinterCheck,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc17,@ctrlEmail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc17,@ctrlFax,500,SUSER_SNAME(),GETDATE(),null,null),

(@doc16,@ctrlAddress,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@ctrl20,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@ctrl22,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@ctrl18,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@ctrl19,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@ctrlSelectCommn,510,SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@ctrlMail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@ctrlMPrinterCheck,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc15,@ctrlAddressNm,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@ctrl24,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@ctrl14,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@ctrl21,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@ctrlPrinter,500,SUSER_SNAME(),GETDATE(),null,null),

(@doc14,@ctrlAddressNm,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrl21,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrl22,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrl19,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlSelectCommn,410,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlMail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlMPrinterCheck,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlEmail,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlFax,800,SUSER_SNAME(),GETDATE(),null,null),

(@doc13,@ctrlAddress,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@ctrl17,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@ctrlSelectCommn,210,SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),


(@doc12,@ctrlAddressNm,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc12,@ctrl14,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc12,@ctrl23,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc12,@ctrl21,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc12,@ctrlPrinter,500,SUSER_SNAME(),GETDATE(),null,null),

(@doc11,@ctrlAddressNm,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@ctrl28,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@ctrlSelectCommn,210,SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc10,@ctrlAddress,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@ctrlMail,210,SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@ctrlMPrinterCheck,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@ctrlEmail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@ctrlFax,500,SUSER_SNAME(),GETDATE(),null,null),

(@doc9,@ctrlAddressNm,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@ctrlMail,210,SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@ctrlMPrinterCheck,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@ctrlEmail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@ctrlFax,500,SUSER_SNAME(),GETDATE(),null,null),

--General
(@doc1,@ctrlAddress,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlComplete,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlLand,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrldeed,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlPropery,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlWater,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlVehicle,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlDriver,800,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlaccident,900,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlBusiness,1000,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlSelectCommn,1100,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlMail,1200,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlMPrinterCheck,1300,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlEmail,1400,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlFax,1500,SUSER_SNAME(),GETDATE(),null,null),


(@doc2,@ctrlAddress,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlComplete,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlLand,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrldeed,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlPropery,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlWater,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlVehicle,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlDriver,800,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlaccident,900,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlBusiness,1000,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlSelectCommn,1100,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlMail,1200,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlMPrinterCheck,1300,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlEmail,1400,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlFax,1500,SUSER_SNAME(),GETDATE(),null,null),

(@doc3,@ctrlAddressNm,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc3,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc3,@ctrlMail,210,SUSER_SNAME(),GETDATE(),null,null),
(@doc3,@ctrlMPrinterCheck,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc3,@ctrlEmail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc3,@ctrlFax,500,SUSER_SNAME(),GETDATE(),null,null) ,



--ends here

(@doc5,@ctrlAddress,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@ctrlMail,210,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@ctrlMPrinterCheck,300,SUSER_SNAME(),GETDATE(),null,null),


(@doc6,@ctrlAddress,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@ctrlMail,210,SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@ctrlMPrinterCheck,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@ctrlEmail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@ctrlFax,500,SUSER_SNAME(),GETDATE(),null,null),

(@doc7,@ctrlAddressNm,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlPCUCheck,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlSelectCommn,210,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc8,@ctrlAddressNm,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc8,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc8,@ctrlMail,210,SUSER_SNAME(),GETDATE(),null,null),
(@doc8,@ctrlMPrinterCheck,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc8,@ctrlEmail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc8,@ctrlFax,500,SUSER_SNAME(),GETDATE(),null,null),

(@doc4,@ctrlAddress,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc4,@ctrlPrinter,200,SUSER_SNAME(),GETDATE(),null,null)




GO


declare @lobIdPa int,@lobWCU int, @lob int

Select @lobWCU=  lobId from dbo.LOB where LOBName='PC-UMB'


 INSERT [dbo].[Configuration] (
	   [LOBId]
	  ,[ConfigKey]
	  ,[ConfigValue]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES

(@lobWCU,'PROP_DET_INFO_PROPERTY_INFO','Prop Info',SUSER_SNAME(),GETDATE(),null,null),

(@lobWCU,'PRINT_IND_NO','N',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'PRINT_IND_BATCH','BATCH',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'PRINT_IND_BOTH','BOTH',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'INSPECT_PROP','Y',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'CLMS_HOME','Y',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'CLMS_AUTO','Y',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'DRVR_RECS','Y',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'POL_FK','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'DRIVER_DET_DRIVER','Driver',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'DRIVER_DET_ACCIDENT','Accident',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'PROP_DET_INFO_PROPERTY','Business-Prop',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'PROP_DET_INFO_COMPLETE','Complete',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'PROP_DET_INFO_DEED','Deed',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'LOT_REC','Complete Info',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'EMAIL_FROM','DoNotReply_NJMInsurance@njm.com',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'EMAIL_BODY','umbrella',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'EMAIL_SUBJECT','Requested NJM Umbrella Information',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'CERT_IND','N',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'POL_PK','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'SRC_SYS','ADHOC',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'BARCODE_IND','N',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'ARCHIVE_IND','Y',SUSER_SNAME(),GETDATE(),null,null),
(@lobWCU,'PRINT_IND','DEPT',SUSER_SNAME(),GETDATE(),null,null)
GO

--sub control data mapping

INSERT [dbo].[Control]
(
       [ControlName]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime] )
	values 
	
	  ('PCCUMBDriverRecordListChildControl',SUSER_SNAME(),GETDATE(),null,null) ,
	  
	  ('PCCUMBDriverRecordChildControl',SUSER_SNAME(),GETDATE(),null,null) ,
	  ('PCCUMBUnderlyingPolicyChildControl',SUSER_SNAME(),GETDATE(),null,null) ,
	  ('PCCUMBInspectPropertyChildControl',SUSER_SNAME(),GETDATE(),null,null) ,
	  ('PCCUMBInspectPropertyOptionalChildControl',SUSER_SNAME(),GETDATE(),null,null) ,
	  ('PCCUMBInspectVacantLandChildControl',SUSER_SNAME(),GETDATE(),null,null) ,
	  ('PCCUMBSuspendRevokeExpChildControl',SUSER_SNAME(),GETDATE(),null,null) ,
	  ('PCCUMBDrivingRecordFaultAccidentChildControl',SUSER_SNAME(),GETDATE(),null,null) 

declare  @ctrlDriver int, @ctrlUnderPol int, @ctrlInspectProp int, @ctrlInspectPropOptional int, @ctrlVacantLand int
declare  @ctrlSuspendRevExp int, @ctrlDRFaultAccident int
declare  @docOHMid int, @docOHNotice int, @docMidCan int, @docMidCanwithdraw int, @docNoticeNonRenew int,
@docNoticeNonRenewWith int, @docPENN int,@driverRecItemId int, @underyingRecItemId int,@inspectionRecItemId int,
@vacantRecItemId int,@claimsRecItemId int,@ctrlDriverList int


--controls
Select @ctrlDriver=  ControlId from [dbo].[Control] where ControlName='PCCUMBDriverRecordChildControl'
Select @ctrlDriverList =  ControlId from [dbo].[Control] where ControlName='PCCUMBDriverRecordListChildControl'

Select @ctrlUnderPol=  ControlId from [dbo].[Control] where ControlName='PCCUMBUnderlyingPolicyChildControl'
Select @ctrlInspectProp=  ControlId from [dbo].[Control] where ControlName='PCCUMBInspectPropertyChildControl'
Select @ctrlInspectPropOptional=  ControlId from [dbo].[Control] where ControlName='PCCUMBInspectPropertyOptionalChildControl'
Select @ctrlVacantLand=  ControlId from [dbo].[Control] where ControlName='PCCUMBInspectVacantLandChildControl'
Select @ctrlSuspendRevExp=  ControlId from [dbo].[Control] where ControlName='PCCUMBSuspendRevokeExpChildControl'
Select @ctrlDRFaultAccident=  ControlId from [dbo].[Control] where ControlName='PCCUMBDrivingRecordFaultAccidentChildControl'

--douments
Select @docMidCan=  DocumentId from [dbo].[Document] where DocumentName='Midterm Cancellation-UMB'
Select @docMidCanwithdraw=  DocumentId from [dbo].[Document] where DocumentName='Midterm Cancel Withdrawal-UMB'
Select @docNoticeNonRenew=  DocumentId from [dbo].[Document] where DocumentName='Notice of Nonrenewal-UMB'
Select @docNoticeNonRenewWith=  DocumentId from [dbo].[Document] where DocumentName='Notice of Nonrenewal Withdrawal-UMB'

Select @docOHMid=  DocumentId from [dbo].[Document] where DocumentName='OH Midterm Cancellation-UMB'
Select @docOHNotice=  DocumentId from [dbo].[Document] where DocumentName='OH Notice of Nonrenewal-UMB'
Select @docPENN=  DocumentId from [dbo].[Document] where DocumentName='PENN Termination Notice-UMB'

--reasons for cancellations (For Midterm Cancellation-UMB)
Select @driverRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode='MidtermCancelReasons' and DocumentDropdownLookupItemCode='Driving Record'

--select dbo.GetDropdownItemId('MidtermCancelReasons','Driving Record');

Select  @underyingRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode='MidtermCancelReasons' and DocumentDropdownLookupItemCode='No Underlying Policy'

Select  @inspectionRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode='MidtermCancelReasons' and DocumentDropdownLookupItemCode='Inspection-Property'

Select  @vacantRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode='MidtermCancelReasons' and DocumentDropdownLookupItemCode='Inspection-Vacant Land'

Select  @claimsRecItemId=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode='MidtermCancelReasons' and DocumentDropdownLookupItemCode='Claims'

declare @1 int,@2 int,@3 int,@4 int,@5 int,@6 int
declare @11 int,@12 int,@13 int,@14 int,@15 int,@16 int
declare @21 int,@22 int,@23 int,@24 int,@25 int,@26 int
declare @27 int,@28 int,@29 int,@30 int,@31 int,@32 int,@33 int,@34 int


select @1 = dbo.GetDropdownItemId('CancelWithdrawalReasons','Driving Record')
select @2 = dbo.GetDropdownItemId('CancelWithdrawalReasons','No Longer Licensed')
select @3 = dbo.GetDropdownItemId('CancelWithdrawalReasons','Obtained Underlying Policies')
select @5 = dbo.GetDropdownItemId('CancelWithdrawalReasons','Claims-No Longer in Household')

select @11 = dbo.GetDropdownItemId('NonrenewalReasons','Driving Record')
select @13 = dbo.GetDropdownItemId('NonrenewalReasons','No Underlying Policy')
select @14 = dbo.GetDropdownItemId('NonrenewalReasons','Inspection')
select @15 = dbo.GetDropdownItemId('NonrenewalReasons','Claims (HO, UMB)')

select @21 = dbo.GetDropdownItemId('NonrenewalWithdrawalReasons','Driving Record')
select @22 = dbo.GetDropdownItemId('NonrenewalWithdrawalReasons','No Longer Licensed')
select @23 = dbo.GetDropdownItemId('NonrenewalWithdrawalReasons','Obtained Underlying Policies')
select @24 = dbo.GetDropdownItemId('NonrenewalWithdrawalReasons','Claims-No Longer in Household')

select @25 = dbo.GetDropdownItemId('MidtermCancellationReasons','Suspended, revoked, expired DL')

select @26 = dbo.GetDropdownItemId('NoticeofNonrenewalReasons','Driving Record-At Fault Accidents')
select @27 = dbo.GetDropdownItemId('NoticeofNonrenewalReasons','Driving Record-All Other Claims')
select @28=  dbo.GetDropdownItemId('NoticeofNonrenewalReasons','Driving Record-Motor Vehicle History')
select @29 = dbo.GetDropdownItemId('NoticeofNonrenewalReasons','At-fault accident/Violations')


select @30 = dbo.GetDropdownItemId('MidtermCancelReasons','Driving Record')
select @31 = dbo.GetDropdownItemId('MidtermCancelReasons','No Underlying Policy')
select @32 = dbo.GetDropdownItemId('MidtermCancelReasons','Inspection-Property')
select @33 = dbo.GetDropdownItemId('MidtermCancelReasons','Inspection-Vacant Land')
select @34 = dbo.GetDropdownItemId('MidtermCancelReasons','Claims')


INSERT [dbo].[DocumentDropdownChildControl]
(
		DocumentId,
		DocumentDropdownLookupItemId,
		ControlId,
		[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime] )
values 

--mid term only
(@docMidCan,@driverRecItemId,@ctrlDriverList,SUSER_SNAME(),GETDATE(),null,null), 
(@docMidCan,@underyingRecItemId,@ctrlUnderPol,SUSER_SNAME(),GETDATE(),null,null), 
(@docMidCan,@inspectionRecItemId,@ctrlInspectProp,SUSER_SNAME(),GETDATE(),null,null), 
(@docMidCan,@vacantRecItemId,@ctrlVacantLand,SUSER_SNAME(),GETDATE(),null,null), 
(@docMidCan,@claimsRecItemId,@ctrlUnderPol,SUSER_SNAME(),GETDATE(),null,null),


--OH notice of non renewal
(@docOHNotice,@26,@ctrlDRFaultAccident,SUSER_SNAME(),GETDATE(),null,null), 
(@docOHNotice,@27,@ctrlDRFaultAccident,SUSER_SNAME(),GETDATE(),null,null), 
(@docOHNotice,@28,@ctrlDRFaultAccident,SUSER_SNAME(),GETDATE(),null,null), 
(@docOHNotice,@29,@ctrlDRFaultAccident,SUSER_SNAME(),GETDATE(),null,null), 

--PENN term notice
(@docPENN,@30,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@docPENN,@31,@ctrlUnderPol,SUSER_SNAME(),GETDATE(),null,null), 
(@docPENN,@32,@ctrlInspectProp,SUSER_SNAME(),GETDATE(),null,null), 
(@docPENN,@33,@ctrlVacantLand,SUSER_SNAME(),GETDATE(),null,null), 
(@docPENN,@34,@ctrlUnderPol,SUSER_SNAME(),GETDATE(),null,null), 

--midterm cancellation OH
(@docOHMid,@25,@ctrlSuspendRevExp,SUSER_SNAME(),GETDATE(),null,null), 

--notice of nonrenewal withdrawl
(@docNoticeNonRenewWith,@21,@ctrlDriverList,SUSER_SNAME(),GETDATE(),null,null), 
(@docNoticeNonRenewWith,@22,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@docNoticeNonRenewWith,@23,@ctrlUnderPol,SUSER_SNAME(),GETDATE(),null,null), 
(@docNoticeNonRenewWith,@24,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 

--notice of nonrenewal
(@docNoticeNonRenew,@11,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@docNoticeNonRenew,@13,@ctrlUnderPol,SUSER_SNAME(),GETDATE(),null,null), 
(@docNoticeNonRenew,@14,@ctrlInspectProp,SUSER_SNAME(),GETDATE(),null,null), 
(@docNoticeNonRenew,@15,@ctrlUnderPol,SUSER_SNAME(),GETDATE(),null,null),

--for midterm withdrawl
(@docMidCanwithdraw,@1,@ctrlDriverList,SUSER_SNAME(),GETDATE(),null,null), 
(@docMidCanwithdraw,@2,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null), 
(@docMidCanwithdraw,@3,@ctrlUnderPol,SUSER_SNAME(),GETDATE(),null,null), 
--(@docMidCanwithdraw,@4,@ctrlInspectProp,SUSER_SNAME(),GETDATE(),null,null), 
(@docMidCanwithdraw,@5,@ctrlDriver,SUSER_SNAME(),GETDATE(),null,null)




go

  Declare @lobid int, @DocID1 int,@DocID2 int,@DocID3 int,@DocID4 int,@DocID5 int,@DocID6 int,@DocID7 int

Select @lobid = LOBid from LOB where LOBName = 'PC-UMB'

Select @DocID1 = DocumentID from Document where DocumentFriendlyName = 'Midterm Cancel Withdrawal'
Select @DocID2 = DocumentID from Document where DocumentFriendlyName = 'Midterm Cancellation'
Select @DocID3 = DocumentID from Document where DocumentFriendlyName = 'Notice of Nonrenewal'
Select @DocID4 = DocumentID from Document where DocumentFriendlyName = 'Notice of Nonrenewal Withdrawal'
Select @DocID5 = DocumentID from Document where DocumentFriendlyName = 'PENN Termination Notice-UMB'
Select @DocID6 = DocumentID from Document where DocumentFriendlyName = 'OH Midterm Cancellation'
Select @DocID7 = DocumentID from Document where DocumentFriendlyName = 'OH Notice of Nonrenewal'
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime],[DocumentId])
     VALUES
	 (@lobid,'reasonList','CancelWithdrawalReasons',SYSTEM_USER,SYSDATETIME(),@DocID1),
	 (@lobid,'underlyingPolicyList','UnderlyingPolicy',SYSTEM_USER,SYSDATETIME(),@DocID1),

	 (@lobid,'controlTitle','Midterm Cancel Reason',SYSTEM_USER,SYSDATETIME(),@DocID2),
	 (@lobid,'controlDiscription','Midterm Cancel Reason',SYSTEM_USER,SYSDATETIME(),@DocID2),
	 (@lobid,'reasonList','MidtermCancelReasons',SYSTEM_USER,SYSDATETIME(),@DocID2),
	 (@lobid,'underlyingPolicyList','MidtermCancelPolicy',SYSTEM_USER,SYSDATETIME(),@DocID2),

	 (@lobid,'controlTitle','Nonrenewal Reason',SYSTEM_USER,SYSDATETIME(),@DocID3),
	 (@lobid,'controlDiscription','Nonrenewal Reason',SYSTEM_USER,SYSDATETIME(),@DocID3),
	 (@lobid,'reasonList','NonrenewalReasons',SYSTEM_USER,SYSDATETIME(),@DocID3),
	 (@lobid,'underlyingPolicyList','MidtermCancelPolicy',SYSTEM_USER,SYSDATETIME(),@DocID3),

	 (@lobid,'controlTitle','Nonrenewal Withdrawal Reason',SYSTEM_USER,SYSDATETIME(),@DocID4),
	 (@lobid,'controlDiscription','Withdrawal Reason',SYSTEM_USER,SYSDATETIME(),@DocID4),
	 (@lobid,'reasonList','NonrenewalWithdrawalReasons',SYSTEM_USER,SYSDATETIME(),@DocID4),
	 (@lobid,'underlyingPolicyList','UnderlyingPolicy',SYSTEM_USER,SYSDATETIME(),@DocID4),


	 (@lobid,'controlTitle','Pennsylvania Termination Reasons',SYSTEM_USER,SYSDATETIME(),@DocID5),
	 (@lobid,'controlDiscription','Termination Reason',SYSTEM_USER,SYSDATETIME(),@DocID5),
	 (@lobid,'reasonList','MidtermCancelReasons',SYSTEM_USER,SYSDATETIME(),@DocID5),
	 (@lobid,'underlyingPolicyList','MidtermCancelPolicy',SYSTEM_USER,SYSDATETIME(),@DocID5),

	 (@lobid,'controlTitle','Midterm Cancellation',SYSTEM_USER,SYSDATETIME(),@DocID6),
	 (@lobid,'controlDiscription','Midterm Cancellation Reason',SYSTEM_USER,SYSDATETIME(),@DocID6),
	 (@lobid,'reasonList','MidtermCancellationReasons',SYSTEM_USER,SYSDATETIME(),@DocID6),

	 (@lobid,'controlTitle','Notice of Nonrenewal',SYSTEM_USER,SYSDATETIME(),@DocID7),
	 (@lobid,'controlDiscription','Nonrenew Reason',SYSTEM_USER,SYSDATETIME(),@DocID7),
	 (@lobid,'reasonList','NoticeofNonrenewalReasons',SYSTEM_USER,SYSDATETIME(),@DocID7)