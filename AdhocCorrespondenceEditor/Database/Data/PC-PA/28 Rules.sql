Go
Declare @ClientRule int = (Select RuleGroupId from RuleGroup where RuleGroupName='ClientRule')
Declare @RuleName varchar = 'PC_PA_SwithchDocumentVisibility'
IF NOT EXISTS (SELECT * from [Rule] where RuleName = @RuleName)
INSERT INTO [dbo].[Rule]
           ([RuleName]
           ,[RuleNameSpace]
           ,[RuleMethod]
		   ,[RuleGroupId]
           ,[ExecutionOrder]
           ,[EffectiveDate]
           ,[ExpirationDate]
           ,[CreatedBy]
           ,[CreatedDateTime]
           ,[UpdatedBy]
           ,[UpdatedDateTime])
     VALUES
           (@RuleName
           ,'AdhocCorrespondenceEditor.Client.PCPAUiRule'
           ,'FilterDocuments'
		   ,@ClientRule
           ,1
        ,DATEADD(YEAR,-1,GETDATE())
		,DATEADD(YEAR,90,GETDATE())
		,SUSER_SNAME()
		,GETDATE()
		,null
		,null)

declare @RuleId int = (select RuleId from [Rule] where RuleName = @RuleName)
declare @LOBId int = (select LOBId from LOB where LOBName = 'PC-PA')
declare @CategoryId int = (select CategoryId from Category where CategoryName = 'PL_GENERAL_AUTO')



IF NOT EXISTS (SELECT * from [RuleItem] where RuleId = @RuleId and CategoryId = @CategoryId and LobId=@LOBId)
INSERT INTO [dbo].[RuleItem] (RuleId,LobId,CategoryId,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
VALUES 
(@RuleId,@LOBId ,@CategoryId ,SUSER_SNAME(),GETDATE(),null,null)


