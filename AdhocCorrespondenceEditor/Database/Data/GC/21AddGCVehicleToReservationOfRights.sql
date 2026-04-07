-- =============================================
-- Author:		Sandhya Kethenei
-- Create date: 08/14/2024
-- Description: CLAIM-10262 PV 12341_GC_ Updates to Reservation of Rights Letter
-- =============================================
declare @doc_reservation_of_rights int = (select documentId from Document where DocumentFriendlyName='Reservation of Rights')
declare @ctrl_GC_Vehicle int = (select controlId from Control where ControlName='GCVehicle')
IF NOT EXISTS (Select * from DocumentControl where DocumentId=@doc_reservation_of_rights and ControlId=@ctrl_GC_Vehicle)
insert into DocumentControl (DocumentId, ControlId,ControlOrder,CreatedBy,CreatedDateTime) values ( @doc_reservation_of_rights,@ctrl_GC_Vehicle,450,SYSTEM_USER,SYSDATETIME())