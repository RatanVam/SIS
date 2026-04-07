USE ACE

GO

-- Rules data for ACE

-- LOB: PC- UMB

INSERT INTO [dbo].[Rule] ([RuleName],[RuleNameSpace],[RuleMethod],[ExecutionOrder],[EffectiveDate],[ExpirationDate],CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
VALUES 

('PC_HO_OnBaseKeyword1', 'AdhocCorrespondenceEditor.Client.PCHOOnbaseRule','OnBaseKeyword1',1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
('PC_HO_OnBaseKeyword2', 'AdhocCorrespondenceEditor.Client.PCHOOnbaseRule','OnBaseKeyword2',1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
('PC_HO_OnBaseKeyword3', 'AdhocCorrespondenceEditor.Client.PCHOOnbaseRule','OnBaseKeyword3',1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
('PC_HO_OnBaseKeyword4', 'AdhocCorrespondenceEditor.Client.PCHOOnbaseRule','OnBaseKeyword4',1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
('PC_HO_OnBaseKeyword5', 'AdhocCorrespondenceEditor.Client.PCHOOnbaseRule','OnBaseKeyword5',1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)


declare @lobUMB int, @ruleId1 int,@ruleId2 int,@ruleId3 int,@ruleId4 int,@ruleId5 int
Select @lobUMB=  lobId from dbo.LOB where LOBName='PC-HO'


declare @docId int


Select @ruleId1=  RuleId from dbo.[Rule]  where RuleName='PC_HO_OnBaseKeyword1'
Select @ruleId2=  RuleId from dbo.[Rule]  where RuleName='PC_HO_OnBaseKeyword2'
Select @ruleId3=  RuleId from dbo.[Rule]  where RuleName='PC_HO_OnBaseKeyword3'
Select @ruleId4=  RuleId from dbo.[Rule]  where RuleName='PC_HO_OnBaseKeyword4'
Select @ruleId5=  RuleId from dbo.[Rule]  where RuleName='PC_HO_OnBaseKeyword5'


INSERT INTO [dbo].[RuleItem] (RuleId,LobId,CategoryId, DocumentId,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
VALUES 

(@ruleId1,@lobUMB ,null ,'-999',SUSER_SNAME(),GETDATE(),null,null),
(@ruleId2,@lobUMB ,null ,'-999',SUSER_SNAME(),GETDATE(),null,null),
(@ruleId3,@lobUMB ,null ,'-999',SUSER_SNAME(),GETDATE(),null,null),
(@ruleId4,@lobUMB ,null ,'-999',SUSER_SNAME(),GETDATE(),null,null),
(@ruleId5,@lobUMB ,null ,'-999',SUSER_SNAME(),GETDATE(),null,null)


declare @RuleItemId int

Select @RuleItemId=  RuleItemId  from dbo.RuleItem where RuleId=@ruleId3  AND DocumentId= -999

INSERT INTO [dbo].[RuleLookup] (RuleItemId,LookupKey,LookupValue, CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
VALUES 
(@RuleItemId, 'OB3','HOME',SUSER_SNAME(),GETDATE(),null,null)


Select @RuleItemId=  RuleItemId  from dbo.RuleItem where RuleId=@ruleId4 AND DocumentId= -999
INSERT INTO [dbo].[RuleLookup] (RuleItemId,LookupKey,LookupValue, CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
VALUES 
(@RuleItemId, 'OB4','OUTGOING',SUSER_SNAME(),GETDATE(),null,null)


declare @id int
select  @id= RuleGroupId from [dbo].[RuleGroup] where RuleGroupName='BusinessRule'
Update [dbo].[Rule]
set RuleGroupId = @id
