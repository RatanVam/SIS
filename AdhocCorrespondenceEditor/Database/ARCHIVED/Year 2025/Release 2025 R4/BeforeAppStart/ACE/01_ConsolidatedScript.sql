-- =============================================
-- Author:		Sandhya Kethineni
-- Create date: 07/01/2025
-- Description: Add useRegDocInd config
-- =============================================
declare @lobId int = (select LOBId from LOB where LOBName = 'PC-PA')
declare @documentId int = (select documentId from Document where DocumentFriendlyName= 'NB 60 Day Decline-Cancel')

If not exists (select * from Configuration where documentId = @documentId and ConfigKey = 'useRegDocInd')
insert into Configuration (ConfigKey,ConfigValue,DocumentId,CreatedBy,CreatedDateTime, LOBId)
values ('useRegDocInd', 'true',@documentId,SUSER_SNAME(),GETDATE(),@lobId)

