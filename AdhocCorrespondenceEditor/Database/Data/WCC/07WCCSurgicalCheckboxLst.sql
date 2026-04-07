Go

Declare @reasonsSurgicalWCC varchar(50) = 'reasonsSurgicalWCC'

Declare @lobID int =(select LOBId from LOB where LOBName = 'WCC')

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = @reasonsSurgicalWCC )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,@reasonsSurgicalWCC,@reasonsSurgicalWCC,SYSTEM_USER,SYSDATETIME())
End
IF NOT EXISTS (SELECT * from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonsSurgicalWCC )
begin
 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(-999,@lobID,@reasonsSurgicalWCC,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare @ReasonsID integer
Select @ReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonsSurgicalWCC
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,InspireTag,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Not clinically supported as medically necessary','Not clinically supported as medically necessary','NOT_CLINIC_SUP_MED_NECESSARY',@ReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Not in accordance with accepted standards','Not in accordance with accepted standards','NOT_ACCORD_ACCEPT_STD',@ReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Denied as non compensable','Denied as non compensable','DENIED_NON_COMPENSABLE',@ReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),
('Not causally related','Not causally related','NOT_CAUSALLY_REL',@ReasonsID,400,SUSER_SNAME(),GETDATE(),null,null),
('Decision pending IME/DME','Decision pending IME/DME','DECISION_PEND_IME',@ReasonsID,500,SUSER_SNAME(),GETDATE(),null,null),
('Decision pending second opinion','Decision pending second opinion','DECISION_PEND_SEC_OPINION',@ReasonsID,600,SUSER_SNAME(),GETDATE(),null,null),
('Lack of updated medical documentation','Lack of updated medical documentation','LACK_UPDATED_MED_DOC',@ReasonsID,700,SUSER_SNAME(),GETDATE(),null,null),
('Lack of conservative care to support medical necessity','Lack of conservative care to support medical necessity','LACK_CONSERV_CARE_SUP_MED_NECESSITY',@ReasonsID,800,SUSER_SNAME(),GETDATE(),null,null)

End