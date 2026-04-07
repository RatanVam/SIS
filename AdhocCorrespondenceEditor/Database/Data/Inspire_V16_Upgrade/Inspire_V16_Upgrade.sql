  USE ACE

  update [dbo].[WebService] 
  set URL='http://inspireprod16:30600/rest/api/submit-job/PreviewCLDocument',
  UpdatedDateTime = getdate(),
  UpdatedBy = SUSER_SNAME()
  where URLType='SampleUrl' and LOBId in (2,3,4,5,6)

  update [dbo].[WebService] 
  set URL='http://inspireprod16:30600/rest/api/submit-job/PreviewBCDocument',
  UpdatedDateTime = getdate(),
  UpdatedBy = SUSER_SNAME()
  where URLType='SampleUrl' and LOBId=1

  update [dbo].[WebService] 
  set URL='http://inspireprod16:30600/rest/api/submit-job/PreviewWCBCDocument',
  UpdatedDateTime = getdate(),
  UpdatedBy = SUSER_SNAME()
  where URLType='SampleUrl' and LOBId=7

  update [dbo].[WebService] 
  set URL='http://inspireprod16:30600/rest/api/submit-job/PreviewWCUPCDocument',
  UpdatedDateTime = getdate(),
  UpdatedBy = SUSER_SNAME()
  where URLType='SampleUrl' and LOBId=14

  update [dbo].[WebService] 
  set URL='http://inspireprod16:30600/rest/api/submit-job/PreviewPCHUDDcoument',
  UpdatedDateTime = getdate(),
  UpdatedBy = SUSER_SNAME()
  where URLType='SampleUrl' and LOBId in (11,10,9)

  update [dbo].[WebService] 
  set URL='http://inspireprod16:30600/rest/api/submit-job/PreviewPCAutoDocument',
  UpdatedDateTime = getdate(),
  UpdatedBy = SUSER_SNAME()
  where URLType='SampleUrl' and LOBId=8

    update [dbo].[WebService] 
  set URL='http://inspireprod16:30600/rest/api/submit-job/PreviewWCCDocument',
  UpdatedDateTime = getdate(),
  UpdatedBy = SUSER_SNAME()
  where URLType='SampleUrl' and LOBId=13

    update [dbo].[WebService] 
  set URL='http://inspireprod16:30600/rest/api/submit-job/PreviewGCDocument',
  UpdatedDateTime = getdate(),
  UpdatedBy = SUSER_SNAME()
  where URLType='SampleUrl' and LOBId=12

  GO