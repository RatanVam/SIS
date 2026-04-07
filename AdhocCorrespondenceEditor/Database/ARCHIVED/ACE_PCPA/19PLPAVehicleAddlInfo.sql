Go
Declare @reasonVehicleOptionList varchar(50) = 'reasonVehicleOptionList'
Declare @lobID int =(select LOBId from LOB where LOBName = 'PC-PA')
IF EXISTS (SELECT * from [Configuration] where ConfigKey = @reasonVehicleOptionList and @lobID = @lobID)
return
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,@reasonVehicleOptionList,@reasonVehicleOptionList,SYSTEM_USER,SYSDATETIME())
 
 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(-999,@lobID,@reasonVehicleOptionList,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare  @ReasonsID int  = (Select DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonVehicleOptionList)
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('VIN','VinInd',@ReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Finance Company','FinanceCompanyInd',@ReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Lease Company','LeaseCompanyInd',@ReasonsID,300,SUSER_SNAME(),GETDATE(),null,null)

