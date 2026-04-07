Go
Declare @lobID int
select @lobID =  LOBId from LOB where LOBName = 'GC'
Declare @DocumentID int

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'showLossLoc' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'showLossLoc','False',(SELECT top(1) DocumentId from Document where DocumentName = 'Demand for Limits-Need Info'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'showLossLoc','False',(SELECT top(1) DocumentId from Document where DocumentName = 'Demand for Limits-Need Time'),SYSTEM_USER,SYSDATETIME())
End 

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'chkLossLocation' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Request for Photos or Video'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'UMC Ltr to Clmt'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'UMC Ltr to Insd'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Witness Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'HO6 Broker HOA Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'HO6 Master Policy Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'MD Explain Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'MD Denial Letter'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Deny Subro'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'FPB Closure Letter'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Enterprise Proofs'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'NY Fire District Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = '1st Sub - Ltr to Carr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = '1st Sub PIP - Ltr to Carr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Addtl Payment Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Concurrent Notice Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Concurrent Request Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Final Salvage'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'HO-1st Sub-Ltr to Carr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'HO Tort Settlement Agreement Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = '1st Sub - Ltr to Tort'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'HO-1st Sub-Ltr to Tort'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to tort - non-coop w carr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to Tort- Cont Pymt Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to Tort-1st Sub-Comp'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to Tort-Insurance Coverage'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to Tort-Additional Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to Tort-Policy Limit'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to Torts Leasing Company'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Subrogation Suit Referral Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to Atty-RTS-Counter-CrossClaim'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to Carr-Confirm or Deny Covrage'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to Carr-Proofs Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to Carr-Rntl Pymt Only-CarrpdPD'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to Pros-Current Status'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'PD Release for Subrogation'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Sub 1'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Subro-Addl Payments Made'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Subro-Addl Payments Made w Pct Neg'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Subrogation Award Pymt Ltr to Carr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Subrogation Initial Suit Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Subro-WC Recovery Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Tort Settlement Agreement Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Dram Shop Questionnaire'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkLossLocation','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Dram Shop to Establishment'),SYSTEM_USER,SYSDATETIME())
	End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'chkYourClaimNo' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'chkYourClaimNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Enterprise Proofs'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClaimNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Low Limits Ltr-Clmt'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClaimNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Deny Subro'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClaimNo','True',(SELECT top(1) DocumentId from Document where DocumentName = '1st Sub - Ltr to Carr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClaimNo','True',(SELECT top(1) DocumentId from Document where DocumentName = '1st Sub PIP - Ltr to Carr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClaimNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Addtl Payment Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClaimNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Concurrent Notice Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClaimNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Concurrent Request Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClaimNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Final Salvage'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClaimNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'HO-1st Sub-Ltr to Carr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClaimNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to Atty-RTS-Counter-CrossClaim'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClaimNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to Carr-Confirm or Deny Covrage'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClaimNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to Carr-Proofs Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClaimNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to Carr-Rntl Pymt Only-CarrpdPD'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClaimNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to Pros-Current Status'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClaimNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'PD Release for Subrogation'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClaimNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Sub 1'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClaimNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Subro-Addl Payments Made'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClaimNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Subro-Addl Payments Made w Pct Neg'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClaimNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Subrogation Award Pymt Ltr to Carr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClaimNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'ERISA Lien-Threshold Denial Ltr'),SYSTEM_USER,SYSDATETIME())

End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'chkYourPolicyNo' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'chkYourPolicyNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Low Limits Ltr-Clmt'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourPolicyNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Concurrent Notice Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourPolicyNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Concurrent Request Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourPolicyNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Excess-Umbrella Carrier Notice'),SYSTEM_USER,SYSDATETIME())
END

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'chkYourInsured' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'chkYourInsured','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Enterprise Proofs'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourInsured','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Deny Subro'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourInsured','True',(SELECT top(1) DocumentId from Document where DocumentName = '1st Sub - Ltr to Carr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourInsured','True',(SELECT top(1) DocumentId from Document where DocumentName = '1st Sub PIP - Ltr to Carr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourInsured','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Addtl Payment Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourInsured','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Concurrent Notice Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourInsured','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Concurrent Request Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourInsured','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Final Salvage'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourInsured','True',(SELECT top(1) DocumentId from Document where DocumentName = 'HO-1st Sub-Ltr to Carr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourInsured','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to Atty-RTS-Counter-CrossClaim'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourInsured','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to Carr-Confirm or Deny Covrage'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourInsured','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to Carr-Proofs Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourInsured','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to Carr-Rntl Pymt Only-CarrpdPD'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourInsured','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Ltr to Pros-Current Status'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourInsured','True',(SELECT top(1) DocumentId from Document where DocumentName = 'PD Release for Subrogation'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourInsured','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Sub 1'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourInsured','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Subro-Addl Payments Made'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourInsured','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Subro-Addl Payments Made w Pct Neg'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourInsured','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Subrogation Award Pymt Ltr to Carr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourInsured','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Excess-Umbrella Carrier Notice'),SYSTEM_USER,SYSDATETIME())
END

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'chkCaseCaption' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'chkCaseCaption','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Subrogation Suit Referral Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkCaseCaption','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Cert'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkCaseCaption','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Cert No Rec'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkCaseCaption','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Out of State Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkCaseCaption','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Blank Letter Template-Legal'),SYSTEM_USER,SYSDATETIME())

INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
	 (select @lobID, 'chkCaseCaption', 'True', d.DocumentId,SYSTEM_USER,SYSDATETIME()  from Document d 
	 join CategoryDocument cd on cd.DocumentId = d.DocumentId where cd.CategoryId=(Select CategoryId from Category where CategoryName ='GC_LEGAL')
	 and DocumentFriendlyName not in ('Cooperation Ltr 1st-Adjuster','Cooperation Ltr 2nd-Adjuster',
                                         'Cooperation Ltr-Final-Adjuster','Excess Only Ltr'))
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'chkYourClient' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'chkYourClient','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Longworth Ltr 2-UIM Denial'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClient','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Longworth Ltr 3-Acceptance'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourClient','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Lien Asking for Ledger'),SYSTEM_USER,SYSDATETIME())

End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'chkYourFileNo' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'chkYourFileNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Out of State Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkYourFileNo','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Lien Asking for Ledger'),SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'chkDateofService' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'chkDateofService','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Denial-Household Insurance'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkDateofService','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Denial-Intentional Act'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkDateofService','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Denial-PLIGA'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkDateofService','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Denial-Stranger Pedestrian'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkDateofService','True',(SELECT top(1) DocumentId from Document where DocumentName = 'DPR Plan IME 2 Attorney'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkDateofService','True',(SELECT top(1) DocumentId from Document where DocumentName = 'DPR Plan IME 2 Clmt'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkDateofService','True',(SELECT top(1) DocumentId from Document where DocumentName = 'DPR Plan IME Attorney'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkDateofService','True',(SELECT top(1) DocumentId from Document where DocumentName = 'DPR Plan IME Clmt'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkDateofService','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Demand for Arb'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkDateofService','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Hospital Records Request Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkDateofService','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Medical Records Request'),SYSTEM_USER,SYSDATETIME())
End

IF NOT EXISTS (SELECT * from [Configuration] where ConfigKey = 'chkClaimant' and LOBId = @lobid )
begin
INSERT INTO [dbo].[Configuration] ([LOBId],[ConfigKey],[ConfigValue],[DocumentId],[CreatedBy],[CreatedDateTime])
     VALUES
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Appeal Invalid Appeal No Docs'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Death Letter Death Wage Exclusion'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Denial Investigation'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Denial-Household Insurance'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Denial-Intentional Act'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Denial-PLIGA'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Denial-Stranger Pedestrian'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Disability Stmt from Doctor'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'DPR Plan IME 2 Attorney'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'DPR Plan IME 2 Clmt'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'DPR Plan IME Attorney'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'DPR Plan IME Clmt'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Essential Service Cover Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'IME Cancellation Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Lien Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Massage Therapy By CMT Denial Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Med Pay-Denial Regular Use'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Med Pay-Denial Workers Comp'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Medicare'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'PA Ltr of Medical Determination'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Records Req Ltr to Provider'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'TOB Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = '1st Sub PIP - Ltr to Carr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Concurrent Notice Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Concurrent Request Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Sub 1'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Subro-Addl Payments Made w Pct Neg'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'General BI Release'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'General PD Release-3rd Party'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Minor Release and Trust Form UM-UIM'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'UM-UIM Release and Trust BI-PD'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'UM-UIM Release and Trust PD'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'ERISA Lien-No Claim Presented'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'ERISA Lien-Threshold Denial Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'ERISA Proof Request Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Hospital Records Request Ltr'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Medical Records Request'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'PIP Subro-NY Assignment Agreement'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Concurrent Info Request'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'NY Denial Work Comp'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'Lien Asking for Ledger'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'OH Denial Letter'),SYSTEM_USER,SYSDATETIME()),
	 (@lobid,'chkClaimant','True',(SELECT top(1) DocumentId from Document where DocumentName = 'BI Reg Ltr'),SYSTEM_USER,SYSDATETIME())
End


