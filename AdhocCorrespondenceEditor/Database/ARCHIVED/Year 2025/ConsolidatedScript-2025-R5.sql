-- =============================================
-- Author:		Sandhya Kethineni
-- Create date: 09/16/2025
-- Description: Get Denial Reasons and Add denial reason control
-- =============================================

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'DenialReason')
BEGIN
create table dbo.DenialReason 
(
DenialReasonId int primary key identity(1,1),
DenialReasonKey varchar(50) not null,
DenialReasonValue varchar(50) not null,
CreatedBy varchar(50) not null,
CreatedDateTime smallDateTime not null,
UpdatedBy varchar(50) null,
UpdatedDateTime smallDateTime null
)
end

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'DenialReasonMap')
BEGIN
create table dbo.DenialReasonMap
(
DenialReasonMapId int primary key identity(1,1),
DenialReasonId int foreign key references DenialReason(DenialReasonId) not null,
PolicyState varchar(5),
PolicyForm varchar(20),
DocumentId int foreign key references Document(DocumentId) not null,
LOBId int foreign key references LOB(LOBId) not null,
DisplayOrder int not null,
CreatedBy varchar(50) not null,
CreatedDateTime smallDateTime not null,
UpdatedBy varchar(50) null,
UpdatedDateTime smallDateTime null
)
end
go

create or alter procedure dbo.GetDenialReasons
as
begin

select DenialReasonMapId, DenialReasonKey, DenialReasonValue, DocumentId,PolicyForm,PolicyState,LOBName
from DenialReasonMap dm join DenialReason d
on d.DenialReasonId = dm.DenialReasonId
join LOB l
on l.LOBId = dm.LOBId
order by DisplayOrder
end

go



if not exists(select 1 from Control where ControlName='GCDenialReason')
insert into dbo.Control(ControlName,CreatedBy,CreatedDateTime)
values('GCDenialReason', SUSER_SNAME(), GETDATE())


-- =============================================
-- Author:		Sandhya Kethineni
-- Create date: 09/16/2025
-- Description: Add document Reservation of Rights HO Mold
-- =============================================

declare @clientrule int =(select RuleGroupId from RuleGroup where RuleGroupName='ClientRule')
declare @catId int = (select CategoryId from Category where CategoryFriendlyName='Homeowners')
declare @lobId int = (select LobId from LOB where LOBName = 'GC')

if not exists (select * from dbo.Document where DocumentName='Reservation of Rights HO Mold')
insert into dbo.Document (BaseState, DocumentFriendlyName,DocumentName,DocumentOtherType,DocumentType,IsDocumentActive, JldFilePath,CreatedBy,CreatedDateTime)
values (null, 'Reservation of Rights HO Mold','Reservation of Rights HO Mold', null,'GCOM  Correspondence Out',1,'companyRoot:S:Production://Templates/GeneralClaims/Reservation of Rights HO Mold.jld',SUSER_SNAME(),GETDATE())

declare @docId int = (select  documentId from Document where DocumentName='Reservation of Rights HO Mold')

if not exists ( select * from dbo.CategoryDocument where CategoryId=@catId and DocumentId=@docId)
insert into dbo.CategoryDocument (CategoryId,DocumentId,DocumentOrder,EffectiveDate,ExpirationDate,CreatedDateTime,CreatedBy)
values (@catId,@docId,1,GETDATE(),DATEADD(year, 90, GETDATE()),GETDATE(),SUSER_SNAME())

declare @ctrl_GCExposureNameAndType int = (select ControlId from Control where controlName='GCExposureNameAndType')
declare @ctrl_GCAddrOneandTwowGreetingName int = (select ControlId from Control where controlName='GCAddrOneandTwowGreetingName')
declare @ctrl_GCAuthor int = (select ControlId from Control where controlName='GCAuthor')
declare @ctrl_GCReSection int = (select ControlId from Control where controlName='GCReSection')
declare @ctrl_SelectCommunicationSection int = (select ControlId from Control where controlName='SelectCommunicationSection')
declare @ctrl_GCBatchControls int = (select ControlId from Control where controlName='GCBatchControls')
declare @ctrl_PrinterDropdown int = (select ControlId from Control where controlName='PrinterDropdownwCheckbox')
declare @ctrl_WCCEmail int = (select ControlId from Control where controlName='WCCEmail')
declare @ctrl_ClaimsFax int = (select ControlId from Control where controlName='ClaimsFax')
declare @ctrl_ClaimsCcBcc int = (select ControlId from Control where controlName='ClaimsCcBcc')

if not exists(select * from dbo.DocumentControl where DocumentId = @docId )
insert into dbo.DocumentControl (ControlId,DocumentId,ControlOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
values (@ctrl_GCExposureNameAndType,@docId,100,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCAddrOneandTwowGreetingName,@docId,200,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCAuthor,@docId,300,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCReSection,@docId,400,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_SelectCommunicationSection,@docId,500,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCBatchControls,@docId,600,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_PrinterDropdown,@docId,700,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_WCCEmail,@docId,800,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_ClaimsFax,@docId,900,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_ClaimsCcBcc,@docId,1000,SUSER_SNAME(),GETDATE(),null,null)


if not exists (select * from dbo.[Rule] where RuleName = 'GC_SetDocumentVisibility_HO_DW')
insert into dbo.[Rule] (RuleName, RuleNameSpace, RuleMethod, RuleGroupId, ExecutionOrder , EffectiveDate, ExpirationDate, CreatedBy, CreatedDateTime)
values ('GC_SetDocumentVisibility_HO_DW','AdhocCorrespondenceEditor.Client.GC_SetDocumentVisibility_HO_DW_Rule','FilterDocuments',@clientrule,3, GETDATE(), DATEADD(year, 90,GETDATE()),SUSER_SNAME(),GETDATE())

declare @ruleId int = (select RuleId from dbo.[Rule] where RuleName = 'GC_SetDocumentVisibility_HO_DW') 

if not exists (select * from dbo.[RuleItem] where RuleId = @ruleId)
insert into dbo.[RuleItem] (CategoryId,DocumentId, LobId, RuleId, CreatedBy, CreatedDateTime)
values (null,-999,@lobId,@ruleid, SUSER_SNAME(), GETDATE())

declare @configvalue varchar(30) = (select configValue from Configuration where ConfigKey ='GC_DocumentsExcludedBy_HO_DW')
if exists (select configValue from Configuration where ConfigKey ='GC_DocumentsExcludedBy_HO_DW')
delete from  Configuration where ConfigKey ='GC_DocumentsExcludedBy_HO_DW'
insert into Configuration (ConfigKey,ConfigValue,LOBId,CreatedBy,CreatedDateTime) Values ('GC_DocumentsExcludedBy_HO_DW',  CAST(@docId as varchar), @lobId, SUSER_SNAME(),GETDATE())

Go
-- =============================================
-- Author:		Sandhya Kethineni
-- Create date: 09/16/2025
-- Description: CLAIM - 13176 Add document 
-- =============================================

declare @catId int = (select CategoryId from Category where CategoryFriendlyName='Homeowners')
declare @lobId int = (select LobId from LOB where LOBName = 'GC')

if not exists (select * from dbo.Document where DocumentName='Denial-Under Deductible')
insert into dbo.Document (BaseState, DocumentFriendlyName,DocumentName,DocumentOtherType,DocumentType,IsDocumentActive, JldFilePath,CreatedBy,CreatedDateTime)
values (null, 'Denial-Under Deductible','Denial-Under Deductible', null,'GCOM  Correspondence Out',1,'companyRoot:S:Production://Templates/GeneralClaims/Denial-Under Deductible.jld',SUSER_SNAME(),GETDATE())

declare @docId int = (select  documentId from Document where DocumentName='Denial-Under Deductible')

if not exists ( select * from dbo.CategoryDocument where CategoryId=@catId and DocumentId=@docId)
insert into dbo.CategoryDocument (CategoryId,DocumentId,DocumentOrder,EffectiveDate,ExpirationDate,CreatedDateTime,CreatedBy)
values (@catId,@docId,1,GETDATE(),DATEADD(year, 90, GETDATE()),GETDATE(),SUSER_SNAME())

declare @ctrl_GCExposureNameAndType int = (select ControlId from Control where controlName='GCExposureNameAndType')
declare @ctrl_GCAddrOneandTwowGreetingName int = (select ControlId from Control where controlName='GCAddrOneandTwowGreetingName')
declare @ctrl_GCAuthor int = (select ControlId from Control where controlName='GCAuthor')
declare @ctrl_GCReSection int = (select ControlId from Control where controlName='GCReSection')
declare @ctrl_SelectCommunicationSection int = (select ControlId from Control where controlName='SelectCommunicationSection')
declare @ctrl_GCBatchControls int = (select ControlId from Control where controlName='GCBatchControls')
declare @ctrl_PrinterDropdown int = (select ControlId from Control where controlName='PrinterDropdownwCheckbox')
declare @ctrl_WCCEmail int = (select ControlId from Control where controlName='WCCEmail')
declare @ctrl_ClaimsFax int = (select ControlId from Control where controlName='ClaimsFax')
declare @ctrl_ClaimsCcBcc int = (select ControlId from Control where controlName='ClaimsCcBcc')
declare @ctrl_GCDenialReason int = (select ControlId from Control where controlName='GCDenialReason')

if not exists(select * from dbo.DocumentControl where DocumentId = @docId )
insert into dbo.DocumentControl (ControlId,DocumentId,ControlOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
values (@ctrl_GCExposureNameAndType,@docId,100,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCAddrOneandTwowGreetingName,@docId,200,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCAuthor,@docId,300,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCDenialReason,@docId,400,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCReSection,@docId,500,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_SelectCommunicationSection,@docId,600,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCBatchControls,@docId,700,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_PrinterDropdown,@docId,800,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_WCCEmail,@docId,900,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_ClaimsFax,@docId,1000,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_ClaimsCcBcc,@docId,1100,SUSER_SNAME(),GETDATE(),null,null)

if not exists (select * from DenialReason where DenialReasonKey='Covered')
insert into DenialReason (DenialReasonKey, DenialReasonValue, CreatedBy, CreatedDateTime)
values ('Covered','Covered', SUSER_SNAME(), GETDATE() )
,('Limit','Limit',SUSER_SNAME(), GETDATE())
,('Water','Water',SUSER_SNAME(), GETDATE())

declare @covered int =(select DenialReasonId from DenialReason where DenialReasonKey='Covered')
declare @Limit int =(select DenialReasonId from DenialReason where DenialReasonKey='Limit')
declare @Water int =(select DenialReasonId from DenialReason where DenialReasonKey='Water')

if not exists (select * from DenialReasonMap where DocumentId=@docId)
insert into DenialReasonMap(DenialReasonId,DisplayOrder,DocumentId,LOBId,CreatedBy,CreatedDateTime)
values (@covered, 100, @docId,@lobId,SUSER_SNAME(),GETDATE()),
(@Limit, 200, @docId,@lobId,SUSER_SNAME(),GETDATE()),
(@Water, 300, @docId,@lobId,SUSER_SNAME(),GETDATE())

 
declare @configvalue varchar(30) = (select configValue from Configuration where ConfigKey ='GC_DocumentsExcludedBy_HO_DW')
delete from  Configuration where ConfigKey ='GC_DocumentsExcludedBy_HO_DW'
insert into Configuration (ConfigKey,ConfigValue,LOBId,CreatedBy,CreatedDateTime) Values ('GC_DocumentsExcludedBy_HO_DW',  @configvalue + ',' + CAST(@docId as varchar),@lobId, SUSER_SNAME(),GETDATE())

go
-- =============================================
-- Author:		Sandhya Kethineni
-- Create date: 09/19/2025
-- Description: CLAIM - 13170 Add document 
-- =============================================

declare @catId int = (select CategoryId from Category where CategoryFriendlyName='Homeowners')
declare @lobId int = (select LobId from LOB where LOBName = 'GC')

if not exists (select * from dbo.Document where DocumentName='Covered Proof and Denial-HO DW')
insert into dbo.Document (BaseState, DocumentFriendlyName,DocumentName,DocumentOtherType,DocumentType,IsDocumentActive, JldFilePath,CreatedBy,CreatedDateTime)
values (null, 'Covered Proof and Denial-HO DW','Covered Proof and Denial-HO DW', null,'GCOM  Correspondence Out',1,'companyRoot:S:Production://Templates/GeneralClaims/Covered Proof and Denial-HO DW.jld',SUSER_SNAME(),GETDATE())

declare @docId int = (select  documentId from Document where DocumentName='Covered Proof and Denial-HO DW')

if not exists ( select * from dbo.CategoryDocument where CategoryId=@catId and DocumentId=@docId)
insert into dbo.CategoryDocument (CategoryId,DocumentId,DocumentOrder,EffectiveDate,ExpirationDate,CreatedDateTime,CreatedBy)
values (@catId,@docId,1,GETDATE(),DATEADD(year, 90, GETDATE()),GETDATE(),SUSER_SNAME())

declare @ctrl_GCExposureNameAndType int = (select ControlId from Control where controlName='GCExposureNameAndType')
declare @ctrl_GCAddrOneandTwowGreetingName int = (select ControlId from Control where controlName='GCAddrOneandTwowGreetingName')
declare @ctrl_GCAuthor int = (select ControlId from Control where controlName='GCAuthor')
declare @ctrl_GCReSection int = (select ControlId from Control where controlName='GCReSection')
declare @ctrl_SelectCommunicationSection int = (select ControlId from Control where controlName='SelectCommunicationSection')
declare @ctrl_GCBatchControls int = (select ControlId from Control where controlName='GCBatchControls')
declare @ctrl_PrinterDropdown int = (select ControlId from Control where controlName='PrinterDropdownwCheckbox')
declare @ctrl_WCCEmail int = (select ControlId from Control where controlName='WCCEmail')
declare @ctrl_ClaimsFax int = (select ControlId from Control where controlName='ClaimsFax')
declare @ctrl_ClaimsCcBcc int = (select ControlId from Control where controlName='ClaimsCcBcc')

if not exists(select * from dbo.DocumentControl where DocumentId = @docId )
insert into dbo.DocumentControl (ControlId,DocumentId,ControlOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
values 
(@ctrl_GCExposureNameAndType,@docId,100,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCAddrOneandTwowGreetingName,@docId,200,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCAuthor,@docId,300,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCReSection,@docId,400,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_SelectCommunicationSection,@docId,500,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCBatchControls,@docId,600,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_PrinterDropdown,@docId,700,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_WCCEmail,@docId,800,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_ClaimsFax,@docId,900,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_ClaimsCcBcc,@docId,1000,SUSER_SNAME(),GETDATE(),null,null)

 
 
declare @configvalue varchar(30) = (select configValue from Configuration where ConfigKey ='GC_DocumentsExcludedBy_HO_DW')
delete from  Configuration where ConfigKey ='GC_DocumentsExcludedBy_HO_DW'
insert into Configuration (ConfigKey,ConfigValue,LOBId,CreatedBy,CreatedDateTime) Values ('GC_DocumentsExcludedBy_HO_DW',  @configvalue + ',' + CAST(@docId as varchar), @lobId, SUSER_SNAME(),GETDATE())

go

-- =============================================
-- Author:		Sandhya Kethineni
-- Create date: 09/19/2025
-- Description: CLAIM - 13303 Add document 
-- =============================================

declare @catId int = (select CategoryId from Category where CategoryFriendlyName='Homeowners')
declare @lobId int = (select LobId from LOB where LOBName = 'GC')

if not exists (select * from dbo.Document where DocumentName='Undisputed Proof Rejection Ltr-HO DW')
insert into dbo.Document (BaseState, DocumentFriendlyName,DocumentName,DocumentOtherType,DocumentType,IsDocumentActive, JldFilePath,CreatedBy,CreatedDateTime)
values (null, 'Undisputed Proof Rejection Ltr-HO DW','Undisputed Proof Rejection Ltr-HO DW', null,'GCOM  Correspondence Out',1,'companyRoot:S:Production://Templates/GeneralClaims/Undisputed Proof Rejection Ltr-HO DW.jld',SUSER_SNAME(),GETDATE())

declare @docId int = (select  documentId from Document where DocumentName='Undisputed Proof Rejection Ltr-HO DW')

if not exists ( select * from dbo.CategoryDocument where CategoryId=@catId and DocumentId=@docId)
insert into dbo.CategoryDocument (CategoryId,DocumentId,DocumentOrder,EffectiveDate,ExpirationDate,CreatedDateTime,CreatedBy)
values (@catId,@docId,1,GETDATE(),DATEADD(year, 90, GETDATE()),GETDATE(),SUSER_SNAME())

declare @ctrl_GCExposureNameAndType int = (select ControlId from Control where controlName='GCExposureNameAndType')
declare @ctrl_GCAddrOneandTwowGreetingName int = (select ControlId from Control where controlName='GCAddrOneandTwowGreetingName')
declare @ctrl_GCAuthor int = (select ControlId from Control where controlName='GCAuthor')
declare @ctrl_GCReSection int = (select ControlId from Control where controlName='GCReSection')
declare @ctrl_SelectCommunicationSection int = (select ControlId from Control where controlName='SelectCommunicationSection')
declare @ctrl_GCBatchControls int = (select ControlId from Control where controlName='GCBatchControls')
declare @ctrl_PrinterDropdown int = (select ControlId from Control where controlName='PrinterDropdownwCheckbox')
declare @ctrl_WCCEmail int = (select ControlId from Control where controlName='WCCEmail')
declare @ctrl_ClaimsFax int = (select ControlId from Control where controlName='ClaimsFax')
declare @ctrl_ClaimsCcBcc int = (select ControlId from Control where controlName='ClaimsCcBcc')

if not exists(select * from dbo.DocumentControl where DocumentId = @docId )
insert into dbo.DocumentControl (ControlId,DocumentId,ControlOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
values 
(@ctrl_GCExposureNameAndType,@docId,100,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCAddrOneandTwowGreetingName,@docId,200,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCAuthor,@docId,300,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCReSection,@docId,400,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_SelectCommunicationSection,@docId,500,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCBatchControls,@docId,600,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_PrinterDropdown,@docId,700,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_WCCEmail,@docId,800,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_ClaimsFax,@docId,900,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_ClaimsCcBcc,@docId,1000,SUSER_SNAME(),GETDATE(),null,null)

 
 
declare @configvalue varchar(30) = (select configValue from Configuration where ConfigKey ='GC_DocumentsExcludedBy_HO_DW')
delete from  Configuration where ConfigKey ='GC_DocumentsExcludedBy_HO_DW'
insert into Configuration (ConfigKey,ConfigValue,LOBId,CreatedBy,CreatedDateTime) Values ('GC_DocumentsExcludedBy_HO_DW',  @configvalue + ',' + CAST(@docId as varchar), @lobId, SUSER_SNAME(),GETDATE())

go


-- =============================================
-- Author:		Sandhya Kethineni
-- Create date: 09/19/2025
-- Description: CLAIM - 13477 Add document 
-- =============================================

declare @catId int = (select CategoryId from Category where CategoryFriendlyName='Homeowners')
declare @lobId int = (select LobId from LOB where LOBName = 'GC')

if not exists (select * from dbo.Document where DocumentName='Denial-No Peril Coverage')
insert into dbo.Document (BaseState, DocumentFriendlyName,DocumentName,DocumentOtherType,DocumentType,IsDocumentActive, JldFilePath,CreatedBy,CreatedDateTime)
values (null, 'Denial-No Peril Coverage','Denial-No Peril Coverage', null,'GCOM  Correspondence Out',1,'companyRoot:S:Production://Templates/GeneralClaims/Denial-No Peril Coverage.jld',SUSER_SNAME(),GETDATE())

declare @docId int = (select  documentId from Document where DocumentName='Denial-No Peril Coverage')

if not exists ( select * from dbo.CategoryDocument where CategoryId=@catId and DocumentId=@docId)
insert into dbo.CategoryDocument (CategoryId,DocumentId,DocumentOrder,EffectiveDate,ExpirationDate,CreatedDateTime,CreatedBy)
values (@catId,@docId,1,GETDATE(),DATEADD(year, 90, GETDATE()),GETDATE(),SUSER_SNAME())

declare @ctrl_GCExposureNameAndType int = (select ControlId from Control where controlName='GCExposureNameAndType')
declare @ctrl_GCAddrOneandTwowGreetingName int = (select ControlId from Control where controlName='GCAddrOneandTwowGreetingName')
declare @ctrl_GCAuthor int = (select ControlId from Control where controlName='GCAuthor')
declare @ctrl_GCReSection int = (select ControlId from Control where controlName='GCReSection')
declare @ctrl_SelectCommunicationSection int = (select ControlId from Control where controlName='SelectCommunicationSection')
declare @ctrl_GCBatchControls int = (select ControlId from Control where controlName='GCBatchControls')
declare @ctrl_PrinterDropdown int = (select ControlId from Control where controlName='PrinterDropdownwCheckbox')
declare @ctrl_WCCEmail int = (select ControlId from Control where controlName='WCCEmail')
declare @ctrl_ClaimsFax int = (select ControlId from Control where controlName='ClaimsFax')
declare @ctrl_ClaimsCcBcc int = (select ControlId from Control where controlName='ClaimsCcBcc')
declare @ctrl_GCDenialReason int = (select ControlId from Control where controlName='GCDenialReason')

if not exists(select * from dbo.DocumentControl where DocumentId = @docId )
insert into dbo.DocumentControl (ControlId,DocumentId,ControlOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
values (@ctrl_GCExposureNameAndType,@docId,100,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCAddrOneandTwowGreetingName,@docId,200,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCAuthor,@docId,300,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCDenialReason,@docId,400,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCReSection,@docId,500,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_SelectCommunicationSection,@docId,600,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCBatchControls,@docId,700,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_PrinterDropdown,@docId,800,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_WCCEmail,@docId,900,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_ClaimsFax,@docId,1000,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_ClaimsCcBcc,@docId,1100,SUSER_SNAME(),GETDATE(),null,null)

if not exists (select * from DenialReason where DenialReasonKey='Contents')
insert into DenialReason (DenialReasonKey, DenialReasonValue, CreatedBy, CreatedDateTime)
values ('Contents','Contents', SUSER_SNAME(), GETDATE() )
,('Contents Dwelling','Contents Dwelling',SUSER_SNAME(), GETDATE())
,('DP1','DP1',SUSER_SNAME(), GETDATE())
,('DP2','DP2',SUSER_SNAME(), GETDATE())
,('Loss Assessment Perils Insured Against','Loss Assessment Perils Insured Against',SUSER_SNAME(), GETDATE())
,('Perils Insured Against Exclusion','Perils Insured Against Exclusion',SUSER_SNAME(), GETDATE())
,('Trees Plants Shrubs','Trees Plants Shrubs',SUSER_SNAME(), GETDATE())

Declare @Contents int = (select DenialReasonId from DenialReason where DenialReasonKey='Contents')
Declare @Contents_Dwelling int = (select DenialReasonId from DenialReason where DenialReasonKey='Contents Dwelling')
Declare @DP1 int = (select DenialReasonId from DenialReason where DenialReasonKey='DP1')
Declare @DP2 int = (select DenialReasonId from DenialReason where DenialReasonKey='DP2')
Declare @Loss_Assessment_Perils_Insured_Against int = (select DenialReasonId from DenialReason where DenialReasonKey='Loss Assessment Perils Insured Against')
Declare @Perils_Insured_Agaisnt_Exclusion int = (select DenialReasonId from DenialReason where DenialReasonKey='Perils Insured Against Exclusion')
Declare @Trees_PlantsShrubs int = (select DenialReasonId from DenialReason where DenialReasonKey='Trees Plants Shrubs')

if not exists (select * from DenialReasonMap where DocumentId=@docId)
insert into DenialReasonMap(PolicyForm,DisplayOrder,DocumentId,LOBId,DenialReasonId,CreatedBy,CreatedDateTime)
values ('DP1',100,@docId,@lobId,@Contents,SUSER_SNAME(), GETDATE()),
('DP1',200,@docId,@lobId,@DP1,SUSER_SNAME(), GETDATE()),
('DP2',100,@docId,@lobId,@Contents,SUSER_SNAME(), GETDATE()),
('DP2',200,@docId,@lobId,@DP2,SUSER_SNAME(), GETDATE()),
('DP2',300,@docId,@lobId,@Trees_PlantsShrubs,SUSER_SNAME(), GETDATE()),
('DP3',100,@docId,@lobId,@Contents,SUSER_SNAME(), GETDATE()),
('DP3',200,@docId,@lobId,@Perils_Insured_Agaisnt_Exclusion,SUSER_SNAME(), GETDATE()),
('DP3',300,@docId,@lobId,@Trees_PlantsShrubs,SUSER_SNAME(), GETDATE()),
('HO3',100,@docId,@lobId,@Contents,SUSER_SNAME(), GETDATE()),
('HO3',200,@docId,@lobId,@Contents_Dwelling,SUSER_SNAME(), GETDATE()),
('HO3',300,@docId,@lobId,@Loss_Assessment_Perils_Insured_Against,SUSER_SNAME(), GETDATE()),
('HO3',400,@docId,@lobId,@Perils_Insured_Agaisnt_Exclusion,SUSER_SNAME(), GETDATE()),
('HO3',500,@docId,@lobId,@Trees_PlantsShrubs,SUSER_SNAME(), GETDATE()),
('HO4',100,@docId,@lobId,@Contents,SUSER_SNAME(), GETDATE()),
('HO4',200,@docId,@lobId,@Trees_PlantsShrubs,SUSER_SNAME(), GETDATE()),
('HO5',100,@docId,@lobId,@Loss_Assessment_Perils_Insured_Against,SUSER_SNAME(), GETDATE()),
('HO5',200,@docId,@lobId,@Perils_Insured_Agaisnt_Exclusion,SUSER_SNAME(), GETDATE()),
('HO5',300,@docId,@lobId,@Trees_PlantsShrubs,SUSER_SNAME(), GETDATE()),
('HO6',100,@docId,@lobId,@Contents,SUSER_SNAME(), GETDATE()),
('HO6',200,@docId,@lobId,@Loss_Assessment_Perils_Insured_Against, SUSER_SNAME(), GETDATE()),
('HO6',300,@docId,@lobId,@Perils_Insured_Agaisnt_Exclusion,SUSER_SNAME(), GETDATE()),
('HO6',400,@docId,@lobId,@Trees_PlantsShrubs,SUSER_SNAME(), GETDATE())


 
 
declare @configvalue varchar(30) = (select configValue from Configuration where ConfigKey ='GC_DocumentsExcludedBy_HO_DW')
delete from  Configuration where ConfigKey ='GC_DocumentsExcludedBy_HO_DW'
insert into Configuration (ConfigKey,ConfigValue,LOBId,CreatedBy,CreatedDateTime) Values ('GC_DocumentsExcludedBy_HO_DW',  @configvalue + ',' + CAST(@docId as varchar), @lobId, SUSER_SNAME(),GETDATE())

go

-- =============================================
-- Author:		Sandhya Kethineni
-- Create date: 09/24/2025
-- Description: CLAIM - 13172 Add document 
-- =============================================

declare @catId int = (select CategoryId from Category where CategoryFriendlyName='Homeowners')
declare @lobId int = (select LobId from LOB where LOBName = 'GC')

if not exists (select * from dbo.Document where DocumentName='Appraisal Denial')
insert into dbo.Document (BaseState, DocumentFriendlyName,DocumentName,DocumentOtherType,DocumentType,IsDocumentActive, JldFilePath,CreatedBy,CreatedDateTime)
values ('NJ,PA', 'Appraisal Denial','Appraisal Denial', null,'GCOM  Correspondence Out',1,'companyRoot:S:Production://Templates/GeneralClaims/Appraisal Denial.jld',SUSER_SNAME(),GETDATE())

declare @docId int = (select  documentId from Document where DocumentName='Appraisal Denial')

if not exists ( select * from dbo.CategoryDocument where CategoryId=@catId and DocumentId=@docId)
insert into dbo.CategoryDocument (CategoryId,DocumentId,DocumentOrder,EffectiveDate,ExpirationDate,CreatedDateTime,CreatedBy)
values (@catId,@docId,1,GETDATE(),DATEADD(year, 90, GETDATE()),GETDATE(),SUSER_SNAME())

declare @ctrl_GCExposureNameAndType int = (select ControlId from Control where controlName='GCExposureNameAndType')
declare @ctrl_GCAddrOneandTwowGreetingName int = (select ControlId from Control where controlName='GCAddrOneandTwowGreetingName')
declare @ctrl_GCAuthor int = (select ControlId from Control where controlName='GCAuthor')
declare @ctrl_GCReSection int = (select ControlId from Control where controlName='GCReSection')
declare @ctrl_SelectCommunicationSection int = (select ControlId from Control where controlName='SelectCommunicationSection')
declare @ctrl_GCBatchControls int = (select ControlId from Control where controlName='GCBatchControls')
declare @ctrl_PrinterDropdown int = (select ControlId from Control where controlName='PrinterDropdownwCheckbox')
declare @ctrl_WCCEmail int = (select ControlId from Control where controlName='WCCEmail')
declare @ctrl_ClaimsFax int = (select ControlId from Control where controlName='ClaimsFax')
declare @ctrl_ClaimsCcBcc int = (select ControlId from Control where controlName='ClaimsCcBcc')

if not exists(select * from dbo.DocumentControl where DocumentId = @docId )
insert into dbo.DocumentControl (ControlId,DocumentId,ControlOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
values 
(@ctrl_GCExposureNameAndType,@docId,100,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCAddrOneandTwowGreetingName,@docId,200,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCAuthor,@docId,300,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCReSection,@docId,400,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_SelectCommunicationSection,@docId,500,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCBatchControls,@docId,600,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_PrinterDropdown,@docId,700,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_WCCEmail,@docId,800,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_ClaimsFax,@docId,900,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_ClaimsCcBcc,@docId,1000,SUSER_SNAME(),GETDATE(),null,null)

 
 
declare @configvalue varchar(30) = (select configValue from Configuration where ConfigKey ='GC_DocumentsExcludedBy_HO_DW')
delete from  Configuration where ConfigKey ='GC_DocumentsExcludedBy_HO_DW'
insert into Configuration (ConfigKey,ConfigValue,LOBId,CreatedBy,CreatedDateTime) Values ('GC_DocumentsExcludedBy_HO_DW',  @configvalue + ',' + CAST(@docId as varchar), @lobId, SUSER_SNAME(),GETDATE())

go



-- =============================================
-- Author:		Sandhya Kethineni
-- Create date: 09/24/2025
-- Description: CLAIM - 13549 Add document 
-- =============================================

declare @catId int = (select CategoryId from Category where CategoryFriendlyName='Homeowners')
declare @lobId int = (select LobId from LOB where LOBName = 'GC')

if not exists (select * from dbo.Document where DocumentName='Denial-No Coverage')
insert into dbo.Document (BaseState, DocumentFriendlyName,DocumentName,DocumentOtherType,DocumentType,IsDocumentActive, JldFilePath,CreatedBy,CreatedDateTime)
values (null, 'Denial-No Coverage','Denial-No Coverage', null,'GCOM  Correspondence Out',1,'companyRoot:S:Production://Templates/GeneralClaims/Denial-No Coverage.jld',SUSER_SNAME(),GETDATE())

declare @docId int = (select  documentId from Document where DocumentName='Denial-No Coverage')

if not exists ( select * from dbo.CategoryDocument where CategoryId=@catId and DocumentId=@docId)
insert into dbo.CategoryDocument (CategoryId,DocumentId,DocumentOrder,EffectiveDate,ExpirationDate,CreatedDateTime,CreatedBy)
values (@catId,@docId,1,GETDATE(),DATEADD(year, 90, GETDATE()),GETDATE(),SUSER_SNAME())

declare @ctrl_GCExposureNameAndType int = (select ControlId from Control where controlName='GCExposureNameAndType')
declare @ctrl_GCAddrOneandTwowGreetingName int = (select ControlId from Control where controlName='GCAddrOneandTwowGreetingName')
declare @ctrl_GCAuthor int = (select ControlId from Control where controlName='GCAuthor')
declare @ctrl_GCReSection int = (select ControlId from Control where controlName='GCReSection')
declare @ctrl_SelectCommunicationSection int = (select ControlId from Control where controlName='SelectCommunicationSection')
declare @ctrl_GCBatchControls int = (select ControlId from Control where controlName='GCBatchControls')
declare @ctrl_PrinterDropdown int = (select ControlId from Control where controlName='PrinterDropdownwCheckbox')
declare @ctrl_WCCEmail int = (select ControlId from Control where controlName='WCCEmail')
declare @ctrl_ClaimsFax int = (select ControlId from Control where controlName='ClaimsFax')
declare @ctrl_ClaimsCcBcc int = (select ControlId from Control where controlName='ClaimsCcBcc')
declare @ctrl_GCDenialReason int = (select ControlId from Control where controlName='GCDenialReason')

if not exists(select * from dbo.DocumentControl where DocumentId = @docId )
insert into dbo.DocumentControl (ControlId,DocumentId,ControlOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
values (@ctrl_GCExposureNameAndType,@docId,100,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCAddrOneandTwowGreetingName,@docId,200,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCAuthor,@docId,300,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCDenialReason,@docId,400,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCReSection,@docId,500,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_SelectCommunicationSection,@docId,600,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCBatchControls,@docId,700,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_PrinterDropdown,@docId,800,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_WCCEmail,@docId,900,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_ClaimsFax,@docId,1000,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_ClaimsCcBcc,@docId,1100,SUSER_SNAME(),GETDATE(),null,null)


 
if not exists (select * from DenialReason where DenialReasonKey='Failed to Complete Repairs')
insert into DenialReason (DenialReasonKey, DenialReasonValue, CreatedBy, CreatedDateTime)
values 
('Collapse-Building No Fall','Collapse-Building No Fall', SUSER_SNAME(), GETDATE()),
('Collapse-No Collapse','Collapse-No Collapse', SUSER_SNAME(), GETDATE()),
('Collapse-No Coverage Cause','Collapse-No Coverage Cause', SUSER_SNAME(), GETDATE()),

('Failed to Complete Repairs','Failed to Complete Repairs', SUSER_SNAME(), GETDATE()),
('General Exclusion','General Exclusion', SUSER_SNAME(), GETDATE()),
('Liability-Intentional Act','Liability-Intentional Act', SUSER_SNAME(), GETDATE()),
('Property Not Covered','Property Not Covered', SUSER_SNAME(), GETDATE()),
('Theft at Another Residence','Theft at Another Residence', SUSER_SNAME(), GETDATE()),
('Theft Only','Theft Only', SUSER_SNAME(), GETDATE()),
('Visible Ensuing Damage Excluded','Visible Ensuing Damage Excluded', SUSER_SNAME(), GETDATE()),
('Wind Rain Contents Only','Wind Rain Contents Only', SUSER_SNAME(), GETDATE()),
('Water-Ground or Flood','Water-Ground or Flood', SUSER_SNAME(), GETDATE()),
('Windstorm Trees','Windstorm Trees', SUSER_SNAME(), GETDATE())



declare @Failed_to_Complete_Repairs int = (select denialReasonId from denialreason where denialreasonkey = 'Failed to Complete Repairs')
declare @General_Exclusion int = (select denialReasonId from denialreason where denialreasonkey = 'General Exclusion')
declare @Property_Not_Covered int = (select denialReasonId from denialreason where denialreasonkey = 'Property Not Covered')
declare @Water_Ground_or_Flood int = (select denialReasonId from denialreason where denialreasonkey = 'Water-Ground or Flood')
declare @Collapse_Building_No_Fall int = (select denialReasonId from denialreason where denialreasonkey = 'Collapse-Building No Fall')
declare @Collapse_No_Collapse int = (select denialReasonId from denialreason where denialreasonkey = 'Collapse-No Collapse')
declare @Collapse_No_Coverage_Cause int = (select denialReasonId from denialreason where denialreasonkey = 'Collapse-No Coverage Cause')
declare @Visible_Ensuing_Damage_Excluded int = (select denialReasonId from denialreason where denialreasonkey = 'Visible Ensuing Damage Excluded')
declare @Liability_Intentional_Act int = (select denialReasonId from denialreason where denialreasonkey = 'Liability-Intentional Act')
declare @Theft_at_Another_Residence int = (select denialReasonId from denialreason where denialreasonkey = 'Theft at Another Residence')
declare @Theft_Only int = (select denialReasonId from denialreason where denialreasonkey = 'Theft Only')
declare @Windstorm_Trees int = (select denialReasonId from denialreason where denialreasonkey = 'Windstorm Trees')
declare @Wind_Rain_Contents_Only int = (select denialReasonId from denialreason where denialreasonkey = 'Wind Rain Contents Only')

if not exists (select * from DenialReasonMap where DocumentId=@docId)
insert into DenialReasonMap(PolicyForm,DenialReasonId,DisplayOrder,DocumentId,LOBId,CreatedBy,CreatedDateTime)
values
(null,@Failed_to_Complete_Repairs,400,@docId,@lobId,SUSER_SNAME(), GETDATE()),
(null,@General_Exclusion,500,@docId,@lobId,SUSER_SNAME(), GETDATE()),
(null,@Liability_Intentional_Act,600,@docId,@lobId,SUSER_SNAME(), GETDATE()),
(null,@Property_Not_Covered,700,@docId,@lobId,SUSER_SNAME(), GETDATE()),
(null,@Water_Ground_or_Flood,1100,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('DP2',@Collapse_Building_No_Fall,100,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('DP2',@Collapse_No_Collapse,200,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('DP2',@Collapse_No_Coverage_Cause,300,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('DP3',@Collapse_Building_No_Fall,100,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('DP3',@Collapse_No_Collapse,200,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('DP3',@Collapse_No_Coverage_Cause,300,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('DP3',@Visible_Ensuing_Damage_Excluded,800,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO3',@Collapse_Building_No_Fall,100,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO3',@Collapse_No_Collapse,200,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO3',@Collapse_No_Coverage_Cause,300,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO3',@Theft_at_Another_Residence,800,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO3',@Theft_Only,900,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO3',@Visible_Ensuing_Damage_Excluded,1000,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO3',@Windstorm_Trees,1200,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO4',@Collapse_Building_No_Fall,100,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO4',@Collapse_No_Collapse,200,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO4',@Collapse_No_Coverage_Cause,300,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO4',@Theft_at_Another_Residence,800,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO4',@Theft_Only,900,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO4',@Visible_Ensuing_Damage_Excluded,1000,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO4',@Wind_Rain_Contents_Only,1200,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO4',@Windstorm_Trees,1300,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO5',@Collapse_Building_No_Fall,100,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO5',@Collapse_No_Collapse,200,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO5',@Collapse_No_Coverage_Cause,300,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO5',@Visible_Ensuing_Damage_Excluded,800,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO5',@Windstorm_Trees,1200,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO6',@Collapse_Building_No_Fall,100,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO6',@Collapse_No_Collapse,200,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO6',@Collapse_No_Coverage_Cause,300,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO6',@Theft_at_Another_Residence,800,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO6',@Theft_Only,900,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO6',@Visible_Ensuing_Damage_Excluded,1000,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('HO6',@Windstorm_Trees,1200,@docId,@lobId,SUSER_SNAME(), GETDATE())



 
declare @configvalue varchar(100) = (select configValue from Configuration where ConfigKey ='GC_DocumentsExcludedBy_HO_DW')
delete from  Configuration where ConfigKey ='GC_DocumentsExcludedBy_HO_DW'
insert into Configuration (ConfigKey,ConfigValue,LOBId,CreatedBy,CreatedDateTime) Values ('GC_DocumentsExcludedBy_HO_DW',  @configvalue + ',' + CAST(@docId as varchar), @lobId, SUSER_SNAME(),GETDATE())

go


-- =============================================
-- Author:		Sandhya Kethineni
-- Create date: 09/24/2025
-- Description: CLAIM - 13565 Add document 
-- =============================================

declare @catId int = (select CategoryId from Category where CategoryFriendlyName='Homeowners')
declare @lobId int = (select LobId from LOB where LOBName = 'GC')

if not exists (select * from dbo.Document where DocumentName='Notice of Payment-HO DW')
insert into dbo.Document (BaseState, DocumentFriendlyName,DocumentName,DocumentOtherType,DocumentType,IsDocumentActive, JldFilePath,CreatedBy,CreatedDateTime)
values (null, 'Notice of Payment-HO DW','Notice of Payment-HO DW', null,'GCOM  Correspondence Out',1,'companyRoot:S:Production://Templates/GeneralClaims/Notice of Payment-HO DW.jld',SUSER_SNAME(),GETDATE())

declare @docId int = (select  documentId from Document where DocumentName='Notice of Payment-HO DW')

if not exists ( select * from dbo.CategoryDocument where CategoryId=@catId and DocumentId=@docId)
insert into dbo.CategoryDocument (CategoryId,DocumentId,DocumentOrder,EffectiveDate,ExpirationDate,CreatedDateTime,CreatedBy)
values (@catId,@docId,1,GETDATE(),DATEADD(year, 90, GETDATE()),GETDATE(),SUSER_SNAME())

declare @ctrl_GCExposureNameAndType int = (select ControlId from Control where controlName='GCExposureNameAndType')
declare @ctrl_GCAddrOneandTwowGreetingName int = (select ControlId from Control where controlName='GCAddrOneandTwowGreetingName')
declare @ctrl_GCAuthor int = (select ControlId from Control where controlName='GCAuthor')
declare @ctrl_GCReSection int = (select ControlId from Control where controlName='GCReSection')
declare @ctrl_SelectCommunicationSection int = (select ControlId from Control where controlName='SelectCommunicationSection')
declare @ctrl_GCBatchControls int = (select ControlId from Control where controlName='GCBatchControls')
declare @ctrl_PrinterDropdown int = (select ControlId from Control where controlName='PrinterDropdownwCheckbox')
declare @ctrl_WCCEmail int = (select ControlId from Control where controlName='WCCEmail')
declare @ctrl_ClaimsFax int = (select ControlId from Control where controlName='ClaimsFax')
declare @ctrl_ClaimsCcBcc int = (select ControlId from Control where controlName='ClaimsCcBcc')
declare @ctrl_GCDenialReason int = (select ControlId from Control where controlName='GCDenialReason')

if not exists(select * from dbo.DocumentControl where DocumentId = @docId )
insert into dbo.DocumentControl (ControlId,DocumentId,ControlOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
values (@ctrl_GCExposureNameAndType,@docId,100,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCAddrOneandTwowGreetingName,@docId,200,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCAuthor,@docId,300,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCDenialReason,@docId,400,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCReSection,@docId,500,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_SelectCommunicationSection,@docId,600,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_GCBatchControls,@docId,700,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_PrinterDropdown,@docId,800,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_WCCEmail,@docId,900,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_ClaimsFax,@docId,1000,SUSER_SNAME(),GETDATE(),null,null),
(@ctrl_ClaimsCcBcc,@docId,1100,SUSER_SNAME(),GETDATE(),null,null)


 
if not exists (select * from DenialReason where DenialReasonKey='Settlement-No Denial')
insert into DenialReason (DenialReasonKey, DenialReasonValue, CreatedBy, CreatedDateTime)
values('Settlement-No Denial','Settlement-No Denial', SUSER_SNAME(), GETDATE()),
('Policy Matching Denial','Policy Matching Denial', SUSER_SNAME(), GETDATE()),
('Policy General Partial Denial','Policy General Partial Denial', SUSER_SNAME(), GETDATE()),
('Policy Wear and Tear Denial','Policy Wear and Tear Denial', SUSER_SNAME(), GETDATE())


declare @Settlement_NoDenial int = (select denialreasonId from DenialReason where denialreasonkey = 'Settlement-No Denial')
declare @PolicyMatchingDenial int = (select denialreasonId from DenialReason where denialreasonkey = 'Policy Matching Denial')
declare @PolicyGeneralPartialDenial int = (select denialreasonId from DenialReason where denialreasonkey = 'Policy General Partial Denial')
declare @PolicyWearandTearDenial int = (select denialreasonId from DenialReason where denialreasonkey = 'Policy Wear and Tear Denial')




if not exists (select * from DenialReasonMap where DocumentId=@docId)
insert into DenialReasonMap(PolicyState,PolicyForm,DenialReasonId,DisplayOrder,DocumentId,LOBId,CreatedBy,CreatedDateTime)
values
(null,null,@Settlement_NoDenial,400,@docId,@lobId,SUSER_SNAME(), GETDATE()),
(null,'DP1',@PolicyMatchingDenial,100,@docId,@lobId,SUSER_SNAME(), GETDATE()),
(null,'DP2',@PolicyMatchingDenial,100,@docId,@lobId,SUSER_SNAME(), GETDATE()),
(null,'DP3',@PolicyGeneralPartialDenial,100,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('MD','DP3',@PolicyMatchingDenial,200,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('NJ','DP3',@PolicyMatchingDenial,200,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('PA','DP3',@PolicyMatchingDenial,200,@docId,@lobId,SUSER_SNAME(), GETDATE()),
(null,'DP3',@PolicyWearandTearDenial,300,@docId,@lobId,SUSER_SNAME(), GETDATE()),
(null,'HO3',@PolicyGeneralPartialDenial,100,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('MD','HO3',@PolicyMatchingDenial,200,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('NJ','HO3',@PolicyMatchingDenial,200,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('PA','HO3',@PolicyMatchingDenial,200,@docId,@lobId,SUSER_SNAME(), GETDATE()),
(null,'HO3',@PolicyWearandTearDenial,300,@docId,@lobId,SUSER_SNAME(), GETDATE()),
(null,'HO5',@PolicyGeneralPartialDenial,100,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('MD','HO5',@PolicyMatchingDenial,200,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('NJ','HO5',@PolicyMatchingDenial,200,@docId,@lobId,SUSER_SNAME(), GETDATE()),
('PA','HO5',@PolicyMatchingDenial,200,@docId,@lobId,SUSER_SNAME(), GETDATE()),
(null,'HO5',@PolicyWearandTearDenial,300,@docId,@lobId,SUSER_SNAME(), GETDATE()),
(null,'HO6',@PolicyGeneralPartialDenial,100,@docId,@lobId,SUSER_SNAME(), GETDATE()),
(null,'HO6',@PolicyWearandTearDenial,200,@docId,@lobId,SUSER_SNAME(), GETDATE())




 
declare @configvalue varchar(100) = (select configValue from Configuration where ConfigKey ='GC_DocumentsExcludedBy_HO_DW')
delete from  Configuration where ConfigKey ='GC_DocumentsExcludedBy_HO_DW'
insert into Configuration (ConfigKey,ConfigValue,LOBId,CreatedBy,CreatedDateTime) Values ('GC_DocumentsExcludedBy_HO_DW',  @configvalue + ',' + CAST(@docId as varchar), @lobId, SUSER_SNAME(),GETDATE())

go

-- =============================================
-- Author:		Sandeep Telang
-- Create date: 10/14/2025
-- Description: PLPC-24358: 12523: Backlog Bug- OH Notice of Nonrenewal- Umb - 
--								"Driving Record -AtFault Accident" verbiages not displayed 
--								on Interactive UI and the document.
-- =============================================

-- Find the LOBId
Declare @LOBId int
SELECT @LOBId = LOBId FROM [dbo].[LOB] WHERE LOBName = 'PC-UMB'

-- Find the TypeId for UMB LOB
Declare @DocumentDropdownLookupTypeId int
SELECT @DocumentDropdownLookupTypeId = [DocumentDropdownLookupTypeId] FROM [dbo].[DocumentDropdownLookupType] 
WHERE [DocumentDropdownLookupTypeCode] = 'NoticeofNonrenewalReasons' AND LobId = @LOBId -- Umbrella

-- If DocumentDropDown is found, then update it to the correct value.
IF EXISTS(SELECT * 
			FROM DocumentDropdownLookupItem 
			WHERE DocumentDropdownLookupItemCode = 'Driving Record-At Fault Accidents' 
				AND [DocumentDropdownLookupItemValue] = 'Driving Record-At Fault Accidents'
				AND [DocumentDropdownLookupItemTypeId] = @DocumentDropdownLookupTypeId)	-- Only for Umbrella
BEGIN
	UPDATE DocumentDropdownLookupItem
		SET [DocumentDropdownLookupItemValue] = 'Driving Record At Fault Accidents',
			UpdatedBy = '602096',
			UpdatedDateTime = GETDATE()
	WHERE DocumentDropdownLookupItemCode = 'Driving Record-At Fault Accidents' 
			AND [DocumentDropdownLookupItemValue] = 'Driving Record-At Fault Accidents'
			AND [DocumentDropdownLookupItemTypeId] = @DocumentDropdownLookupTypeId

	PRINT 'Configuration Text for UMB Driving Record-At Fault Accidents updated successfully.'
END
ELSE
BEGIN
	PRINT 'Configuration Text for UMB Driving Record-At Fault Accidents has already been updated.'
END
GO

-- =============================================
-- Author:		<Kethenei, Sandhya>
-- Create date: <10/16/2025>
-- Description:	<Claim 13169 & 13302 FN_Retire letters>
-- =============================================
update Document set IsDocumentActive = 0
where DocumentName in ('DL03',
'DL05',
'DL07a',
'DL10',
'DL12',
'DL15a',
'DL16',
'DL18',
'DL20',
'DL21',
'DL23',
'DL25',
'DL25a',
'DL26b',
'DL29a',
'DL29b',
'Denial-Failed to Complete Repairs',
'DP2 No Peril Denial',
'DL17',
'DL02',
'DL15b',
'DL22',
'DL26a'
)

if not exists (select ExpirationDate from CategoryDocument where DocumentId = (select DocumentId from document where DocumentName ='DL03') and ExpirationDate < GETDATE())
update CategoryDocument set ExpirationDate = DATEADD(YEAR,-100,ExpirationDate)
where DocumentId in (select DocumentId from document where DocumentName in ('DL03',
'DL05',
'DL07a',
'DL10',
'DL12',
'DL15a',
'DL16',
'DL18',
'DL20',
'DL21',
'DL23',
'DL25',
'DL25a',
'DL26b',
'DL29a',
'DL29b',
'Denial-Failed to Complete Repairs',
'DP2 No Peril Denial',
'DL17',
'DL02',
'DL15b',
'DL22',
'DL26a'
))
Go
-- =============================================
-- Author:		<Kethenei, Sandhya>
-- Create date: <10/16/2025>
-- Description:	<Claim 13344>
-- =============================================
declare @lobId int = (select LobId from LOB where LOBName = 'GC')
declare @docids varchar(100) = (SELECT STRING_AGG(DocumentId, ',') AS CommaSeparatedString
FROM (select DocumentId from Document
where DocumentName in ('DL04a',
'DL04b',
'DL06a',
'DL08',
'DL11',
'DL29c',
'DL30',
'Denial and Covered Under Ded',
'NJ Appraisal Denial Ltr',
'PA Appraisal Denial Ltr',
'Undisputed Proof Rejection Ltr',
'Covered Proof and Denial')) as docIds)

if not exists  (select * from Configuration where ConfigKey = 'GC_DocumentsExcludedBy_OtherPolTypes')
insert into Configuration (ConfigKey,ConfigValue,LOBId,CreatedBy,CreatedDateTime)
values ('GC_DocumentsExcludedBy_OtherPolTypes', @docids, @lobId, SUSER_NAME(),GETDATE())



