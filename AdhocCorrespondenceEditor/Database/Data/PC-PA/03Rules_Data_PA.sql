
-- Rules data for ACE

-- LOB: PC- UMB
declare @RuleGroupId int
select @RuleGroupId = RuleGroupId from [dbo].[RuleGroup] where RuleGroupName='BusinessRule'

IF NOT EXISTS ( SELECT 1 FROM [dbo].[Rule] WHERE RuleName = 'PC_PA_OnBaseKeyword1' )
BEGIN

INSERT INTO [dbo].[Rule] ([RuleName],[RuleNameSpace],[RuleMethod],[ExecutionOrder],[EffectiveDate],[ExpirationDate],CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime,RuleGroupId)
VALUES 

('PC_PA_OnBaseKeyword1', 'AdhocCorrespondenceEditor.Client.PCPAOnbaseRule','OnBaseKeyword1',1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@RuleGroupId),
('PC_PA_OnBaseKeyword2', 'AdhocCorrespondenceEditor.Client.PCPAOnbaseRule','OnBaseKeyword2',1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@RuleGroupId),
('PC_PA_OnBaseKeyword3', 'AdhocCorrespondenceEditor.Client.PCPAOnbaseRule','OnBaseKeyword3',1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@RuleGroupId),
('PC_PA_OnBaseKeyword4', 'AdhocCorrespondenceEditor.Client.PCPAOnbaseRule','OnBaseKeyword4',1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@RuleGroupId),
('PC_PA_OnBaseKeyword5', 'AdhocCorrespondenceEditor.Client.PCPAOnbaseRule','OnBaseKeyword5',1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null,@RuleGroupId)
END

declare @lobUMB int, @ruleId1 int,@ruleId2 int,@ruleId3 int,@ruleId4 int,@ruleId5 int
Select @lobUMB=  lobId from dbo.LOB where LOBName='PC-PA'


declare @docId int


Select @ruleId1=  RuleId from dbo.[Rule]  where RuleName='PC_PA_OnBaseKeyword1'
Select @ruleId2=  RuleId from dbo.[Rule]  where RuleName='PC_PA_OnBaseKeyword2'
Select @ruleId3=  RuleId from dbo.[Rule]  where RuleName='PC_PA_OnBaseKeyword3'
Select @ruleId4=  RuleId from dbo.[Rule]  where RuleName='PC_PA_OnBaseKeyword4'
Select @ruleId5=  RuleId from dbo.[Rule]  where RuleName='PC_PA_OnBaseKeyword5'


IF NOT EXISTS ( SELECT 1 FROM [dbo].[RuleItem] WHERE LobId = @lobUMB )
BEGIN

INSERT INTO [dbo].[RuleItem] (RuleId,LobId,CategoryId, DocumentId,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
VALUES 

(@ruleId1,@lobUMB ,null ,'-999',SUSER_SNAME(),GETDATE(),null,null),
(@ruleId2,@lobUMB ,null ,'-999',SUSER_SNAME(),GETDATE(),null,null),
(@ruleId3,@lobUMB ,null ,'-999',SUSER_SNAME(),GETDATE(),null,null),
(@ruleId4,@lobUMB ,null ,'-999',SUSER_SNAME(),GETDATE(),null,null),
(@ruleId5,@lobUMB ,null ,'-999',SUSER_SNAME(),GETDATE(),null,null)
END

declare @RuleItemId int
Select @RuleItemId=  RuleItemId  from dbo.RuleItem where RuleId=@ruleId3  AND DocumentId= -999

IF NOT EXISTS ( SELECT 1 FROM [dbo].[RuleLookup] WHERE RuleItemId = @RuleItemId )
BEGIN
INSERT INTO [dbo].[RuleLookup] (RuleItemId,LookupKey,LookupValue, CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
VALUES 
(@RuleItemId, 'OB3','AUTO',SUSER_SNAME(),GETDATE(),null,null)


Select @RuleItemId=  RuleItemId  from dbo.RuleItem where RuleId=@ruleId4 AND DocumentId= -999
INSERT INTO [dbo].[RuleLookup] (RuleItemId,LookupKey,LookupValue, CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
VALUES 
(@RuleItemId, 'OB4','OUTGOING',SUSER_SNAME(),GETDATE(),null,null)
END

