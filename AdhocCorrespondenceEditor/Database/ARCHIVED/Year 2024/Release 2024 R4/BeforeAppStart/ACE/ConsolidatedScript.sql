-- =============================================
-- Author:		Kethenei, Sandhya
-- Create date: 08/05/2024
-- Description:	Add DateOfService to IME Provider Doc
-- =============================================
If not exists (select ControlId from Control where ControlName='WCCDateOfService')
insert into Control (ControlName, CreatedBy,CreatedDateTime)
values ('WCCDateOfService',SUSER_SNAME(),GETDATE())

declare @doc_IME_Provider_Appt_Confirmation int = (select documentId from Document where DocumentName='IME Provider Appt Confirmation')
declare @ctrl_WCCDateOfService int = (select controlId from Control where ControlName='WCCDateOfService')

If not exists(select DocumentControlId from DocumentControl where DocumentId=@doc_IME_Provider_Appt_Confirmation and ControlId=@ctrl_WCCDateOfService)
insert into DocumentControl (ControlId,DocumentId,ControlOrder,CreatedBy,CreatedDateTime)
values (@ctrl_WCCDateOfService,@doc_IME_Provider_Appt_Confirmation,525,SUSER_SNAME(),GETDATE())