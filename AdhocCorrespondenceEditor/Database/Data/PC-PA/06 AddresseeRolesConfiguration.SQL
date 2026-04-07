Go
declare @lobPA int
Select @lobPA=  lobId from dbo.LOB where LOBName='PC-PA'

IF EXISTS (SELECT * from Configuration where ConfigKey = 'OtherNamedInsured' and LOBId = @lobPA)
return

INSERT [dbo].[Configuration] ([LOBId],
          [ConfigKey]
         ,[ConfigValue]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES
(@lobPA,'PLFirstAddresseeInformationRoles','Primary Named Insured,Secondary Named Insured,Spouse,Broker,Executor Executrix,Guardian,ThirdParty,Trust,Trustee,Additional Interest,Certificate Of Insurance Holder,Power Of Attorney',SUSER_SNAME(),GETDATE(),null,null),
(@lobPA,'SecondaryNamedInsured ','Secondary Named Insured',SUSER_SNAME(),GETDATE(),null,null),
(@lobPA,'OtherNamedInsured',null,SUSER_SNAME(),GETDATE(),null,null)

--------For all other LOB's-------------------
INSERT [dbo].[Configuration] (
          [ConfigKey]
         ,[ConfigValue]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])
VALUES

('PLFirstAddresseeInformationRoles','Primary Named Insured,Secondary Named Insured,AdditionalInsured,HO Interested Party,HO Named Insured,Other Named Insured,PUP Interested Party,Spouse,Broker,Executor Executrix,Guardian,ThirdParty,Trust,Trustee,Power Of Attorney,Additional Interest,Household Member,Additional Named Insured',SUSER_SNAME(),GETDATE(),null,null),
('SecondaryNamedInsured ','Secondary Named Insured',SUSER_SNAME(),GETDATE(),null,null),
('OtherNamedInsured', 'Other Named Insured',SUSER_SNAME(),GETDATE(),null,null)
