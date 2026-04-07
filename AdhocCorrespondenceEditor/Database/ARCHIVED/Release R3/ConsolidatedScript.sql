
--SCRIPT TO INSERT ExposureDataSourc IN DocumentDropdownLookupType TABLE
Declare @lobID integer
select @lobID =  LOBId from LOB where LOBName = 'PC-PA'
Declare @documentID int = -999 
Declare @ExposureDataSourc varchar(50) = 'ExposureDataSourc'

IF NOT EXISTS ( SELECT * FROM [dbo].[DocumentDropdownLookupType] WHERE LobId = @lobID AND DocumentDropdownLookupTypeCode = @ExposureDataSourc )
BEGIN

INSERT INTO [dbo].[DocumentDropdownLookupType]
           ([DocumentId]
           ,[LobId]
           ,[DocumentDropdownLookupTypeCode]
           ,[DocumentDropdownLookupTypeLabelName]
           ,[DocumentDirection]
           ,[CreatedBy]
           ,[CreatedDateTime]
           ,[UpdatedBy]
           ,[UpdatedDateTime])
     VALUES
           (@documentID, @lobID,@ExposureDataSourc,null,null, SUSER_SNAME(), GETDATE(), null,null)       
          
 END   
 
GO
--script to populate Exposure Type dropdown 
Declare @lobID integer
select @lobID =  LOBId from LOB where LOBName = 'PC-PA'
Declare @ExposureDataSourcID integer
Select @ExposureDataSourcID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = 'ExposureDataSourc' and LobId = @lobID

IF NOT EXISTS(SELECT * FROM [dbo].[DocumentDropdownLookupItem] WHERE DocumentDropdownLookupItemTypeId = @ExposureDataSourcID AND 
DocumentDropdownLookupItemCode in ('BI','CO','CP','GL','ME','MP','OT','PD','PIP','RR','SL','TL','UM','UIM','UM/UIM''UIMPD'))
BEGIN

insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('BI','Bodily Injury (BI)',@ExposureDataSourcID,100,SUSER_SNAME(),GETDATE(),null,null),
('CO','Collision (CO)',@ExposureDataSourcID,200,SUSER_SNAME(),GETDATE(),null,null),
('CP','Comprehensive (CP)',@ExposureDataSourcID,300,SUSER_SNAME(),GETDATE(),null,null),
('GL','Glass (GL)',@ExposureDataSourcID,400,SUSER_SNAME(),GETDATE(),null,null),
('ME','Medical Expense (ME)',@ExposureDataSourcID,500,SUSER_SNAME(),GETDATE(),null,null),
('MP','Medical Payments (MP)',@ExposureDataSourcID,600,SUSER_SNAME(),GETDATE(),null,null),
('OT','Other (OT)',@ExposureDataSourcID,700,SUSER_SNAME(),GETDATE(),null,null),
('PD','Property Damage (PD)',@ExposureDataSourcID,800,SUSER_SNAME(),GETDATE(),null,null),
('PIP','Personal Injury Protection (PIP)',@ExposureDataSourcID,900,SUSER_SNAME(),GETDATE(),null,null),
('RR','Rental Reimbursement (RR)',@ExposureDataSourcID,1000,SUSER_SNAME(),GETDATE(),null,null),
('SL','Spousal Liability (SL)',@ExposureDataSourcID,1100,SUSER_SNAME(),GETDATE(),null,null),
('TL','Towing/Labor Charges (TL)',@ExposureDataSourcID,1200,SUSER_SNAME(),GETDATE(),null,null),
('UM','Uninsured Motorist (UM)',@ExposureDataSourcID,1300,SUSER_SNAME(),GETDATE(),null,null),
('UIM','Underinsured Motorist (UIM)',@ExposureDataSourcID,1400,SUSER_SNAME(),GETDATE(),null,null),
('UM/UIM','Uninsured/Underinsured Motorist (UM/UIM)',@ExposureDataSourcID,1500,SUSER_SNAME(),GETDATE(),null,null),
('UIMPD','Uninsured Motorist Property Damage',@ExposureDataSourcID,1600,SUSER_SNAME(),GETDATE(),null,null)

END

GO

--SCRIPT TO ADD CONFIGURATION KEYS RELATED TO ExposureDataSourc
Declare @lobID integer
Declare @ExposureDataSourc varchar(50) = 'ExposureDataSourc'
select @lobID =  LOBId from LOB where LOBName = 'PC-PA'
Declare @DocID1 int
Declare @LookupItemCode varchar(150)
select @DocID1 =  DocumentID from Document where [DocumentName] = 'CT Notice of Nonrenewal-Auto'

select @LookupItemCode =  DocumentDropdownLookupItemId  from [DocumentDropdownLookupItem] where 
DocumentDropdownLookupItemCode = 'Driving Record-At Fault Accidents' and 
DocumentDropdownLookupItemTypeId in (select DocumentDropdownLookupTypeId from [dbo].[DocumentDropdownLookupType] where 
DocumentId=@DocID1)
IF NOT EXISTS(SELECT * FROM [dbo].[Configuration] WHERE LOBId=@lobId AND ConfigKey=@ExposureDataSourc AND ConfigValue=@ExposureDataSourc)

BEGIN
INSERT [dbo].[Configuration] ([LOBId],[ConfigKey]
         ,[ConfigValue]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[DocumentId])
VALUES
(@lobID,@ExposureDataSourc,@ExposureDataSourc,SUSER_SNAME(),GETDATE(),null,null)

END 

IF NOT EXISTS(SELECT * FROM [dbo].[Configuration] WHERE LOBId=@lobId AND ConfigKey='DrivingRecordAtFaultAccidents' AND DocumentId=@DocID1)

BEGIN
INSERT [dbo].[Configuration] ([LOBId],[ConfigKey]
         ,[ConfigValue]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[DocumentId])
VALUES
(@lobID,'DrivingRecordAtFaultAccidents',@LookupItemCode,SUSER_SNAME(),GETDATE(),null,@DocID1)

END 

GO


--SCRIPT TO ADD CONTROL WHEN EXPOSURE TYPE SELECTED AS Other (OT)
IF NOT EXISTS(SELECT * FROM [dbo].[Control] WHERE ControlName='PCPAExpTypeChildControl' )
BEGIN 

INSERT [dbo].[Control]
(       [ControlName],[CreatedBy],[CreatedDateTime],[UpdatedBy],[UpdatedDateTime] )
	values 
('PCPAExpTypeChildControl',SUSER_SNAME(),GETDATE(),null,null)

END
GO

--SCRIPT TO ADD CHILD CONTROL WHEN EXPOSURE TYPE SELECTED AS Other (OT) AND FOR THE DOCUMENT

Declare @documentID  int =  (select DocumentID from Document where DocumentName = 'CT Notice of Nonrenewal-Auto')
Declare @controlID  int =  (select ControlId from Control WHERE ControlName='PCPAExpTypeChildControl')
Declare @DocumentDropdownLookupTypeId  int, @DocumentDropdownLookupItemId int
select @DocumentDropdownLookupTypeId= DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode='ExposureDataSourc'
select @DocumentDropdownLookupItemId=DocumentDropdownLookupItemId from [dbo].[DocumentDropdownLookupItem] where DocumentDropdownLookupItemCode='OT' and 
  DocumentDropdownLookupItemTypeId=@DocumentDropdownLookupTypeId
IF NOT EXISTS(SELECT * FROM [dbo].[DocumentDropdownChildControl] WHERE DocumentId= @documentID and DocumentDropdownLookupItemId= @DocumentDropdownLookupItemId
and ControlId=@controlID )
BEGIN 
INSERT [dbo].[DocumentDropdownChildControl](
		[DocumentId]
           ,[DocumentDropdownLookupItemId]
           ,[ControlId]
           ,[CreatedBy]
           ,[CreatedDateTime]
           ,[UpdatedBy]
           ,[UpdatedDateTime]) values 
(@documentID,@DocumentDropdownLookupItemId,@controlID,SUSER_SNAME(),GETDATE(),null,null)

END

GO