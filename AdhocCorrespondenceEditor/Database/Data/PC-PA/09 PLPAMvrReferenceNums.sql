Go
Declare @lobID integer
select @lobID =  LOBId from LOB where LOBName = 'PC-PA'
Declare @DocID1 int,@DocID2 int,@DocID3 int, @DocID4 int,@DocID5 int,@DocID6 int,@DocID7 int
select @DocID1 =  DocumentID from Document where [DocumentName] = 'CT Notice of Nonrenewal-Auto'
select @DocID2 =  DocumentID from Document where [DocumentName] = 'OH NB 90 Day Decline-Cancel'
select @DocID3 =  DocumentID from Document where [DocumentName] = 'OH Notice of Nonrenewal-Auto'
select @DocID4 =  DocumentID from Document where [DocumentName] = 'MD Notice of Nonrenewal'
select @DocID5 =  DocumentID from Document where [DocumentName] = 'MD Midterm Cancel'
Declare @HideMVRReferenceControl varchar(50) = 'hideMVRReferenceControl'

IF EXISTS (SELECT * from [Configuration] where ConfigKey = @HideMVRReferenceControl and [ConfigValue] = 'True' and DocumentID = @DocID1)
return
INSERT [dbo].[Configuration] ([LOBId],[DocumentId]
		,[ConfigKey]
         ,[ConfigValue]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES
(@lobID,@DocID1,@HideMVRReferenceControl,'True',SUSER_SNAME(),GETDATE(),null,null),
(@lobID,@DocID2,@HideMVRReferenceControl,'True',SUSER_SNAME(),GETDATE(),null,null),
(@lobID,@DocID3,@HideMVRReferenceControl,'True',SUSER_SNAME(),GETDATE(),null,null),
(@lobID,@DocID4,@HideMVRReferenceControl,'True',SUSER_SNAME(),GETDATE(),null,null),
(@lobID,@DocID5,@HideMVRReferenceControl,'True',SUSER_SNAME(),GETDATE(),null,null)
