Go
Declare @CsfEffective varchar(50) = 'CsfEffective'
Declare @CsfBlankPreFilled varchar(50) = 'CsfBlankPreFilled'
Declare @lobID int =(select LOBId from LOB where LOBName = 'PC-PA')
Declare @documentID1  int =  (select DocumentID from Document where DocumentName = 'NJM NJ Standard CSF')
IF EXISTS (SELECT * from [Configuration] where ConfigKey = 'reasonListCsfEffective' and DocumentID = @documentID1)
return
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime],[DocumentId])
     VALUES
	 (@lobid,'reasonListCsfEffective',@CsfEffective,SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'reasonListBlankPreFilled',@CsfBlankPreFilled,SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,'New Policy','True',SYSTEM_USER,SYSDATETIME(),@documentID1)
 
 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(@documentID1,@lobID,@CsfEffective,null,null,SUSER_SNAME(),GETDATE(),null,null),
(@documentID1,@lobID,@CsfBlankPreFilled,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare  @ReasonsID int  = (Select DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @CsfEffective and DocumentId = @documentID1)
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('New Policy','N',@ReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Mid-Term Change','M',@ReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Renewal Change','R',@ReasonsID,300,SUSER_SNAME(),GETDATE(),null,null)

Declare  @ReasonsID1 int  =(Select DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @CsfBlankPreFilled and DocumentId = @documentID1)
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('CSF Blank','Blank',@ReasonsID1,100,SUSER_SNAME(),GETDATE(),null,null),
('Pre-Filled','Pre-Filled',@ReasonsID1,200,SUSER_SNAME(),GETDATE(),null,null)