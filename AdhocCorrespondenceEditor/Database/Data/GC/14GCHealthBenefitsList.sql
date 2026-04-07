Go

Declare @reasonsHealthBenefits varchar(50) = 'reasonsHealthBenefits'

Declare @lobID int =(select LOBId from LOB where LOBName = 'GC')

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = @reasonsHealthBenefits  and LOBId = @lobID)
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,@reasonsHealthBenefits,@reasonsHealthBenefits,SYSTEM_USER,SYSDATETIME())
End
IF NOT EXISTS (SELECT * from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonsHealthBenefits )
begin
 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(-999,@lobID,@reasonsHealthBenefits,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare @ReasonsID integer
Select @ReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonsHealthBenefits
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('You failed to treat within the health carrier''s guidelines.','1',@ReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('You didn''t have health insurance on the date of accident.','2',@ReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Your health insurance carrier cannot be selected as primary for PIP benefits.','3',@ReasonsID,300,SUSER_SNAME(),GETDATE(),null,null)
End