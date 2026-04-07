Go

Declare @reasonsImeParagraph varchar(50) = 'reasonsImeParagraph'

Declare @lobID int =(select LOBId from LOB where LOBName = 'GC')

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = @reasonsImeParagraph  and LOBId = @lobID)
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,@reasonsImeParagraph,@reasonsImeParagraph,SYSTEM_USER,SYSDATETIME())
End
IF NOT EXISTS (SELECT * from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonsImeParagraph )
begin
 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(-999,@lobID,@reasonsImeParagraph,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare @ReasonsID integer
Select @ReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonsImeParagraph
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,InspireTag,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,DocumentDropdownLookupItemAdditionalValue,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Does the claimant require MRI ''s','1','CLMT_REQ_MRI',@ReasonsID,100,null,SUSER_SNAME(),GETDATE(),null,null),
('Does the clmnt req EDX testing','1','CLMT_REQ_EDX',@ReasonsID,200,null,SUSER_SNAME(),GETDATE(),null,null),
('Is any further treatment req','2','REQ_FURTHER_TRMNT',@ReasonsID,300,null,SUSER_SNAME(),GETDATE(),null,null),
('Conservative treatment','0','CONSERVE_TRMNT',@ReasonsID,400,'2',SUSER_SNAME(),GETDATE(),null,null),
('Interventional treatment','0','INTERVENT_TRMNT',@ReasonsID,500,'2',SUSER_SNAME(),GETDATE(),null,null),
('Surgical treatment','0','SURGICAL_TRMNT',@ReasonsID,600,'2',SUSER_SNAME(),GETDATE(),null,null),
('Medication required','0','MED_REQ',@ReasonsID,700,'2',SUSER_SNAME(),GETDATE(),null,null),
('Please evaluate and address','3','EVAL_AND_ADDRESS',@ReasonsID,800,null,SUSER_SNAME(),GETDATE(),null,null),
('Req complementary acupuncture','0','REQ_COMPLE_ACUPUNCT',@ReasonsID,900,'3',SUSER_SNAME(),GETDATE(),null,null),
('Should continue with acupuncture','0','CONTINUE_ACUPUNCT',@ReasonsID,1000,'3',SUSER_SNAME(),GETDATE(),null,null),
('No Clinical condition to support','0','NO_CLINICAL_SUPPORT',@ReasonsID,1100,'3',SUSER_SNAME(),GETDATE(),null,null),
('Are the CPT Codes submitted','1','CPT_CODES_SUB',@ReasonsID,1200,null,SUSER_SNAME(),GETDATE(),null,null),
('Med necessity for DME supplies','1','NEC_MED_DME',@ReasonsID,1300,null,SUSER_SNAME(),GETDATE(),null,null),
('For Chiropractors only','1','CHIRO_ONLY',@ReasonsID,1400,null,SUSER_SNAME(),GETDATE(),null,null)
End