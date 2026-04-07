Go
Declare @AddedPIPs varchar(50) = 'AddedPIPs'
Declare @lobID int =(select LOBId from LOB where LOBName = 'PC-PA')
Declare @documentID1  int =  (select DocumentID from Document where DocumentName = 'Added PIP Listed on Policy')
IF EXISTS (SELECT * from [Configuration] where ConfigKey = 'reasonList' and DocumentID = @documentID1)
return
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime],[DocumentId])
     VALUES
	 (@lobid,'reasonList',@AddedPIPs,SYSTEM_USER,SYSDATETIME(),@documentID1)
 
 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(@documentID1,@lobID,@AddedPIPs,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare  @ReasonsID int  = (Select DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @AddedPIPs and DocumentId = @documentID1)
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,InspireTag,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Higher Limits Not Selected','Higher Limits Not Selected','HIGHER_LMT_NOT_SELECT_IND',@ReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Individual Has Other Insurance','Individual Has Other Insurance','OTHER_INS_IND',@ReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Have PIP Medical Expense Only','Have PIP Medical Expense Only','PIP_MED_EXP_IND',@ReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),
('Not Resident Relative','Not Resident Relative','NON_REL_RESIDENT_IND',@ReasonsID,400,SUSER_SNAME(),GETDATE(),null,null)





