USE [ACE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Sreedhar Meka
-- Create date: 2023-09-06
-- Description:	Procedure to Insert Docoument Log
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[InsertDocumentLog]
		@UserId varchar(15),
		@CreatedTime datetime,
		@Lob varchar(50),
		@LetterName varchar(150),
		@Payload XML,
		@PolicyNumber varchar(50),
		@Environment varchar(50),
		@BaseState varchar(50),
		@ClaimNumber varchar(50),
		@QuoteNumber varchar(50),
		@ProducerCode varchar(50),
		@AccountNumber varchar(50)
  AS
  BEGIN

		Declare @lobId int = 0
		SELECT @lobId = LOBId
		FROM LOB
		WHERE LOBName = @Lob

			INSERT INTO [dbo].[DocumentLog](
					 [UserId]
					,[CreatedTime]
					,[LOBId]
					,[LetterName]
					,[Payload]
					,[PolicyNumber]
					,[Environment]
					,[BaseState]
					,[ClaimNumber]
					,[QuoteNumber]
					,[ProducerCode]
					,[AccountNumber]
					,[CreatedBy]
					,[CreatedDateTime])
				VALUES	(
					@UserId,
					@CreatedTime,
					@lobId,
					@LetterName,
					@Payload,
					@PolicyNumber,
					@Environment,
					@BaseState,
					@ClaimNumber,
					@QuoteNumber,
					@ProducerCode,
					@AccountNumber,
					SUSER_NAME(),
					GETDATE())
   END




