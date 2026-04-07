Go

Declare @DocTypeList varchar(50) = 'docTypeList'
Declare @includeReason varchar(50) =  'includeReason'
Declare @excludeReason varchar(50) =  'excludeCategorys'
Declare @lobID int =(select LOBId from LOB where LOBName = 'WCC')
Declare @documentID1  int =  (select DocumentID from Document where DocumentName = 'HIPAA Signed Rxst Records')

IF EXISTS (SELECT * from [Configuration] where ConfigKey = @DocTypeList and DocumentId = @documentID1)
return
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime],[DocumentId])
     VALUES
	 (@lobid,@DocTypeList,@includeReason,SYSTEM_USER,SYSDATETIME(),@documentID1),
	 (@lobid,@excludeReason,'WCC,Custom Letter,Medical Utilization,NY Forms,PA Forms',SYSTEM_USER,SYSDATETIME(),null)

IF EXISTS (SELECT * from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @DocTypeList and DocumentId = @documentID1)
return
 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(@documentID1,@lobID,@includeReason,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare @ReasonsID integer
Select @ReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @includeReason and DocumentId = @documentID1
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Adjuster','Adjuster',@ReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Legal','Legal',@ReasonsID,200,SUSER_SNAME(),GETDATE(),null,null)


