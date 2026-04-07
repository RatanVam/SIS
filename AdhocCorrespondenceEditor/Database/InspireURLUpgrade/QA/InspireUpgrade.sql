  GO
  
  UPDATE [WebService] SET [URL]='http://inspireqa16:30600/rest/api/submit-job/PreviewWCUPCDocument'
  WHERE [URL] like '%PreviewWCUPCDocument%'
  GO

  UPDATE [WebService] SET [URL]='http://inspireqa16:30600/rest/api/submit-job/PreviewWCCDocument'
  WHERE  [URL] like '%PreviewWCCDocument%'
  GO

  UPDATE [WebService] SET [URL]='http://inspireqa16:30600/rest/api/submit-job/PreviewPCHUDDcoument'
  WHERE [URL] like '%PreviewPCHUDDcoument%' AND LOBId IN (9,10,11)
  GO

  UPDATE [WebService] SET [URL]='http://inspireqa16:30600/rest/api/submit-job/PreviewPCAutoDocument'
  WHERE  [URL] like '%PreviewPCAutoDocument%'
  GO
   
  UPDATE [WebService] SET [URL]='http://inspireqa16:30600/rest/api/submit-job/PreviewCLDocument'
  WHERE  [URL] like '%PreviewCLDocument%'
  GO
  
  UPDATE [WebService] SET [URL]='http://inspireqa16:30600/rest/api/submit-job/PreviewGCDocument'
  WHERE  [URL] like '%PreviewGCDocument%'
  GO

  UPDATE [WebService] SET [URL]='http://inspireqa16:30600/rest/api/submit-job/PreviewBCDocument'
  WHERE  [URL] like '%PreviewBCDocument%'

  GO

  UPDATE [WebService] SET [URL]='http://inspireqa16:30600/rest/api/submit-job/PreviewWCBCDocument'
  WHERE  [URL] like '%PreviewWCBCDocument%'

  GO
