Go

Declare @reasonsAuditDelay varchar(50) = 'reasonsAuditDelay'

Declare @lobID int =(select LOBId from LOB where LOBName = 'GC')

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = @reasonsAuditDelay  and LOBId = @lobID)
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,@reasonsAuditDelay,@reasonsAuditDelay,SYSTEM_USER,SYSDATETIME())
End
IF NOT EXISTS (SELECT * from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonsAuditDelay )
begin
 Insert into [dbo].DocumentDropdownLookupType (DocumentId,LobId,DocumentDropdownLookupTypeCode,DocumentDropdownLookupTypeLabelName,
 DocumentDirection,CreatedBy,CreatedDateTime,UpdatedBy, UpdatedDateTime)
values 
(-999,@lobID,@reasonsAuditDelay,null,null,SUSER_SNAME(),GETDATE(),null,null)

Declare @ReasonsID integer
Select @ReasonsID = DocumentDropdownLookupTypeId from DocumentDropdownLookupType where DocumentDropdownLookupTypeCode = @reasonsAuditDelay
insert into[dbo].DocumentDropdownLookupItem (DocumentDropdownLookupItemCode,DocumentDropdownLookupItemValue,InspireTag,
DocumentDropdownLookupItemTypeId,DocumentDropdownLookupItemOrder,CreatedBy,CreatedDateTime,UpdatedBy,UpdatedDateTime)
Values
('Admission and Discharge Summary','Admission and Discharge Summary','ADMSN_DISCHRG_SUMM',@ReasonsID,100,SUSER_SNAME(),GETDATE(),null,null),
('Physical Therapy Treatment Record','Physical Therapy Treatment Record','PHYSICAL_THERAPY_TRTMNT_REC',@ReasonsID,200,SUSER_SNAME(),GETDATE(),null,null),
('Physicians Orders Progress Notes','Physicians Orders Progress Notes','PHYS_ORDER_PROG_NOTES',@ReasonsID,300,SUSER_SNAME(),GETDATE(),null,null),
('Emergency Room Record','Emergency Room Record','ER_REC',@ReasonsID,400,SUSER_SNAME(),GETDATE(),null,null),
('All MRI CT Scan X-Ray and Ultrasound','All MRI CT Scan X-Ray and Ultrasound','ALL_MRI_CT_SCAN_XRAY_ULTRA',@ReasonsID,500,SUSER_SNAME(),GETDATE(),null,null),
('Anesthesia Time Sheet','Anesthesia Time Sheet','ANEST_TIME_SHEET',@ReasonsID,600,SUSER_SNAME(),GETDATE(),null,null),
('Operative Report','Operative Report','OPER_RPT',@ReasonsID,700,SUSER_SNAME(),GETDATE(),null,null),
('Consultation Report','Consultation Report','CONSULTATION_RPT',@ReasonsID,800,SUSER_SNAME(),GETDATE(),null,null),
('Ambulance Call Report-or MICU','Ambulance Call Report-or MICU','AMB_CALL_RPT_MICU',@ReasonsID,900,SUSER_SNAME(),GETDATE(),null,null),
('Medication Record','Medication Record','MEDICATION_REC',@ReasonsID,1000,SUSER_SNAME(),GETDATE(),null,null),
('Laboratory Studies','Laboratory Studies','LAB_STUDIES',@ReasonsID,1100,SUSER_SNAME(),GETDATE(),null,null),
('Nurses Notes','Nurses Notes','NURSE_NOTES',@ReasonsID,1200,SUSER_SNAME(),GETDATE(),null,null),
('Occupational Therapy Notes','Occupational Therapy Notes','OCCPTNL_THERAPY_NOTES',@ReasonsID,1300,SUSER_SNAME(),GETDATE(),null,null),
('Speech Therapy Notes','Speech Therapy Notes','SPEECH_THERAPY_NOTES',@ReasonsID,1400,SUSER_SNAME(),GETDATE(),null,null),
('CognitiveTherapyNotes','CognitiveTherapyNotes','COG_THERAPY_NOTES',@ReasonsID,1500,SUSER_SNAME(),GETDATE(),null,null)
End