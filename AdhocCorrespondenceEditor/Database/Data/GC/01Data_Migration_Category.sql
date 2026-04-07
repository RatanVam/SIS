if not exists (select * from Category where CategoryName like 'GC_%')
Insert into [dbo].[Category] (CategoryName,CategoryFriendlyName,IsCategoryActive,
CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
('GC_HOMEOWNERS','Homeowners',1,SUSER_SNAME(),GETDATE(),null,null),
('GC_PROPERTY_DAMAGE','Property Damage',1,SUSER_SNAME(),GETDATE(),null,null),
('GC_PIP','PIP',1,SUSER_SNAME(),GETDATE(),null,null),
('GC_SUBROGATION','Subrogation',1,SUSER_SNAME(),GETDATE(),null,null),
('GC_BODILY_INJURY','Bodily Injury',1,SUSER_SNAME(),GETDATE(),null,null),
('GC_GENERAL','General',1,SUSER_SNAME(),GETDATE(),null,null),
('GC_SALVAGE','Salvage',1,SUSER_SNAME(),GETDATE(),null,null),
('GC_FORMS','Forms',1,SUSER_SNAME(),GETDATE(),null,null),
('GC_LEGAL','Legal',1,SUSER_SNAME(),GETDATE(),null,null),
('GC_SUBPOENA','Subpoena',1,SUSER_SNAME(),GETDATE(),null,null),
('GC_RELEASES','Releases',1,SUSER_SNAME(),GETDATE(),null,null),
('GC_FIRST_NOTICE_OF_LOSS','First Notice of Loss',1,SUSER_SNAME(),GETDATE(),null,null),
('GC_ENVIRONMENTAL','Environmental',1,SUSER_SNAME(),GETDATE(),null,null),
('GC_MEMO','Memo',1,SUSER_SNAME(),GETDATE(),null,null),
('GC_BLANK_LETTER_TEMPLATES','Blank Letter Templates',1,SUSER_SNAME(),GETDATE(),null,null)
go

Declare @LobIdGC int = (Select lobId from dbo.LOB where LOBName='GC')
Declare @cat_GC_HOMEOWNERS int = (
Select CategoryId from [dbo].[Category] where CategoryName='GC_HOMEOWNERS')
Declare @cat_GC_PROPERTY_DAMAGE int = (
Select CategoryId from [dbo].[Category] where CategoryName='GC_PROPERTY_DAMAGE')
Declare @cat_GC_PIP int = (
Select CategoryId from [dbo].[Category] where CategoryName='GC_PIP')
Declare @cat_GC_SUBROGATION int = (
Select CategoryId from [dbo].[Category] where CategoryName='GC_SUBROGATION')
Declare @cat_GC_BODILY_INJURY int = (
Select CategoryId from [dbo].[Category] where CategoryName='GC_BODILY_INJURY')
Declare @cat_GC_GENERAL int = (
Select CategoryId from [dbo].[Category] where CategoryName='GC_GENERAL')
Declare @cat_GC_SALVAGE int = (
Select CategoryId from [dbo].[Category] where CategoryName='GC_SALVAGE')
Declare @cat_GC_FORMS int = (
Select CategoryId from [dbo].[Category] where CategoryName='GC_FORMS')
Declare @cat_GC_LEGAL int = (
Select CategoryId from [dbo].[Category] where CategoryName='GC_LEGAL')
Declare @cat_GC_SUBPOENA int = (
Select CategoryId from [dbo].[Category] where CategoryName='GC_SUBPOENA')
Declare @cat_GC_RELEASES int = (
Select CategoryId from [dbo].[Category] where CategoryName='GC_RELEASES')
Declare @cat_GC_FIRST_NOTICE_OF_LOSS int = (
Select CategoryId from [dbo].[Category] where CategoryName='GC_FIRST_NOTICE_OF_LOSS')
Declare @cat_GC_ENVIRONMENTAL int = (
Select CategoryId from [dbo].[Category] where CategoryName='GC_ENVIRONMENTAL')
Declare @cat_GC_MEMO int = (
Select CategoryId from [dbo].[Category] where CategoryName='GC_MEMO')
Declare @cat_GC_BLANK_LETTER_TEMPLATES int = (
Select CategoryId from [dbo].[Category] where CategoryName='GC_BLANK_LETTER_TEMPLATES')

declare @Perminssions varchar(200);
IF @@SERVERNAME = 'SQLP09AGBUS9,54931'
set @Perminssions='Inspire_ACE_Prod,Inspire_CNSLT_GC,Inspire_General_Claims'
else
set @Perminssions = 'Inspire_ACE_NonProd,Inspire_Dev_Users,Inspire_Developers,Inspire_CNSLT_GC,Inspire_General_Claims'

if not exists (select * from LOBCategory where LOBId = @LobIdGC)
INSERT INTO [dbo].[LOBCategory]
	  ([LOBId]
      ,[CategoryId]
      ,[CategoryOrder]
	  ,[CategoryGroups]
	  ,[EffectiveDate]
	  ,[ExpirationDate]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[UpdatedBy]
      ,[UpdatedDateTime])

  VALUES
(@LobIdGC,@cat_GC_HOMEOWNERS,10,@Perminssions,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
(@LobIdGC,@cat_GC_PROPERTY_DAMAGE,20,@Perminssions,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
(@LobIdGC,@cat_GC_PIP,30,@Perminssions,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
(@LobIdGC,@cat_GC_SUBROGATION,40,@Perminssions,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
(@LobIdGC,@cat_GC_BODILY_INJURY,50,@Perminssions,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
(@LobIdGC,@cat_GC_GENERAL,60,@Perminssions,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
(@LobIdGC,@cat_GC_SALVAGE,70,@Perminssions,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
(@LobIdGC,@cat_GC_FORMS,80,@Perminssions,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
(@LobIdGC,@cat_GC_LEGAL,90,@Perminssions,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
(@LobIdGC,@cat_GC_SUBPOENA,100,@Perminssions,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
(@LobIdGC,@cat_GC_RELEASES,110,@Perminssions,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
(@LobIdGC,@cat_GC_FIRST_NOTICE_OF_LOSS,120,@Perminssions,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
(@LobIdGC,@cat_GC_ENVIRONMENTAL,130,@Perminssions,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
(@LobIdGC,@cat_GC_MEMO,140,@Perminssions,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null),
(@LobIdGC,@cat_GC_BLANK_LETTER_TEMPLATES,150,@Perminssions,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()), SUSER_SNAME(),GETDATE(),null,null)

Go