Go
Declare @lobID integer
select @lobID =  LOBId from LOB where LOBName = 'PC-UMB'
Declare @AdverseDataSourc varchar(50) = 'AdverseDataSourc'
Declare @documentID int = -999 
Declare @mvrVisible varchar(50) = 'mvrVisible'
Declare @hideControl varchar(50) = 'hideControl'
Declare @DocID1 int,@DocID2 int,@DocID3 int
select @DocID1 =  DocumentID from Document where [DocumentName] = 'OH Notice of Nonrenewal-UMB'
select @DocID2 =  DocumentID from Document where [DocumentName] = 'OH Midterm Cancellation-UMB'
IF EXISTS (SELECT * from Configuration where ConfigKey = @AdverseDataSourc and ConfigValue = @AdverseDataSourc  and  LOBId = @lobID)
return
------------------start of UMB LOBS ---------------
INSERT [dbo].[Configuration] ([LOBId],[ConfigKey]
         ,[ConfigValue]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES
(@lobID,@AdverseDataSourc,@AdverseDataSourc,SUSER_SNAME(),GETDATE(),null,null)

INSERT [dbo].[Configuration] ([LOBId],[DocumentId]
		,[ConfigKey]
         ,[ConfigValue]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES
(@lobID,@DocID1,@mvrVisible,'True',SUSER_SNAME(),GETDATE(),null,null),
(@lobID,@DocID2,@hideControl,'True',SUSER_SNAME(),GETDATE(),null,null),
(@lobID,@DocID1,@hideControl,'True',SUSER_SNAME(),GETDATE(),null,null)

------------------End of otehr UMB LOB ---------------



select @lobID =  LOBId from LOB where LOBName = 'PC-PA'
Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(@documentID,@lobID,@AdverseDataSourc,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare @AdverseDataSourcID integer
Select @AdverseDataSourcID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @AdverseDataSourc and LobId = @lobID
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('MVR','MVR',@AdverseDataSourcID,100,SUSER_SNAME(),GETDATE(),null,null),
('CLUE','CLUE',@AdverseDataSourcID,200,SUSER_SNAME(),GETDATE(),null,null),
('NJM','NJM',@AdverseDataSourcID,300,SUSER_SNAME(),GETDATE(),null,null),
('CUST','CUST',@AdverseDataSourcID,400,SUSER_SNAME(),GETDATE(),null,null)


INSERT [dbo].[Configuration] ([LOBId],[ConfigKey]
         ,[ConfigValue]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES
(@lobID,@AdverseDataSourc,@AdverseDataSourc,SUSER_SNAME(),GETDATE(),null,null)

Declare @LetterID1 int, @LetterID2 int, @LetterID3 int, @LetterID4 int, @LetterID5 int, @LetterID6 int, @LetterID7 int
Declare @Letter1 varchar(50) = 'Future Termination Ltr-Auto'
Declare @Letter2 varchar(50) = 'Midterm Cancel'
Declare @Letter3 varchar(50) = 'Notice of Nonrenewal-Auto'
Declare @Letter4 varchar(50) = 'OH Notice of Nonrenewal-Auto'
Declare @Letter5 varchar(50) = 'OH NB 90 Day Decline-Cancel'
Declare @Letter6 varchar(50) = 'CT Notice of Nonrenewal-Auto'
Declare @Letter7 varchar(50) = 'MD Notice of Nonrenewal'


select @LetterID1 =  DocumentID from Document where [DocumentName] = @Letter1
select @LetterID2 =  DocumentID from Document where [DocumentName] = @Letter2
select @LetterID3 =  DocumentID from Document where [DocumentName] = @Letter3
select @LetterID4 =  DocumentID from Document where [DocumentName] = @Letter4
select @LetterID5 =  DocumentID from Document where [DocumentName] = @Letter5
select @LetterID6 =  DocumentID from Document where [DocumentName] = @Letter6
select @LetterID7 =  DocumentID from Document where [DocumentName] = @Letter7

INSERT [dbo].[Configuration] ([DocumentId],[LOBId],
[ConfigKey]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES
(@LetterID1,@lobID,@AdverseDataSourc,SUSER_SNAME(),GETDATE(),null,null),
(@LetterID2,@lobID,@AdverseDataSourc,SUSER_SNAME(),GETDATE(),null,null),
(@LetterID3,@lobID,@AdverseDataSourc,SUSER_SNAME(),GETDATE(),null,null),
(@LetterID4,@lobID,@AdverseDataSourc,SUSER_SNAME(),GETDATE(),null,null)

INSERT [dbo].[Configuration] ([LOBId],[DocumentId]
		,[ConfigKey]
         ,[ConfigValue]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES
(@lobID,@LetterID4,@hideControl,'True',SUSER_SNAME(),GETDATE(),null,null),
(@lobID,@LetterID5,@hideControl,'True',SUSER_SNAME(),GETDATE(),null,null),
(@lobID,@LetterID6,@hideControl,'True',SUSER_SNAME(),GETDATE(),null,null),
(@lobID,@LetterID7,@hideControl,'True',SUSER_SNAME(),GETDATE(),null,null)