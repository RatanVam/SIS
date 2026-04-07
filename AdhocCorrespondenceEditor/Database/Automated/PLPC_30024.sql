
--==============UPDATE=======Ineligible Vehicle - Need to rename this value to Other Ineligible Vehicle

DECLARE @Configvalue varchar(200) = (select Configvalue  from Configuration where Configkey = 'reasonlist'
and documentid in (select documentid from document where DocumentFriendlyName = 'Notice of Nonrenewal-Auto'))

DECLARE @DocumentDropdownLookupTypeId int = (select DocumentDropdownLookupTypeId from [dbo].[DocumentDropdownLookupType] 
where DocumentDropdownLookupTypeCode =@Configvalue
and DocumentId in ( select documentid from document where DocumentFriendlyName = 'Notice of Nonrenewal-Auto'))

UPDATE  [dbo].[DocumentDropdownLookupItem] 
set DocumentDropdownLookupItemCode = 'Other - Ineligible Vehicles', DocumentDropdownLookupItemValue = 'Other - Ineligible Vehicles' 
where DocumentDropdownLookupItemCode ='Other Ineligible Vehicles' and DocumentDropdownLookupItemTypeId = @DocumentDropdownLookupTypeId
Go

--========== DELETE=========Gray Market Vehicle - Need to remove this value from DB
DECLARE @Configvalue varchar(200) = (select Configvalue  from Configuration where Configkey = 'reasonlist'
and documentid in (select documentid from document where DocumentFriendlyName = 'Notice of Nonrenewal-Auto'))

DECLARE @DocumentDropdownLookupTypeId int = (select DocumentDropdownLookupTypeId from [dbo].[DocumentDropdownLookupType] 
where DocumentDropdownLookupTypeCode =@Configvalue
and DocumentId in ( select documentid from document where DocumentFriendlyName = 'Notice of Nonrenewal-Auto'))

declare @DocumentDropdownLookupitemid int = (select DocumentDropdownLookupitemid from [dbo].[DocumentDropdownLookupItem] where 
DocumentDropdownLookupItemvalue = 'Gray Market Vehicle' and DocumentDropdownLookupItemTypeId=@DocumentDropdownLookupTypeId)

Delete from dbo.DocumentDropdownChildControl where DocumentDropdownLookupItemid = @DocumentDropdownLookupitemid
Delete from dbo.DocumentDropdownLookupItem where DocumentDropdownLookupItemid = @DocumentDropdownLookupitemid
GO

