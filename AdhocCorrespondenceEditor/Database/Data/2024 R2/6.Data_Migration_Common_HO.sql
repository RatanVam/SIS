USE [ACE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Insert into [dbo].[Category] (CategoryName,CategoryFriendlyName,IsCategoryActive,
CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 

('PL_GENERAL_HO',		'HO General',		1,SUSER_SNAME(),GETDATE(),null,null),
('PL_POLICY_AUDIT_HO',	'HO Policy Audit',	1,SUSER_SNAME(),GETDATE(),null,null),
('PL_OFF_CALL_PROCESSING_HO',	'HO Off Call Processing',	1,SUSER_SNAME(),GETDATE(),null,null),
('PL_UNDERWRITING_HO',	'HO Underwriter',	1,SUSER_SNAME(),GETDATE(),null,null),
('PL_MAILER_SHEET_HO',	'PL Multiline',	1,SUSER_SNAME(),GETDATE(),null,null)

go

declare @lobHome int
declare @cat_PC_1 int,@cat_PC_2 int, @cat_PC_3 int, @cat_PC_4 int,@cat_PC_5 int


Select @lobHome=  lobId from dbo.LOB where LOBName='PC-HO'

Select @cat_PC_1=  CategoryId from [dbo].[Category] where CategoryName='PL_GENERAL_HO'
Select @cat_PC_2=  CategoryId from [dbo].[Category] where CategoryName='PL_POLICY_AUDIT_HO'
Select @cat_PC_3=  CategoryId from [dbo].[Category] where CategoryName='PL_OFF_CALL_PROCESSING_HO'
Select @cat_PC_4=  CategoryId from [dbo].[Category] where CategoryName='PL_UNDERWRITING_HO'
Select @cat_PC_5=  CategoryId from [dbo].[Category] where CategoryName='PL_MAILER_SHEET_HO'

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
	(@lobHome,@cat_PC_1,10,'Inspire_ACE_Prod,Inspire_CNSLT_PersLines,Inspire_Personal_Lines,Inspire_PL_HD_CSR,Inspire_PL_HD_SS,Inspire_CNSLT_PL_HUD_Admin,Inspire_PL_MailerSheet,Inspire_PL_HD_SUP_UW_RCT,Inspire_PL_HD_Audit',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobHome,@cat_PC_2,20,'Inspire_ACE_Prod,Inspire_CNSLT_PersLines,Inspire_Personal_Lines,Inspire_PL_HD_CSR,Inspire_PL_HD_SS,Inspire_CNSLT_PL_HUD_Admin,Inspire_PL_MailerSheet,Inspire_PL_HD_SUP_UW_RCT,Inspire_PL_HD_Audit',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobHome,@cat_PC_3,30,'Inspire_ACE_Prod,Inspire_CNSLT_PersLines,Inspire_Personal_Lines,Inspire_PL_HD_CSR,Inspire_PL_HD_SS,Inspire_CNSLT_PL_HUD_Admin,Inspire_PL_MailerSheet,Inspire_PL_HD_SUP_UW_RCT,Inspire_PL_HD_Audit',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobHome,@cat_PC_4,40,'Inspire_ACE_Prod,Inspire_CNSLT_PersLines,Inspire_Personal_Lines,Inspire_PL_HD_CSR,Inspire_PL_HD_SS,Inspire_CNSLT_PL_HUD_Admin,Inspire_PL_MailerSheet,Inspire_PL_HD_SUP_UW_RCT,Inspire_PL_HD_Audit',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
	(@lobHome,@cat_PC_5,40,'Inspire_ACE_Prod,Inspire_CNSLT_PersLines,Inspire_Personal_Lines,Inspire_PL_HD_CSR,Inspire_PL_HD_SS,Inspire_CNSLT_PL_HUD_Admin,Inspire_PL_MailerSheet,Inspire_PL_HD_SUP_UW_RCT,Inspire_PL_HD_Audit',DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null)


INSERT [dbo].[Control]
(
       [ControlName]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime] )
	values 
	  ('PLHO61AddAdtlInfoSection',SUSER_SNAME(),GETDATE(),null,null),
	  ('PLHO61DecAdtlInfoSection',SUSER_SNAME(),GETDATE(),null,null),
	  ('PLHO61NoAddAdtlInfoSection',SUSER_SNAME(),GETDATE(),null,null),
	  ('PLHOUpdateAppraisal',SUSER_SNAME(),GETDATE(),null,null)

GO



Insert into [dbo].[Document] (DocumentName,DocumentFriendlyName,IsDocumentActive, BaseState,JldFilePath,DocumentType,
CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values

('Addtl Insured HO-41 Explanation','Addtl Insured HO-41 Explanation','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Addtl Insured HO-41 Explanation.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Audit Correction Letter-HO','Audit Correction Letter','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Audit Correction Letter-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('College Exposure-HO','College Exposure','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/College Exposure-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Business or Farm Use-HO','Business or Farm Use','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Business or Farm Use-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Cancel Nonrenew Mortgagee-HO','Cancel Nonrenew Mortgagee','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Cancel Nonrenew Mortgagee-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Cancel Nonrenew Withdrawal-HO','Cancel Nonrenew Withdrawal','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Cancel Nonrenew Withdrawal-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Cancel Nonrenew-HO','Cancel Nonrenew','1','NJ','companyRoot:S:Production://Templates/PolicyCenterHomeowners/Cancel Nonrenew-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Claim Denial Letter-HO','Claim Denial Letter','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Claim Denial Letter-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Claim Review Repairs Required-HO','Claim Review-Repairs Required','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Claim Review Repairs Required-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Paid Receipt-HO','Paid Receipt','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Paid Receipt-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Scheduled Personal Prop App','Scheduled Personal Prop App','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Scheduled Personal Prop App.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Wind and Hail Cov Verification-HO','Wind and Hail Cov Verification','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Wind and Hail Cov Verification-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Third Party Application-HO','Third Party Application','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Third Party Application-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Third Party Designee Add-Delete-HO','Third Party Designee Add-Delete','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Third Party Designee Add-Delete-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Executor-Executrix-POA-HO','Executor-Executrix-POA','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Executor-Executrix-POA-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Follow up Needed-HO','Follow up Needed','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Follow up Needed-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Guaranteed Replacement Cov-HO','Guaranteed Replacement Cov','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Guaranteed Replacement Cov-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('HO-61 Scheduled Pers Prop-Need AI','HO-61 Scheduled Personal Property','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/HO-61 Scheduled Pers Prop-Need AI.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Host Liability-HO','Host Liability','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Host Liability-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Intent to Renew-HO','Intent to Renew','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Intent to Renew-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PENN Death Generic Letter-HO','PENN Death Generic Letter-HO','1','PA','companyRoot:S:Production://Templates/PolicyCenterHomeowners/PENN Death Generic Letter-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('NJ Decline Ltr-HO','NJ Decline Ltr','1','NJ','companyRoot:S:Production://Templates/PolicyCenterHomeowners/NJ Decline Ltr-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PENN Death of Insd-Renewal Ltr-HO','PENN Death of Insd-Renewal Ltr-HO','1','PA','companyRoot:S:Production://Templates/PolicyCenterHomeowners/PENN Death of Insd-Renewal Ltr-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PENN Refusal to Write Notice-HO','PENN Refusal to Write Notice-HO','1','PA','companyRoot:S:Production://Templates/PolicyCenterHomeowners/PENN Refusal to Write Notice-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PENN Termination Notice-HO','PENN Termination Notice-HO','1','PA','companyRoot:S:Production://Templates/PolicyCenterHomeowners/PENN Termination Notice-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Personal Property in Storage-HO','Personal Property in Storage','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Personal Property in Storage-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PL HO Blank Letter Template','PL Blank Letter Template','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/PL HO Blank Letter Template.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('RCT Results Cover Letter-HO','RCT Results Cover Letter','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/RCT Results Cover Letter-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Certificate of Insurance-HO','Certificate of Insurance','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Certificate of Insurance-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Replacement Cost Analysis-HO','Replacement Cost Analysis-HO','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Replacement Cost Analysis-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Request Deed-HO','Request Deed','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Request Deed-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Underwriting Reinstate-HO','Underwriting Reinstate','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Underwriting Reinstate-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Unsecured Pool-HO','Unsecured Pool','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Unsecured Pool-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Vacant Land-HO','Vacant Land','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Vacant Land-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Verify Occupancy-HO','Verify Occupancy','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/Verify Occupancy-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('PL HO Mailer Sheet','PL Mailer Sheet','1',NULL,'companyRoot:S:Production://Templates/PolicyCenterHomeowners/PL HO Mailer Sheet.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('CT Cancel Nonrenew-HO','CT Cancel Nonrenew','1','CT','companyRoot:S:Production://Templates/PolicyCenterHomeowners/CT Cancel Nonrenew-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('CT Decline Ltr-HO','CT Decline Ltr','1','CT','companyRoot:S:Production://Templates/PolicyCenterHomeowners/CT Decline Ltr-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('OH Cancel Nonrenew-HO','OH Cancel Nonrenew','1','OH','companyRoot:S:Production://Templates/PolicyCenterHomeowners/OH Cancel Nonrenew-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('Discovery of Material Risk Factor During UW Period-HO','Discovery of Material Risk Factor During UW Period','1','MD','companyRoot:S:Production://Templates/PolicyCenterHomeowners/Discovery of Material Risk Factor During UW Period-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null),
('MD Cancel Nonrenew-HO','MD Cancel Nonrenew','1','MD','companyRoot:S:Production://Templates/PolicyCenterHomeowners/MD Cancel Nonrenew-HO.jld','POLDOC  Correspondence',SUSER_SNAME(),GETDATE(),null,null)


go



declare @lobHome int
declare @cat_PC_1 int,@cat_PC_2 int, @cat_PC_3 int, @cat_PC_4 int, @cat_PC_5 int


Select @lobHome=  lobId from dbo.LOB where LOBName='PC-HO'


Select @cat_PC_1=  CategoryId from [dbo].[Category] where CategoryName='PL_GENERAL_HO'
Select @cat_PC_2=  CategoryId from [dbo].[Category] where CategoryName='PL_POLICY_AUDIT_HO'
Select @cat_PC_3=  CategoryId from [dbo].[Category] where CategoryName='PL_UNDERWRITING_HO'
Select @cat_PC_4=  CategoryId from [dbo].[Category] where CategoryName='PL_OFF_CALL_PROCESSING_HO'
Select @cat_PC_5=  CategoryId from [dbo].[Category] where CategoryName='PL_MAILER_SHEET_HO'


declare  @doc1 int, @doc2 int, @doc3 int, @doc4 int, @doc5 int,@doc6 int,  @doc7 int, @doc8 int, @doc9 int, 
@doc10 int, @doc11 int, @doc12 int, @doc13 int, @doc14 int, @doc15 int, @doc16 int, @doc17 int, @doc18 int, @doc19 int, 
@doc20 int, @doc21 int, @doc22 int, @doc23 int, @doc24 int, @doc25 int, @doc26 int, @doc27 int, @doc28 int,@doc29 int ,@doc30 int,
@doc31 int, @doc32 int, @doc33 int, @doc34 int, @doc35 int, @doc36 int, @doc37 int, @doc38 int,@doc39 int ,@doc40 int,@doc41 int


Select @doc1=  DocumentId from [dbo].[Document] where DocumentName='Addtl Insured HO-41 Explanation'
Select @doc2=  DocumentId from [dbo].[Document] where DocumentName='College Exposure-HO'
Select @doc3=  DocumentId from [dbo].[Document] where DocumentName='Paid Receipt-HO'
Select @doc4=  DocumentId from [dbo].[Document] where DocumentName='Scheduled Personal Prop App'
Select @doc5=  DocumentId from [dbo].[Document] where DocumentName='Wind and Hail Cov Verification-HO'
Select @doc6=  DocumentId from [dbo].[Document] where DocumentName='Third Party Application-HO'
Select @doc7=  DocumentId from [dbo].[Document] where DocumentName='Third Party Designee Add-Delete-HO'

Select @doc8=  DocumentId from [dbo].[Document] where DocumentName='PL HO Mailer Sheet'
Select @doc9=  DocumentId from [dbo].[Document] where DocumentName='Audit Correction Letter-HO'

Select @doc10=  DocumentId from [dbo].[Document] where DocumentName='Business or Farm Use-HO'
Select @doc11=  DocumentId from [dbo].[Document] where DocumentName='Cancel Nonrenew Mortgagee-HO'
Select @doc12=  DocumentId from [dbo].[Document] where DocumentName='Cancel Nonrenew Withdrawal-HO'
Select @doc13=  DocumentId from [dbo].[Document] where DocumentName='Cancel Nonrenew-HO'
Select @doc14=  DocumentId from [dbo].[Document] where DocumentName='Claim Denial Letter-HO'
Select @doc15=  DocumentId from [dbo].[Document] where DocumentName='Claim Review Repairs Required-HO'
Select @doc16=  DocumentId from [dbo].[Document] where DocumentName='Executor-Executrix-POA-HO'
Select @doc17=  DocumentId from [dbo].[Document] where DocumentName='Follow up Needed-HO'
Select @doc18=  DocumentId from [dbo].[Document] where DocumentName='Guaranteed Replacement Cov-HO'
Select @doc19=  DocumentId from [dbo].[Document] where DocumentName='HO-61 Scheduled Pers Prop-Need AI'
Select @doc20=  DocumentId from [dbo].[Document] where DocumentName='Host Liability-HO'
Select @doc21=  DocumentId from [dbo].[Document] where DocumentName='Intent to Renew-HO'
Select @doc22=  DocumentId from [dbo].[Document] where DocumentName='PENN Death Generic Letter-HO'
Select @doc23=  DocumentId from [dbo].[Document] where DocumentName='NJ Decline Ltr-HO'
Select @doc24=  DocumentId from [dbo].[Document] where DocumentName='PENN Death of Insd-Renewal Ltr-HO'
Select @doc25=  DocumentId from [dbo].[Document] where DocumentName='PENN Refusal to Write Notice-HO'
Select @doc26=  DocumentId from [dbo].[Document] where DocumentName='PENN Termination Notice-HO'
Select @doc27=  DocumentId from [dbo].[Document] where DocumentName='Personal Property in Storage-HO'
Select @doc28=  DocumentId from [dbo].[Document] where DocumentName='PL HO Blank Letter Template'
Select @doc29=  DocumentId from [dbo].[Document] where DocumentName='RCT Results Cover Letter-HO'
Select @doc30=  DocumentId from [dbo].[Document] where DocumentName='Certificate of Insurance-HO'
Select @doc31=  DocumentId from [dbo].[Document] where DocumentName='Replacement Cost Analysis-HO'
Select @doc32=  DocumentId from [dbo].[Document] where DocumentName='Request Deed-HO'
Select @doc33=  DocumentId from [dbo].[Document] where DocumentName='Underwriting Reinstate-HO'
Select @doc34=  DocumentId from [dbo].[Document] where DocumentName='Unsecured Pool-HO'
Select @doc35=  DocumentId from [dbo].[Document] where DocumentName='Vacant Land-HO'
Select @doc36=  DocumentId from [dbo].[Document] where DocumentName='Verify Occupancy-HO'
Select @doc37=  DocumentId from [dbo].[Document] where DocumentName='CT Cancel Nonrenew-HO'
Select @doc38=  DocumentId from [dbo].[Document] where DocumentName='CT Decline Ltr-HO'
Select @doc39=  DocumentId from [dbo].[Document] where DocumentName='OH Cancel Nonrenew-HO'
Select @doc40=  DocumentId from [dbo].[Document] where DocumentName='Discovery of Material Risk Factor During UW Period-HO'
Select @doc41=  DocumentId from [dbo].[Document] where DocumentName='MD Cancel Nonrenew-HO'


INSERT [dbo].[CategoryDocument] (DocumentId,CategoryId,DocumentOrder, EffectiveDate, ExpirationDate,CreatedBy, CreatedDateTime, UpdatedBy, UpdatedDateTime)
VALUES
(@doc1,@cat_PC_1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@cat_PC_1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc3,@cat_PC_1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc4,@cat_PC_1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@cat_PC_1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@cat_PC_1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

(@doc6,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@cat_PC_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

(@doc8,@cat_PC_5,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

(@doc9,@cat_PC_4,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),

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
(@doc28,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc29,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc30,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc31,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc32,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc33,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc34,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc35,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc36,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc37,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc38,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc39,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc40,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@doc41,@cat_PC_3,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)


GO



declare  @doc1 int, @doc2 int, @doc3 int, @doc4 int, @doc5 int,@doc6 int,  @doc7 int, @doc8 int, @doc9 int, 
@doc10 int, @doc11 int, @doc12 int, @doc13 int, @doc14 int, @doc15 int, @doc16 int, @doc17 int, @doc18 int, @doc19 int, 
@doc20 int, @doc21 int, @doc22 int, @doc23 int, @doc24 int, @doc25 int, @doc26 int, @doc27 int, @doc28 int,@doc29 int ,@doc30 int,
@doc31 int, @doc32 int, @doc33 int, @doc34 int, @doc35 int, @doc36 int, @doc37 int, @doc38 int,@doc39 int ,@doc40 int,@doc41 int


Select @doc1=  DocumentId from [dbo].[Document] where DocumentName='Addtl Insured HO-41 Explanation'
Select @doc2=  DocumentId from [dbo].[Document] where DocumentName='College Exposure-HO'
Select @doc3=  DocumentId from [dbo].[Document] where DocumentName='Paid Receipt-HO'
Select @doc4=  DocumentId from [dbo].[Document] where DocumentName='Scheduled Personal Prop App'
Select @doc5=  DocumentId from [dbo].[Document] where DocumentName='Wind and Hail Cov Verification-HO'
Select @doc6=  DocumentId from [dbo].[Document] where DocumentName='Third Party Application-HO'
Select @doc7=  DocumentId from [dbo].[Document] where DocumentName='Third Party Designee Add-Delete-HO'

Select @doc8=  DocumentId from [dbo].[Document] where DocumentName='PL HO Mailer Sheet'
Select @doc9=  DocumentId from [dbo].[Document] where DocumentName='Audit Correction Letter-HO'

Select @doc10=  DocumentId from [dbo].[Document] where DocumentName='Business or Farm Use-HO'
Select @doc11=  DocumentId from [dbo].[Document] where DocumentName='Cancel Nonrenew Mortgagee-HO'
Select @doc12=  DocumentId from [dbo].[Document] where DocumentName='Cancel Nonrenew Withdrawal-HO'
Select @doc13=  DocumentId from [dbo].[Document] where DocumentName='Cancel Nonrenew-HO'
Select @doc14=  DocumentId from [dbo].[Document] where DocumentName='Claim Denial Letter-HO'
Select @doc15=  DocumentId from [dbo].[Document] where DocumentName='Claim Review Repairs Required-HO'
Select @doc16=  DocumentId from [dbo].[Document] where DocumentName='Executor-Executrix-POA-HO'
Select @doc17=  DocumentId from [dbo].[Document] where DocumentName='Follow up Needed-HO'
Select @doc18=  DocumentId from [dbo].[Document] where DocumentName='Guaranteed Replacement Cov-HO'
Select @doc19=  DocumentId from [dbo].[Document] where DocumentName='HO-61 Scheduled Pers Prop-Need AI'
Select @doc20=  DocumentId from [dbo].[Document] where DocumentName='Host Liability-HO'
Select @doc21=  DocumentId from [dbo].[Document] where DocumentName='Intent to Renew-HO'
Select @doc22=  DocumentId from [dbo].[Document] where DocumentName='PENN Death Generic Letter-HO'
Select @doc23=  DocumentId from [dbo].[Document] where DocumentName='NJ Decline Ltr-HO'
Select @doc24=  DocumentId from [dbo].[Document] where DocumentName='PENN Death of Insd-Renewal Ltr-HO'
Select @doc25=  DocumentId from [dbo].[Document] where DocumentName='PENN Refusal to Write Notice-HO'
Select @doc26=  DocumentId from [dbo].[Document] where DocumentName='PENN Termination Notice-HO'
Select @doc27=  DocumentId from [dbo].[Document] where DocumentName='Personal Property in Storage-HO'
Select @doc28=  DocumentId from [dbo].[Document] where DocumentName='PL HO Blank Letter Template'
Select @doc29=  DocumentId from [dbo].[Document] where DocumentName='RCT Results Cover Letter-HO'
Select @doc30=  DocumentId from [dbo].[Document] where DocumentName='Certificate of Insurance-HO'
Select @doc31=  DocumentId from [dbo].[Document] where DocumentName='Replacement Cost Analysis-HO'
Select @doc32=  DocumentId from [dbo].[Document] where DocumentName='Request Deed-HO'
Select @doc33=  DocumentId from [dbo].[Document] where DocumentName='Underwriting Reinstate-HO'
Select @doc34=  DocumentId from [dbo].[Document] where DocumentName='Unsecured Pool-HO'
Select @doc35=  DocumentId from [dbo].[Document] where DocumentName='Vacant Land-HO'
Select @doc36=  DocumentId from [dbo].[Document] where DocumentName='Verify Occupancy-HO'
Select @doc37=  DocumentId from [dbo].[Document] where DocumentName='CT Cancel Nonrenew-HO'
Select @doc38=  DocumentId from [dbo].[Document] where DocumentName='CT Decline Ltr-HO'
Select @doc39=  DocumentId from [dbo].[Document] where DocumentName='OH Cancel Nonrenew-HO'
Select @doc40=  DocumentId from [dbo].[Document] where DocumentName='Discovery of Material Risk Factor During UW Period-HO'
Select @doc41=  DocumentId from [dbo].[Document] where DocumentName='MD Cancel Nonrenew-HO'

--Controls

declare  @ctrlEmail int, @ctrlFax int, @ctrlAddress int, @ctrlPrinter int, @ctrlSelectCommn int
declare  @ctrlAddtCheckbox int, @ctrlAdd123 int, @ctrlcertifi int, @ctrl123greet int
declare  @ctrlMPrinterCheck int, @ctrlMail int,@ctrlLetter int, @ctrlDrpGreet int
declare @ctrlAdd61 int,@ctrlNo61 int,@ctrlDec61 int,@ctrlUpdate int,@ctrlAdditional int

Select @ctrlSelectCommn=  ControlId from [dbo].[Control] where ControlName='SelectCommunicationSection'
Select @ctrlAdd61=  ControlId from [dbo].[Control] where ControlName='PLHO61AddAdtlInfoSection'
Select @ctrlNo61=  ControlId from [dbo].[Control] where ControlName='PLHO61NoAddAdtlInfoSection'
Select @ctrlDec61=  ControlId from [dbo].[Control] where ControlName='PLHO61DecAdtlInfoSection'
Select @ctrlUpdate=  ControlId from [dbo].[Control] where ControlName='PLHOUpdateAppraisal'

Select @ctrlEmail=  ControlId from [dbo].[Control] where ControlName='EmailwCheckbox'
Select @ctrlFax=  ControlId from [dbo].[Control] where ControlName='FaxwCheckbox'
Select @ctrlMPrinterCheck=  ControlId from [dbo].[Control] where ControlName='PrinterDropdownwCheckbox'
Select @ctrlMail=  ControlId from [dbo].[Control] where ControlName='UsMailCheckbox'
Select @ctrlPrinter=  ControlId from [dbo].[Control] where ControlName='PrinterDropdown'
Select @ctrlLetter=  ControlId from [dbo].[Control] where ControlName=    'LetterDatePicker'

Select @ctrlAdd123=  ControlId from [dbo].[Control] where ControlName='PLAddresseeNameOneTwoAndThree'
Select @ctrlcertifi=  ControlId from [dbo].[Control] where ControlName='PCDWCertificateHolderName'
Select @ctrl123greet=  ControlId from [dbo].[Control] where ControlName='PLAddrNmOneTwoThreewGreetNm'
Select @ctrlAdditional=  ControlId from [dbo].[Control] where ControlName='PCUMBAddtlPolNumCheckboxwCheckboxLst'


 INSERT [dbo].[DocumentControl] (
       [DocumentId]
      ,[ControlId]
      ,[ControlOrder]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES

(@doc8,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc8,@ctrlPrinter,400,SUSER_SNAME(),GETDATE(),null,null),

(@doc41,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc41,@ctrlLetter,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc41,@ctrlPrinter,400,SUSER_SNAME(),GETDATE(),null,null),

(@doc40,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc40,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc40,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc40,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc40,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc39,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc39,@ctrlLetter,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc39,@ctrlPrinter,400,SUSER_SNAME(),GETDATE(),null,null),

(@doc38,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc38,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc38,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc38,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc38,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc38,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc37,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc37,@ctrlLetter,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc37,@ctrlPrinter,400,SUSER_SNAME(),GETDATE(),null,null),

(@doc36,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc36,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc36,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc36,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc36,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc36,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc35,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc35,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc35,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc35,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc35,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc35,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc34,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc34,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc34,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc34,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc34,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc34,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc33,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc33,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc33,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc33,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc33,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc33,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc32,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc32,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc32,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc32,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc32,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc32,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc31,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc31,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc31,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc31,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc31,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc31,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc30,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc30,@ctrlcertifi,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc30,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc30,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc30,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc30,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc30,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc29,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc29,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc29,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc29,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc29,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc29,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc28,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc28,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc27,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc27,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc26,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc26,@ctrlPrinter,400,SUSER_SNAME(),GETDATE(),null,null),

(@doc25,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc25,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc25,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc25,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),

(@doc24,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc24,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc23,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc23,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc22,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc22,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc21,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc21,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc20,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc20,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc19,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlAdd61,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlNo61,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlUpdate,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlDec61,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlSelectCommn,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlMail,700,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlMPrinterCheck,800,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlEmail,900,SUSER_SNAME(),GETDATE(),null,null),
(@doc19,@ctrlFax,1000,SUSER_SNAME(),GETDATE(),null,null),

(@doc18,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc18,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc18,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc18,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc18,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc18,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc17,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc17,@ctrlPrinter,400,SUSER_SNAME(),GETDATE(),null,null),

(@doc16,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc16,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc15,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc15,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc14,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc14,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc13,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@ctrlLetter,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc13,@ctrlPrinter,400,SUSER_SNAME(),GETDATE(),null,null),

(@doc12,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc12,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc12,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc12,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc12,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc12,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc11,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@ctrlLetter,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc11,@ctrlPrinter,400,SUSER_SNAME(),GETDATE(),null,null),

(@doc10,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc10,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc9,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc9,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc7,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc7,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc6,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@ctrlAdditional,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@ctrlSelectCommn,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@ctrlMail,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@ctrlMPrinterCheck,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@ctrlEmail,600,SUSER_SNAME(),GETDATE(),null,null),
(@doc6,@ctrlFax,700,SUSER_SNAME(),GETDATE(),null,null),

(@doc5,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc5,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc4,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc4,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc4,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc4,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc4,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc4,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc3,@ctrlAdd123,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc3,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc3,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc3,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc3,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc3,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc2,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc2,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null),

(@doc1,@ctrl123greet,100,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlSelectCommn,200,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlMail,300,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlMPrinterCheck,400,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlEmail,500,SUSER_SNAME(),GETDATE(),null,null),
(@doc1,@ctrlFax,600,SUSER_SNAME(),GETDATE(),null,null)


GO


declare @lobIdPa int,@lobHome int, @lob int

Select @lobHome=  lobId from dbo.LOB where LOBName='PC-HO'


 INSERT [dbo].[Configuration] (
	   [LOBId]
	  ,[ConfigKey]
	  ,[ConfigValue]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES

(@lobHome,'HO61_ADTL_INFO','Appraisal',SUSER_SNAME(),GETDATE(),null,null),
(@lobHome,'PRINT_IND_NO','N',SUSER_SNAME(),GETDATE(),null,null),
(@lobHome,'PRINT_IND_BATCH','BATCH',SUSER_SNAME(),GETDATE(),null,null),
(@lobHome,'PRINT_IND_BOTH','BOTH',SUSER_SNAME(),GETDATE(),null,null),
(@lobHome,'POL_FK','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobHome,'EMAIL_FROM','DoNotReply@njm.com',SUSER_SNAME(),GETDATE(),null,null),
(@lobHome,'EMAIL_BODY','homeowner',SUSER_SNAME(),GETDATE(),null,null),
(@lobHome,'EMAIL_SUBJECT','Requested NJM Homeowners Information',SUSER_SNAME(),GETDATE(),null,null),
(@lobHome,'CERT_IND','N',SUSER_SNAME(),GETDATE(),null,null),
(@lobHome,'POL_PK','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobHome,'SRC_SYS','ADHOC',SUSER_SNAME(),GETDATE(),null,null),
(@lobHome,'BARCODE_IND','N',SUSER_SNAME(),GETDATE(),null,null),
(@lobHome,'ARCHIVE_IND','Y',SUSER_SNAME(),GETDATE(),null,null),
(@lobHome,'PRINT_IND','DEPT',SUSER_SNAME(),GETDATE(),null,null)

GO



Declare @documentID int
  Declare @lobID integer
  Declare @CertificatesList varchar(50) = 'certificatesList'
  Declare @ColorClarityList varchar(50) = 'colorClarityList'

  select @lobID =  LOBId from LOB where LOBName = 'PC-HO'
   select @documentID =  [DocumentId] from [dbo].[Document] where [DocumentFriendlyName] = 'HO-61 Scheduled Personal Property'
Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(@documentID,@lobID,@CertificatesList,'','',SUSER_SNAME(),GETDATE(),null,null),
(@documentID,@lobID,@ColorClarityList,'','',SUSER_SNAME(),GETDATE(),null,null)


Declare @CertificatesListID int
Select @CertificatesListID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @CertificatesList
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('GIA (Gemological Institute of America)','GIA (Gemological Institute of America)',@CertificatesListID,100,SUSER_SNAME(),GETDATE(),null,null),
('EGL (European Gemological Laboratory)','EGL (European Gemological Laboratory)',@CertificatesListID,200,SUSER_SNAME(),GETDATE(),null,null),
('AGS (American Gem Society)','AGS (American Gem Society)',@CertificatesListID,300,SUSER_SNAME(),GETDATE(),null,null)

Declare @ColorClarityListID int
Select @ColorClarityListID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @ColorClarityList

insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('color','color',@ColorClarityListID,100,SUSER_SNAME(),GETDATE(),null,null),
('clarity','clarity',@ColorClarityListID,200,SUSER_SNAME(),GETDATE(),null,null),
('color and clarity','color and clarity',@ColorClarityListID,300,SUSER_SNAME(),GETDATE(),null,null)

