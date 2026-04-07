Declare @lobID int
select @lobID =  LOBId from LOB where LOBName = 'GC'
Declare @doc_Setlmt_repair_Agree int = (select documentId from Document where DocumentName='Setlmt Repair Agree Amt')
Declare @doc_Insd int = (select documentId from Document where DocumentName='Insd Incident Report')
Declare @doc_Setlmt_repair_est int = (select documentId from Document where DocumentName='Settlement Repair Estimate No AP')
Declare @doc_Damage_Ltr int = (select documentId from Document where DocumentName='Damage Ltr')


-------------GC_AllowedVehicleStates---------------
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'GC_AllowedVehicleStates')
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'GC_AllowedVehicleStates','MD,CT',SYSTEM_USER,SYSDATETIME())
End
-------------GC_SupportedSelectedStates---------------
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'GC_SupportedSelectedStates')
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'GC_SupportedSelectedStates','PA;NJ;NY;CT;MD;DE',SYSTEM_USER,SYSDATETIME())
End
-------------GC_AllowedPolicyTypeForHO---------------
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'GC_AllowedPolicyTypeForHO')
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'GC_AllowedPolicyTypeForHO','CommercialPackagePolicy',SYSTEM_USER,SYSDATETIME())
End
-------------GC_AllowedPolicyType---------------
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'GC_AllowedPolicyTypes')
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'GC_AllowedPolicyTypes','PersonalAuto,BusinessAuto,Truckers,MotorCarriers',SYSTEM_USER,SYSDATETIME())
End
-------------GC_DocumentsExcludedByPolicyType--------------
IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'GC_DocumentsExcludedByPolicyType')
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'GC_DocumentsExcludedByPolicyType',CONCAT(@doc_Insd,',',@doc_Setlmt_repair_Agree,',',@doc_Setlmt_repair_est,',',@doc_Damage_Ltr),SYSTEM_USER,SYSDATETIME())
End

declare @cat_GC_Property_damage int = (select CategoryId from Category where CategoryName='GC_Property_Damage')
declare @cat_GC_Homeowners int = (select CategoryId from Category where CategoryName='GC_Homeowners')
Declare @ClientRule int = (Select RuleGroupId from RuleGroup where RuleGroupName='ClientRule')
Declare @RuleName varchar(50) = 'GC_SetDocumentVisibility_PolType'

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
           ,'AdhocCorrespondenceEditor.Client.GC_SetDocumentVisibility_PolType_Rule'
           ,'FilterDocuments'
		   ,@ClientRule
           ,2
        ,DATEADD(YEAR,-1,GETDATE())
		,DATEADD(YEAR,90,GETDATE())
		,SUSER_SNAME()
		,GETDATE()
		,null
		,null)

declare @RuleId int = (select RuleId from [Rule] where RuleName = @RuleName)

IF NOT EXISTS (SELECT * from [RuleItem] where RuleId = @RuleId and LobId=@LOBId)
INSERT INTO [dbo].[RuleItem] (RuleId,LobId,CategoryId,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
VALUES 
(@RuleId,@LOBId ,null ,SUSER_SNAME(),GETDATE(),null,null)

set @RuleName = 'GC_SetDocumentVisibility_HO'

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
           ,'AdhocCorrespondenceEditor.Client.GC_SetDocumentVisibility_HO_Rule'
           ,'FilterDocuments'
		   ,@ClientRule
           ,1
        ,DATEADD(YEAR,-1,GETDATE())
		,DATEADD(YEAR,90,GETDATE())
		,SUSER_SNAME()
		,GETDATE()
		,null
		,null)

Set @RuleId = (select RuleId from [Rule] where RuleName = @RuleName)

IF NOT EXISTS (SELECT * from [RuleItem] where RuleId = @RuleId and LobId=@LOBId and CategoryId = @cat_GC_Homeowners)
INSERT INTO [dbo].[RuleItem] (RuleId,LobId,CategoryId,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
VALUES 
(@RuleId,@LOBId ,@cat_GC_Homeowners ,SUSER_SNAME(),GETDATE(),null,null)



set @RuleName = 'GC_SetDocumentVisibility_PropDamage'

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
           ,'AdhocCorrespondenceEditor.Client.GC_SetDocumentVisibility_PropDamage_Rule'
           ,'FilterDocuments'
		   ,@ClientRule
           ,1
        ,DATEADD(YEAR,-1,GETDATE())
		,DATEADD(YEAR,90,GETDATE())
		,SUSER_SNAME()
		,GETDATE()
		,null
		,null)

Set @RuleId = (select RuleId from [Rule] where RuleName = @RuleName)

IF NOT EXISTS (SELECT * from [RuleItem] where RuleId = @RuleId and LobId=@LOBId and CategoryId = @cat_GC_Property_damage)
INSERT INTO [dbo].[RuleItem] (RuleId,LobId,CategoryId,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
VALUES 
(@RuleId,@LOBId ,@cat_GC_Property_damage ,SUSER_SNAME(),GETDATE(),null,null)





