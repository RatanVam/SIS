Go
Declare @lobID int
select @lobID =  LOBId from LOB where LOBName = 'WCC'
Declare @DocumentID int

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'wCCAttorneyRoles' and ConfigValue = 'Attorney')
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'wCCAttorneyRoles','Attorney',SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Regional Law Firm Referral Letter'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'lblNJMAttorney' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'lblNJMAttorney','Matter Counsel NJM Attorney',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'wCCProviderRoles' )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'wCCProviderRoles','Medical Personnel,Assistant Surgeo,Co-Surgeon,Occupational Therapist,Physical Therapist,Surgeon,Doctor,Other,Hospital,Medical Practice,Occupational Therapy Facility,Physical Therapy Facility',SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Perm Eval to Ins Short Form'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'wCCProviderRoles' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'wCCProviderRoles','Medical Personnel',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Ask Atty to Schedule Exam'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'IsProvierRequired' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'IsProvierRequired','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Perm Eval to Ins Short Form'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'IsProvierRequired' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'IsProvierRequired','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'claimantAttorneyRole' )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'claimantAttorneyRole','Petitioners Attorney,Petitioners Law Firm',SYSTEM_USER,SYSDATETIME())
End
select @DocumentID =  DocumentId from Document where DocumentName = 'Perm Eval to Ins Long Form'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showPetitionersAttorneyAddress' )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showPetitionersAttorneyAddress','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'wCCClaimantRoles' )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'wCCClaimantRoles','Claimant',SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'visiblepolicyNum' )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'visiblepolicyNum','True',SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'visibletxtMPCapplicant','False',SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'visibletxtClaimPetNum','False',SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'visibletxtStateNum','True',SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'visibletxtDocketNum','True',SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'visibletxtListDate','True',SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'visibletxtNYWCBnum','True',SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'visibletxtRefNum','True',SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'visibletxtCMSCaseCtrl','False',SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'enablepolicyNum' )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'enablepolicyNum','False',SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'enabletxtMPCapplicant','False',SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'enabletxtClaimPetNum','False',SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'enabletxtStateNum','False',SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'enabletxtDocketNum','False',SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'enabletxtListDate','False',SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'enabletxtNYWCBnum','False',SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'enabletxtRefNum','False',SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'enabletxtCMSCaseCtrl','False',SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'hideSwitchDocketNum' )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'hideSwitchDocketNum','False',SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'hideSwitchNYWCBnum','False',SYSTEM_USER,SYSDATETIME())
End


select @DocumentID =  DocumentId from Document where DocumentName = 'CMS Denial'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'visibletxtCMSCaseCtrl' and DocumentId =@DocumentID)
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'visibletxtCMSCaseCtrl','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'enabletxtCMSCaseCtrl','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'visiblepolicyNum','False',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'visibletxtStateNum','False',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'visibletxtDocketNum','False',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'visibletxtListDate','False',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'visibletxtNYWCBnum','False',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'visibletxtRefNum','False',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Motion to Compel Ans Special Rogs'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'visibletxtMPCapplicant' and DocumentId =@DocumentID)
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'visibletxtMPCapplicant','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'enabletxtMPCapplicant','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Non-EPLI Cost Share Ltr'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'visibletxtDocketNum' and DocumentId =@DocumentID)
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'visibletxtDocketNum','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'enabletxtDocketNum','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'hideSwitchDocketNum','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Regional Law Firm Referral Letter'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'enabletxtStateNum' and DocumentId =@DocumentID)
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'enabletxtStateNum','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Machine Information Request'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'visibletxtClaimPetNum' and DocumentId =@DocumentID)
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'visibletxtClaimPetNum','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Temp Overpayment'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'visibletxtClaimPetNum' and DocumentId =@DocumentID)
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'visibletxtClaimPetNum','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'NY Hearing Notice'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'enabletxtNYWCBnum' and DocumentId =@DocumentID)
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'enabletxtNYWCBnum','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'hideSwitchNYWCBnum','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'NY Hearing Notice'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'enabletxtNYWCBnum' and DocumentId =@DocumentID)
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'enabletxtNYWCBnum','True',@DocumentID,SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'hideSwitchNYWCBnum','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'petitionersLawFirmRole' )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'petitionersLawFirmRole','Petitioners Law Firm',SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Regional Law Firm Referral Letter'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'AttorneyDetailsMatterCounsel' and DocumentId =@DocumentID)
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'AttorneyDetailsMatterCounsel','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Regional Law Firm Referral Letter'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'AttorneyDetailsMatterCounsel' and DocumentId =@DocumentID)
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'AttorneyDetailsMatterCounsel','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Regional Law Firm Referral Letter'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'AttorneyDetailsMatterCounsel' and DocumentId =@DocumentID)
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'AttorneyDetailsMatterCounsel','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Subpoena Duces Tecum'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'courtResponse' and DocumentId =@DocumentID)
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'courtResponse','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Subpoena Ad Testificandum'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'courtDay' and DocumentId =@DocumentID)
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'courtDay','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'wccAdjrCaseMngrRoles' )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'wccAdjrCaseMngrRoles','Adjuster,Attorney,Attorney of Record,Coder,Supervisor,Medical Services,Awards Rep,Case Management Rep,DME Rep,Provider Services Rep,FNOL Rep,Utilization Review Rep,Subrogation Rep',SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'Doctor Quick Status Request'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'isSpecailDocTags' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'isSpecailDocTags','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End
select @DocumentID =  DocumentId from Document where DocumentName = 'Acknowledgement of Accident Report'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'isSpecailDocTags' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'isSpecailDocTags','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End
select @DocumentID =  DocumentId from Document where DocumentName = 'WC-FROI'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'isSpecailDocTags' and DocumentId = @DocumentID )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'isSpecailDocTags','True',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'wccPhysicianRoles' )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'wccPhysicianRoles','Doctor',SYSTEM_USER,SYSDATETIME())
End
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'wccRecipientExcludeRoles' )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'wccRecipientExcludeRoles','Other',SYSTEM_USER,SYSDATETIME())
End
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'chartDetails' )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'chartDetails','NJM UCR,MEDICARE,PIP F/S,NY WC F/S',SYSTEM_USER,SYSDATETIME())
End

select @DocumentID =  DocumentId from Document where DocumentName = 'UCR Appeal Letter'
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'chartDetails' and DocumentId =@DocumentID)
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'chartDetails','NJM UCR,MEDICARE,NJ PIP F/S,PA WC F/S,NY WC F/S,FEDERAL WC F/S',@DocumentID,SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'wCCClaimantDependentRoles' )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'wCCClaimantDependentRoles','Claimant Dependent',SYSTEM_USER,SYSDATETIME())
End
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'wCCGuardianRoles' )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'wCCGuardianRoles','Guardian',SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'wCCHospitalRoles' )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'wCCHospitalRoles','Hospital',SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'wCCWitnessRoles' )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'wCCWitnessRoles','Witness',SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'allLawFirmRole' )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'allLawFirmRole','Petitioners Law Firm,Petitioners Attorney,Outside Law Firm,Outside Counsel/Attorney',SYSTEM_USER,SYSDATETIME())
End




Select @lobid=  lobId from dbo.LOB where LOBName='WCC'

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'SRC_SYS' and LOBId=@lobID )
begin
 INSERT [dbo].[Configuration] (
	   [LOBId]
	  ,[ConfigKey]
	  ,[ConfigValue]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES


(@lobid,'SRC_SYS','ADHOC',SUSER_SNAME(),GETDATE(),null,null),
(@lobid,'PRINT_IND','Y',SUSER_SNAME(),GETDATE(),null,null),
(@lobid,'CLM_PK','1',SUSER_SNAME(),GETDATE(),null,null),
(@lobid,'CLM_FK','1',SUSER_SNAME(),GETDATE(),null,null)
End

GO