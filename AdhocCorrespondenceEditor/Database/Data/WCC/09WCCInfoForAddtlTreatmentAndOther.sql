Go

Declare @reasonsAdditionalTreatmentWCC varchar(50) = 'reasonsAdditionalTreatmentWCC'

Declare @lobID int =(select LOBId from LOB where LOBName = 'WCC')

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = @reasonsAdditionalTreatmentWCC )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,@reasonsAdditionalTreatmentWCC,@reasonsAdditionalTreatmentWCC,SYSTEM_USER,SYSDATETIME())
End
IF NOT EXISTS (SELECT * from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonsAdditionalTreatmentWCC )
begin
 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(-999,@lobID,@reasonsAdditionalTreatmentWCC,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare @ReasonsID integer
Select @ReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonsAdditionalTreatmentWCC
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Complete initial assessment','Complete initial assessment.',@ReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Complete reassessment','Complete reassessment with objective and functional measures contrasted to prior measures.',@ReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Complete copy of daily notes','Complete copy of daily notes.',@ReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),
('Current physician referral','Current physician referral.',@ReasonsID,400,SUSER_SNAME(),GETDATE(),null,null)

End