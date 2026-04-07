
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

--phase1

declare @doc_Blank_Letter_Template_Group int =(select documentId from Document where documentName = 'Blank Letter Template-Group')	
declare @doc_Blank_Letter_Template_Legal int =(select documentId from Document where documentName = 'Blank Letter Template-Legal')	
declare @doc_Blank_Letter_Template_Specific int =(select documentId from Document where documentName = 'Blank Letter Template-Specific')	
declare @doc_Blank_Letter_Template_Underwriting int =(select documentId from Document where documentName = 'Blank Letter Template-Underwriting')	
--declare @doc_10_Year_Driving_Record int =(select documentId from Document where documentName = '10 Year Driving Record')	
declare @doc_Ack_w_Authorization int =(select documentId from Document where documentName = 'Ack w Authorization')	
declare @doc_Ack_w_Denial int =(select documentId from Document where documentName = 'Ack w Denial')	
declare @doc_Ack_wo_Authorization int =(select documentId from Document where documentName = 'Ack wo Authorization')	
declare @doc_AFFI_No_Insurance int =(select documentId from Document where documentName = 'AFFI No Insurance')	
declare @doc_AICRA_Claim_Threshold_Denial_Attny int =(select documentId from Document where documentName = 'AICRA Claim Threshold Denial Attny')	
declare @doc_AICRA_Claim_Threshold_Denial_Clmt int =(select documentId from Document where documentName = 'AICRA Claim Threshold Denial Clmt')	
declare @doc_Authorization_to_Attorney int =(select documentId from Document where documentName = 'Authorization to Attorney')	
declare @doc_Authorization_to_Clmt_and_Insd int =(select documentId from Document where documentName = 'Authorization to Clmt and Insd')	
declare @doc_Auto_Legal_Ltr int =(select documentId from Document where documentName = 'Auto Legal Ltr')	
declare @doc_BI_Reg_Ltr int =(select documentId from Document where documentName = 'BI Reg Ltr')	
declare @doc_Child_Support_Arrearages int =(select documentId from Document where documentName = 'Child Support Arrearages')	
--declare @doc_Collision_Ltr int =(select documentId from Document where documentName = 'Collision Ltr')	
--declare @doc_Conclusion_Ltr int =(select documentId from Document where documentName = 'Conclusion Ltr')	
declare @doc_Demand_for_Limits_Need_Info int =(select documentId from Document where documentName = 'Demand for Limits-Need Info')	
declare @doc_Demand_for_Limits_Need_Time int =(select documentId from Document where documentName = 'Demand for Limits-Need Time')	
--declare @doc_DWI_Ltr int =(select documentId from Document where documentName = 'DWI Ltr')	
declare @doc_ERISA_Lien_No_Claim_Presented int =(select documentId from Document where documentName = 'ERISA Lien-No Claim Presented')	
declare @doc_ERISA_Lien_Threshold_Denial_Ltr int =(select documentId from Document where documentName = 'ERISA Lien-Threshold Denial Ltr')	
declare @doc_ERISA_Proof_Request_Ltr int =(select documentId from Document where documentName = 'ERISA Proof Request Ltr')	
declare @doc_Fatality_Ltr int =(select documentId from Document where documentName = 'Fatality Ltr')	
declare @doc_Fatality_Ltr_to_Atty int =(select documentId from Document where documentName = 'Fatality Ltr to Atty')	
declare @doc_Florida_Ack_to_Atty int =(select documentId from Document where documentName = 'Florida Ack to Atty')	
declare @doc_Hospital_Records_Request_Ltr int =(select documentId from Document where documentName = 'Hospital Records Request Ltr')	
declare @doc_IME_Ltr_Attorney_Represented int =(select documentId from Document where documentName = 'IME Ltr Attorney Represented')	
declare @doc_IME_Ltr_Clmt int =(select documentId from Document where documentName = 'IME Ltr Clmt')	
--declare @doc_Litigation int =(select documentId from Document where documentName = 'Litigation')	
declare @doc_Longworth_Ltr_1_Investigate_Further int =(select documentId from Document where documentName = 'Longworth Ltr 1-Investigate Further')	
declare @doc_Longworth_Ltr_2_UIM_Denial int =(select documentId from Document where documentName = 'Longworth Ltr 2-UIM Denial')	
declare @doc_Longworth_Ltr_3_Acceptance int =(select documentId from Document where documentName = 'Longworth Ltr 3-Acceptance')	
declare @doc_MD_Acceptance_to_Consent_to_Settlement_Offer int =(select documentId from Document where documentName = 'MD Acceptance to Consent to Settlement Offer')	
declare @doc_MD_Refusal_to_Consent_to_Settlement_Offer int =(select documentId from Document where documentName = 'MD Refusal to Consent to Settlement Offer')	
declare @doc_Medical_Records_Request int =(select documentId from Document where documentName = 'Medical Records Request')	
declare @doc_Medicare_Eligibility_Req_Ltr int =(select documentId from Document where documentName = 'Medicare Eligibility Req Ltr' and DocumentType='GCOM  Correspondence Out')	
declare @doc_Mockler_Denial int =(select documentId from Document where documentName = 'Mockler Denial')	
declare @doc_NJ_Child_Support_Judgment_Search_Ltr int =(select documentId from Document where documentName = 'NJ Child Support Judgment Search Ltr')	
declare @doc_NJ_Medical_Bills_Recd_in_BI_Dept int =(select documentId from Document where documentName = 'NJ Medical Bills Recd in BI Dept')	
declare @doc_No_Coverage_Letter int =(select documentId from Document where documentName = 'No Coverage Letter')	
declare @doc_No_Pay_No_Play int =(select documentId from Document where documentName = 'No Pay No Play')	
declare @doc_NY_Denial_Ltr int =(select documentId from Document where documentName = 'NY Denial Ltr')	
declare @doc_NY_Denial_to_Attny int =(select documentId from Document where documentName = 'NY Denial to Attny')	
declare @doc_Out_of_State_Ack_w_Auths int =(select documentId from Document where documentName = 'Out of State Ack w Auths')	
--declare @doc_Out_of_State_Analysis_Ltr int =(select documentId from Document where documentName = 'Out of State Analysis Ltr')	
declare @doc_Out_of_State_Clmt_Inj_No_Attny int =(select documentId from Document where documentName = 'Out of State Clmt Inj No Attny')	
declare @doc_Out_of_State_Clmt_Not_Repr int =(select documentId from Document where documentName = 'Out of State Clmt Not Repr')	
--declare @doc_Out_of_State_Driving_Record_w_Ck int =(select documentId from Document where documentName = 'Out of State Driving Record w Ck')	
--declare @doc_Out_of_State_Driving_Record_wo_Ck int =(select documentId from Document where documentName = 'Out of State Driving Record wo Ck')	
declare @doc_Out_of_State_New_Adj_to_Attny int =(select documentId from Document where documentName = 'Out of State New Adj to Attny')	
declare @doc_PA_Threshold_Denial_to_Atty int =(select documentId from Document where documentName = 'PA Threshold Denial to Atty')	
declare @doc_PA_Threshold_Denial_to_Clmt int =(select documentId from Document where documentName = 'PA Threshold Denial to Clmt')	
declare @doc_PA_UM_UIM_Acknowledgement_Ltr_no_blanks int =(select documentId from Document where documentName = 'PA UM-UIM Acknowledgement Ltr(no blanks)')	
declare @doc_PA_UM_UIM_Acknowledgement_Ltr_with_blanks int =(select documentId from Document where documentName = 'PA UM-UIM Acknowledgement Ltr(with blanks)')	
declare @doc_PA_Waive_Subrogation_Approval_Ltr int =(select documentId from Document where documentName = 'PA Waive Subrogation Approval Ltr')	
declare @doc_Pedestrian_Bicyclist_Ltr int =(select documentId from Document where documentName = 'Pedestrian Bicyclist Ltr')	
declare @doc_PIP_File_Request_Ltr int =(select documentId from Document where documentName = 'PIP File Request Ltr')	
declare @doc_PIP_Subro_Response int =(select documentId from Document where documentName = 'PIP Subro Response')	
declare @doc_Policy_Limit_Request_Compliant int =(select documentId from Document where documentName = 'Policy Limit Request Compliant')	
declare @doc_Policy_Limit_Request_Non_Compliant int =(select documentId from Document where documentName = 'Policy Limit Request Non-Compliant')	
--declare @doc_Req_for_a_Transcript_of_the_Hearing int =(select documentId from Document where documentName = 'Req for a Transcript of the Hearing')	
declare @doc_Status_Ltr int =(select documentId from Document where documentName = 'Status Ltr')
declare @doc_Status_Ltr_w_Authorizations int =(select documentId from Document where documentName = 'Status Ltr w Authorizations')	
--declare @doc_Surgeon_Form int =(select documentId from Document where documentName = 'Surgeon Form')	
--declare @doc_Temporary_Disability_Check int =(select documentId from Document where documentName = 'Temporary Disability Check')	
declare @doc_UIM_Ack_w_Authorization int =(select documentId from Document where documentName = 'UIM Ack w Authorization')	
declare @doc_UM_Ack_w_Authorization int =(select documentId from Document where documentName = 'UM Ack w Authorization')	
declare @doc_Unrepresent_BI_ACAV int =(select documentId from Document where documentName = 'Unrepresent BI ACAV')	
declare @doc_Unrepresent_Statute_Limit int =(select documentId from Document where documentName = 'Unrepresent Statute Limit')	
declare @doc_Unrepresented_BI_Status int =(select documentId from Document where documentName = 'Unrepresented BI Status')	
declare @doc_Unrepresented_Initial_BI_Contact int =(select documentId from Document where documentName = 'Unrepresented Initial BI Contact')	
declare @doc_Wage_Loss_Check int =(select documentId from Document where documentName = 'Wage Loss Check')	
declare @doc_Accept_Coverage_w_Cost_Share_Ltr int =(select documentId from Document where documentName = 'Accept Coverage w Cost Share Ltr')	
declare @doc_After_Sale_Cleanup int =(select documentId from Document where documentName = 'After Sale Cleanup')	
declare @doc_Agree_to_Provide_Coverage int =(select documentId from Document where documentName = 'Agree to Provide Coverage')	
declare @doc_Denial_Above_Ground_Tank int =(select documentId from Document where documentName = 'Denial-Above Ground Tank')	
declare @doc_Denial_AST_Rmval_Rplcmnt_Only int =(select documentId from Document where documentName = 'Denial-AST Rmval Rplcmnt Only')	
declare @doc_Denial_NghbrTankLeak2InsdProp int =(select documentId from Document where documentName = 'Denial-NghbrTankLeak2InsdProp')	
declare @doc_Denial_Standard int =(select documentId from Document where documentName = 'Denial-Standard')	
declare @doc_Denial_Tank_Rmval_Rplcmnt_Only int =(select documentId from Document where documentName = 'Denial-Tank Rmval Rplcmnt Only')	
declare @doc_ROR_Above_Ground_Tank int =(select documentId from Document where documentName = 'ROR-Above Ground Tank')	
declare @doc_ROR_Post_Sale_Coverage int =(select documentId from Document where documentName = 'ROR-Post Sale Coverage')	
declare @doc_ROR_Prior_Owner int =(select documentId from Document where documentName = 'ROR-Prior Owner')	
declare @doc_ROR_Underground_Tank int =(select documentId from Document where documentName = 'ROR-Underground Tank')	
declare @doc_UST_Denial_Declined_Tank_Liab_Endrs int =(select documentId from Document where documentName = 'UST Denial Declined Tank Liab Endrs')	
declare @doc_Denial_Excluded_Driver int =(select documentId from Document where documentName = 'Denial-Excluded Driver')	
declare @doc_Denial_General int =(select documentId from Document where documentName = 'Denial-General')	
declare @doc_Denial_Lapse_in_Coverage int =(select documentId from Document where documentName = 'Denial-Lapse in Coverage')	
declare @doc_Denial_Mine_Subsidence int =(select documentId from Document where documentName = 'Denial-Mine Subsidence')	
declare @doc_Denial_Pol_Not_in_Force int =(select documentId from Document where documentName = 'Denial-Pol Not in Force')	
declare @doc_Denial_Veh_Not_Described_on_Policy int =(select documentId from Document where documentName = 'Denial-Veh Not Described on Policy')	
declare @doc_Denial_Veh_Removed_Prior_to_Loss int =(select documentId from Document where documentName = 'Denial-Veh Removed Prior to Loss')	
declare @doc_No_Coverage___Medical int =(select documentId from Document where documentName = 'No Coverage - Medical')	
declare @doc_No_Coverage___Personal_Comm_Rental int =(select documentId from Document where documentName = 'No Coverage - Personal-Comm-Rental')	
--declare @doc_Under_Ded_Comp int =(select documentId from Document where documentName = 'Under Ded Comp')	
declare @doc_Additional_Information_Form int =(select documentId from Document where documentName = 'Additional Information Form')	
declare @doc_Appraisal_Request int =(select documentId from Document where documentName = 'Appraisal Request')	
--declare @doc_Authorization_Driving_Record int =(select documentId from Document where documentName = 'Authorization-Driving Record')	
declare @doc_Authorization_Medical int =(select documentId from Document where documentName = 'Authorization-Medical')	
declare @doc_Authorization_PIP_Claim int =(select documentId from Document where documentName = 'Authorization-PIP Claim')	
--declare @doc_Authorization_Temp_Disability int =(select documentId from Document where documentName = 'Authorization-Temp Disability')	
declare @doc_Authorization_Wage_Loss int =(select documentId from Document where documentName = 'Authorization-Wage Loss')	
--declare @doc_Auto_Payment_Request_Form int =(select documentId from Document where documentName = 'Auto Payment Request Form')	
--declare @doc_BI_UIM_Buyout_Preserve_Rts int =(select documentId from Document where documentName = 'BI UIM Buyout-Preserve Rts')	
--declare @doc_BI_UM_UIM_Settle_Agree int =(select documentId from Document where documentName = 'BI UM-UIM Settle Agree')	
--declare @doc_BI_PD_UM_UIM_Settle_Agree int =(select documentId from Document where documentName = 'BI-PD UM-UIM Settle Agree')	
declare @doc_HIPAA_Authorization int =(select documentId from Document where documentName = 'HIPAA Authorization')	
declare @doc_IME_Enclosure int =(select documentId from Document where documentName = 'IME Enclosure')	
--declare @doc_Inquiry_Form int =(select documentId from Document where documentName = 'Inquiry Form')	
declare @doc_Issue_Resolution_Request_Form int =(select documentId from Document where documentName = 'Issue Resolution Request Form')	
declare @doc_Request_for_Scene_Photos int =(select documentId from Document where documentName = 'Request for Scene Photos')	
declare @doc_SIU_Referral_PIP_Eligibility int =(select documentId from Document where documentName = 'SIU Referral-PIP Eligibility')	
declare @doc_SIU_Referral_PIP_BI_MUD int =(select documentId from Document where documentName = 'SIU Referral-PIP-BI-MUD')	
--declare @doc_Supplementary_Wage_Verification int =(select documentId from Document where documentName = 'Supplementary Wage Verification')	
declare @doc_ACAV int =(select documentId from Document where documentName = 'ACAV')	
declare @doc_Cooperation_Ltr int =(select documentId from Document where documentName = 'Cooperation Ltr')	
declare @doc_Damage_Ltr int =(select documentId from Document where documentName = 'Damage Ltr')	
declare @doc_Excess_Umbrella_Carrier_Notice int =(select documentId from Document where documentName = 'Excess-Umbrella Carrier Notice')	
declare @doc_Hold_Harmless_Ltr int =(select documentId from Document where documentName = 'Hold Harmless Ltr')	
declare @doc_Ltr_to_Call int =(select documentId from Document where documentName = 'Ltr to Call')	
declare @doc_New_Adjuster_Status int =(select documentId from Document where documentName = 'New Adjuster Status')	
--declare @doc_Photo_Request_Ltr int =(select documentId from Document where documentName = 'Photo Request Ltr')	
declare @doc_Plea_and_Outcome int =(select documentId from Document where documentName = 'Plea and Outcome')	
declare @doc_Request_for_Photos_or_Video int =(select documentId from Document where documentName = 'Request for Photos or Video')	
declare @doc_Reservation_of_Rights int =(select documentId from Document where documentName = 'Reservation of Rights')	
declare @doc_Scene_Photos_Mark_up int =(select documentId from Document where documentName = 'Scene Photos Mark-up')	
declare @doc_Tax_ID_Num_Request_Ltr int =(select documentId from Document where documentName = 'Tax ID Num Request Ltr')	
declare @doc_UMC_Ltr_to_Clmt int =(select documentId from Document where documentName = 'UMC Ltr to Clmt')	
declare @doc_UMC_Ltr_to_Insd int =(select documentId from Document where documentName = 'UMC Ltr to Insd')	
declare @doc_Witness_Ltr int =(select documentId from Document where documentName = 'Witness Ltr')	
declare @doc_Adjusters_Settlement_Summary_Ltr int =(select documentId from Document where documentName = 'Adjusters Settlement Summary Ltr')	
declare @doc_CAT_Sump_Or_Backup_Ltr int =(select documentId from Document where documentName = 'CAT Sump Or Backup Ltr')	
declare @doc_Conditions_and_Duties int =(select documentId from Document where documentName = 'Conditions and Duties')	
declare @doc_Contact_Ltr int =(select documentId from Document where documentName = 'Contact Ltr')	
declare @doc_Covered_proof_and_Denial int =(select documentId from Document where documentName = 'Covered proof and Denial')	
declare @doc_DE_HO_Reg_Ltr int =(select documentId from Document where documentName = 'DE HO Reg Ltr')	
declare @doc_Denial_and_Covered_Under_Ded int =(select documentId from Document where documentName = 'Denial and Covered Under Ded')	
declare @doc_Denial_Failed_to_Complete_Repairs int =(select documentId from Document where documentName = 'Denial-Failed to Complete Repairs')	
declare @doc_DL02 int =(select documentId from Document where documentName = 'DL02')	
declare @doc_DL03 int =(select documentId from Document where documentName = 'DL03')	
declare @doc_DL04a int =(select documentId from Document where documentName = 'DL04a')	
declare @doc_DL04b int =(select documentId from Document where documentName = 'DL04b')	
declare @doc_DL05 int =(select documentId from Document where documentName = 'DL05')	
declare @doc_DL06a int =(select documentId from Document where documentName = 'DL06a')	
declare @doc_DL07a int =(select documentId from Document where documentName = 'DL07a')	
declare @doc_DL08 int =(select documentId from Document where documentName = 'DL08')	
declare @doc_DL09 int =(select documentId from Document where documentName = 'DL09')	
declare @doc_DL10 int =(select documentId from Document where documentName = 'DL10')	
declare @doc_DL11 int =(select documentId from Document where documentName = 'DL11')	
declare @doc_DL12 int =(select documentId from Document where documentName = 'DL12')	
declare @doc_DL15a int =(select documentId from Document where documentName = 'DL15a')	
declare @doc_DL15b int =(select documentId from Document where documentName = 'DL15b')	
declare @doc_DL16 int =(select documentId from Document where documentName = 'DL16')	
declare @doc_DL17 int =(select documentId from Document where documentName = 'DL17')	
declare @doc_DL18 int =(select documentId from Document where documentName = 'DL18')	
declare @doc_DL20 int =(select documentId from Document where documentName = 'DL20')	
declare @doc_DL21 int =(select documentId from Document where documentName = 'DL21')	
declare @doc_DL22 int =(select documentId from Document where documentName = 'DL22')	
declare @doc_DL23 int =(select documentId from Document where documentName = 'DL23')	
declare @doc_DL24 int =(select documentId from Document where documentName = 'DL24')	
declare @doc_DL25 int =(select documentId from Document where documentName = 'DL25')	
declare @doc_DL25a int =(select documentId from Document where documentName = 'DL25a')	
declare @doc_DL26a int =(select documentId from Document where documentName = 'DL26a')	
declare @doc_DL26b int =(select documentId from Document where documentName = 'DL26b')	
declare @doc_DL29a int =(select documentId from Document where documentName = 'DL29a')	
declare @doc_DL29b int =(select documentId from Document where documentName = 'DL29b')	
declare @doc_DL29c int =(select documentId from Document where documentName = 'DL29c')	
declare @doc_DL30 int =(select documentId from Document where documentName = 'DL30')	
declare @doc_Document_Request_Ltr int =(select documentId from Document where documentName = 'Document Request Ltr')	
declare @doc_DP2_No_Peril_Denial int =(select documentId from Document where documentName = 'DP2 No Peril Denial')	
declare @doc_Endorsed_Jewel_Fur_Ltr int =(select documentId from Document where documentName = 'Endorsed Jewel-Fur Ltr')	
--declare @doc_Estimate_Ltr int =(select documentId from Document where documentName = 'Estimate Ltr')	
declare @doc_Estimate_Needed int =(select documentId from Document where documentName = 'Estimate Needed')	
declare @doc_Foreclosure_Claim_Ltr int =(select documentId from Document where documentName = 'Foreclosure Claim Ltr')	
declare @doc_Freeze_Loss_Questionnaire int =(select documentId from Document where documentName = 'Freeze Loss Questionnaire')	
declare @doc_HO_Pub_Adj_Rep_Ltr int =(select documentId from Document where documentName = 'HO Pub Adj Rep Ltr')	
declare @doc_HO6_Broker_HOA_Ltr int =(select documentId from Document where documentName = 'HO6 Broker HOA Ltr')	
declare @doc_HO6_Master_Policy_Ltr int =(select documentId from Document where documentName = 'HO6 Master Policy Ltr')	
declare @doc_HO6_Other_Ins_Ltr int =(select documentId from Document where documentName = 'HO6 Other Ins Ltr')	
--declare @doc_HSP_SL_Notice_of_Loss int =(select documentId from Document where documentName = 'HSP-SL Notice of Loss')	
declare @doc_Inventory_Follow_up_Ltr int =(select documentId from Document where documentName = 'Inventory Follow-up Ltr')	
declare @doc_Loss_of_Use_Ltr int =(select documentId from Document where documentName = 'Loss of Use Ltr')	
declare @doc_MD_HO_Reg_Ltr int =(select documentId from Document where documentName = 'MD HO Reg Ltr')	
declare @doc_NJ_Appraisal_Denial_Ltr int =(select documentId from Document where documentName = 'NJ Appraisal Denial Ltr')	
declare @doc_NJ_HO_Reg_Ltr int =(select documentId from Document where documentName = 'NJ HO Reg Ltr')	
declare @doc_No_Damage_Ltr int =(select documentId from Document where documentName = 'No Damage Ltr')	
declare @doc_Notice_of_Payment int =(select documentId from Document where documentName = 'Notice of Payment')	
declare @doc_NY_HO_Reg_Ltr int =(select documentId from Document where documentName = 'NY HO Reg Ltr')	
declare @doc_OH_HO_Reg_Ltr int =(select documentId from Document where documentName = 'OH HO Reg Ltr')	
declare @doc_PA_Appraisal_Denial_Ltr int =(select documentId from Document where documentName = 'PA Appraisal Denial Ltr')	
declare @doc_PA_HO_Reg_Ltr int =(select documentId from Document where documentName = 'PA HO Reg Ltr')	
declare @doc_Police_Dept_Recovery_Ltr int =(select documentId from Document where documentName = 'Police Dept Recovery Ltr')	
declare @doc_Proof_of_Loss int =(select documentId from Document where documentName = 'Proof of Loss')	
declare @doc_Public_Adjuster_Contract_Ltr int =(select documentId from Document where documentName = 'Public Adjuster Contract Ltr')	
declare @doc_Reasonable_and_Fair_Ltr int =(select documentId from Document where documentName = 'Reasonable and Fair Ltr')	
declare @doc_Recoverable_Deprec_Ltr int =(select documentId from Document where documentName = 'Recoverable Deprec Ltr')	
--declare @doc_Reinspection_Ltr int =(select documentId from Document where documentName = 'Reinspection Ltr')	
declare @doc_ROR_HO95 int =(select documentId from Document where documentName = 'ROR-HO95')	
declare @doc_ROR_HO95x int =(select documentId from Document where documentName = 'ROR-HO95x')	
declare @doc_Theft_Ltr int =(select documentId from Document where documentName = 'Theft Ltr')	
declare @doc_Undisputed_Proof_Rejection_Ltr int =(select documentId from Document where documentName = 'Undisputed Proof Rejection Ltr')	
declare @doc_Withdraw_Claim_Ltr int =(select documentId from Document where documentName = 'Withdraw Claim Ltr')	
declare @doc_1000_5000_Ltr int =(select documentId from Document where documentName = '1000-5000 Ltr')	
--declare @doc_Check_Ltr int =(select documentId from Document where documentName = 'Check Ltr')	
declare @doc_Cooperation_Ltr_1st_Adjuster int =(select documentId from Document where documentName = 'Cooperation Ltr 1st-Adjuster')	
declare @doc_Cooperation_Ltr_1st_Attorney int =(select documentId from Document where documentName = 'Cooperation Ltr 1st-Attorney')	
declare @doc_Cooperation_Ltr_2nd_Adjuster int =(select documentId from Document where documentName = 'Cooperation Ltr 2nd-Adjuster')	
declare @doc_Correspondence_Ltr int =(select documentId from Document where documentName = 'Correspondence Ltr')	
declare @doc_Demand_for_Arb int =(select documentId from Document where documentName = 'Demand for Arb')	
declare @doc_Double_Dipper int =(select documentId from Document where documentName = 'Double Dipper')	
declare @doc_Excess_Ltr int =(select documentId from Document where documentName = 'Excess Ltr')	
declare @doc_First_Notice_of_Lawsuit int =(select documentId from Document where documentName = 'First Notice of Lawsuit')	
declare @doc_Florida_Response_Letter int =(select documentId from Document where documentName = 'Florida Response Letter')	
declare @doc_HO_Denial_Intra_Family_Exclusion int =(select documentId from Document where documentName = 'HO Denial-Intra Family Exclusion')	
declare @doc_Insd_Contact_Ltr_Suit int =(select documentId from Document where documentName = 'Insd Contact Ltr-Suit')	
declare @doc_Blank_Memo int =(select documentId from Document where documentName = 'Blank Memo')	
--declare @doc_Memo_to_Defense_Counsel int =(select documentId from Document where documentName = 'Memo to Defense Counsel')	
--declare @doc_Memo_to_FILE int =(select documentId from Document where documentName = 'Memo to FILE')	
declare @doc_72_Hour_Ltr int =(select documentId from Document where documentName = '72 Hour Ltr')	
declare @doc_750_Ltr int =(select documentId from Document where documentName = '750 Ltr')	
declare @doc_Affidavit_No_Ins_w_NJ_PIP_App_Attny int =(select documentId from Document where documentName = 'Affidavit-No Ins w NJ PIP App-Attny')	
declare @doc_Affidavit_No_Ins_w_NJ_PIP_App_Clmt int =(select documentId from Document where documentName = 'Affidavit-No Ins w NJ PIP App-Clmt')	
declare @doc_Affidavit_No_Ins_w_PA_PIP_App_Attny int =(select documentId from Document where documentName = 'Affidavit-No Ins w PA PIP App-Attny')	
declare @doc_Affidavit_No_Ins_w_PA_PIP_App_Clmt int =(select documentId from Document where documentName = 'Affidavit-No Ins w PA PIP App-Clmt')	
declare @doc_Affidavit_No_Ins_wo_PIP_App_Attny int =(select documentId from Document where documentName = 'Affidavit-No Ins wo PIP App-Attny')	
declare @doc_Affidavit_No_Ins_wo_PIP_App_Clmt int =(select documentId from Document where documentName = 'Affidavit-No Ins wo PIP App-Clmt')	
declare @doc_Appeal_Invalid_Appeal_No_Docs int =(select documentId from Document where documentName = 'Appeal Invalid Appeal No Docs')	
--declare @doc_Appeal_Response_Horizon int =(select documentId from Document where documentName = 'Appeal Response-Horizon')	
--declare @doc_Appeal_Settlement_Proposal_Ltr int =(select documentId from Document where documentName = 'Appeal Settlement Proposal Ltr')	
declare @doc_Approaching_Policy_Limits_Ltr int =(select documentId from Document where documentName = 'Approaching Policy Limits Ltr')	
--declare @doc_Audit_Report int =(select documentId from Document where documentName = 'Audit Report')	
declare @doc_Auth_Needed_for_Information int =(select documentId from Document where documentName = 'Auth Needed for Information')	
declare @doc_Authorization_2 int =(select documentId from Document where documentName = 'Authorization 2')	
declare @doc_Balance_Billing_Ltr int =(select documentId from Document where documentName = 'Balance Billing Ltr')	
declare @doc_Bill_by_Date_CPT int =(select documentId from Document where documentName = 'Bill by Date CPT')	
declare @doc_Charge_for_Copies_Precharge_Ltr int =(select documentId from Document where documentName = 'Charge for Copies-Precharge Ltr')	
declare @doc_Claim_Acceptance_Letter int =(select documentId from Document where documentName = 'Claim Acceptance Letter')	
declare @doc_Combined_CPT_and_W9_Letter int =(select documentId from Document where documentName = 'Combined CPT and W9 Letter')	
declare @doc_Concurrent_Info_Request int =(select documentId from Document where documentName = 'Concurrent Info Request')	
declare @doc_Conversion_Memo int =(select documentId from Document where documentName = 'Conversion Memo')	
declare @doc_Coverage_14_Day_Notice int =(select documentId from Document where documentName = 'Coverage 14 Day Notice')	
declare @doc_CT_Explain_Letter int =(select documentId from Document where documentName = 'CT Explain Letter')	
declare @doc_CT_Motorcycle_Denial int =(select documentId from Document where documentName = 'CT Motorcycle Denial')	
declare @doc_CT_SOL int =(select documentId from Document where documentName = 'CT SOL')	
declare @doc_CT_WC_Denial_Letter int =(select documentId from Document where documentName = 'CT WC Denial Letter')	
declare @doc_DE_Denial___Excess_Coverage int =(select documentId from Document where documentName = 'DE Denial - Excess Coverage')	
declare @doc_DE_Denial___Policy_Exclusion int =(select documentId from Document where documentName = 'DE Denial - Policy Exclusion')	
declare @doc_DE_Explain_Ltr int =(select documentId from Document where documentName = 'DE Explain Ltr')	
declare @doc_DE_Statute_of_Limitations_Ltr int =(select documentId from Document where documentName = 'DE Statute of Limitations Ltr')	
declare @doc_Death_Explain_Letter int =(select documentId from Document where documentName = 'Death Explain Letter')	
declare @doc_Death_Letter_Death_Wage_Exclusion int =(select documentId from Document where documentName = 'Death Letter Death Wage Exclusion')	
declare @doc_Delay_Ltr_21_Day_Notice int =(select documentId from Document where documentName = 'Delay Ltr-21 Day Notice')	
declare @doc_Delay_Ltr_45_Day int =(select documentId from Document where documentName = 'Delay Ltr-45 Day')	
declare @doc_Denial___Assault int =(select documentId from Document where documentName = 'Denial - Assault')	
declare @doc_Denial___NonCompliance_IME int =(select documentId from Document where documentName = 'Denial - NonCompliance IME')	
declare @doc_Denial_Investigation int =(select documentId from Document where documentName = 'Denial Investigation')	
declare @doc_Denial_Pedestrian_PIP int =(select documentId from Document where documentName = 'Denial Pedestrian PIP')	
declare @doc_Denial_Provider_No_PIP_App int =(select documentId from Document where documentName = 'Denial Provider No PIP App')	
declare @doc_Denial_Returned_Bill int =(select documentId from Document where documentName = 'Denial Returned Bill')	
declare @doc_Denial_Health_Care_Primary int =(select documentId from Document where documentName = 'Denial-Health Care Primary')	
declare @doc_Denial_Household_Insurance int =(select documentId from Document where documentName = 'Denial-Household Insurance')	
declare @doc_Denial_Intentional_Act int =(select documentId from Document where documentName = 'Denial-Intentional Act')	
declare @doc_Denial_PLIGA int =(select documentId from Document where documentName = 'Denial-PLIGA')	
declare @doc_Denial_Stranger_Pedestrian int =(select documentId from Document where documentName = 'Denial-Stranger Pedestrian')	
declare @doc_Deny_Subro int =(select documentId from Document where documentName = 'Deny Subro')	
declare @doc_Dependent_Survivor_Benefits int =(select documentId from Document where documentName = 'Dependent Survivor Benefits')	
declare @doc_Disability_Stmt_from_Doctor int =(select documentId from Document where documentName = 'Disability Stmt from Doctor')	
declare @doc_DPR_Plan_IME_2_Attorney int =(select documentId from Document where documentName = 'DPR Plan IME 2 Attorney')	
declare @doc_DPR_Plan_IME_2_Clmt int =(select documentId from Document where documentName = 'DPR Plan IME 2 Clmt')	
declare @doc_DPR_Plan_IME_Attorney int =(select documentId from Document where documentName = 'DPR Plan IME Attorney')	
declare @doc_DPR_Plan_IME_Clmt int =(select documentId from Document where documentName = 'DPR Plan IME Clmt')	
declare @doc_DPR_Plan_IME_NonCompliance_Attny int =(select documentId from Document where documentName = 'DPR Plan IME NonCompliance-Attny')	
declare @doc_DPR_Plan_IME_NonCompliance_Clmt int =(select documentId from Document where documentName = 'DPR Plan IME NonCompliance-Clmt')	
declare @doc_DPR_Response_Form int =(select documentId from Document where documentName = 'DPR Response Form')	
declare @doc_DPR_Response_Form_IME int =(select documentId from Document where documentName = 'DPR Response Form IME')	
declare @doc_Enclose_Bill_Request_Results int =(select documentId from Document where documentName = 'Enclose Bill Request Results')	
declare @doc_Essential_Service_Cover_Ltr int =(select documentId from Document where documentName = 'Essential Service Cover Ltr')	
declare @doc_Explain_Ltr_Precert_Inj_Party int =(select documentId from Document where documentName = 'Explain Ltr-Precert Inj Party')	
declare @doc_File_Transfer_Ltr int =(select documentId from Document where documentName = 'File Transfer Ltr')	
--declare @doc_Formal_Demand_Ltr int =(select documentId from Document where documentName = 'Formal Demand Ltr')	
declare @doc_FPB_Closure_Letter int =(select documentId from Document where documentName = 'FPB Closure Letter')	
declare @doc_Health_Insurance_Primary int =(select documentId from Document where documentName = 'Health Insurance Primary')	
declare @doc_Health_Primary int =(select documentId from Document where documentName = 'Health Primary')	
declare @doc_HIP_Explain_Ltr_Precert_Inj_Party int =(select documentId from Document where documentName = 'HIP Explain Ltr-Precert Inj Party')	
declare @doc_IME_Cancellation_Ltr int =(select documentId from Document where documentName = 'IME Cancellation Ltr')	
declare @doc_IME_NonCompliance_Claimant_or_Attorney int =(select documentId from Document where documentName = 'IME NonCompliance-Claimant or Attorney')	
declare @doc_IME_Questionnaire int =(select documentId from Document where documentName = 'IME Questionnaire')	
declare @doc_Lien_Asking_for_Ledger int =(select documentId from Document where documentName = 'Lien Asking for Ledger')	
declare @doc_Lien_Ltr int =(select documentId from Document where documentName = 'Lien Ltr')	
declare @doc_Massage_Therapy_By_CMT_Denial_Ltr int =(select documentId from Document where documentName = 'Massage Therapy By CMT Denial Ltr')	
declare @doc_MD_Denial_12_Months_Ltr int =(select documentId from Document where documentName = 'MD Denial 12 Months Ltr')	
declare @doc_MD_Denial_Letter int =(select documentId from Document where documentName = 'MD Denial Letter')	
declare @doc_MD_Explain_Ltr int =(select documentId from Document where documentName = 'MD Explain Ltr')	
declare @doc_MD_SOL_Letter int =(select documentId from Document where documentName = 'MD SOL Letter')	
declare @doc_Med_Pay_Death_Letter int =(select documentId from Document where documentName = 'Med Pay Death Letter')	
declare @doc_Med_Pay_Ltr int =(select documentId from Document where documentName = 'Med Pay Ltr')	
declare @doc_Med_Pay_Ltr___School_and_Church_Buses int =(select documentId from Document where documentName = 'Med Pay Ltr - School and Church Buses')	
declare @doc_Med_Pay_Denial_Regular_Use int =(select documentId from Document where documentName = 'Med Pay-Denial Regular Use')	
declare @doc_Med_Pay_Denial_Workers_Comp int =(select documentId from Document where documentName = 'Med Pay-Denial Workers Comp')	
declare @doc_Medical_Report_Request int =(select documentId from Document where documentName = 'Medical Report Request')	
declare @doc_Medicare int =(select documentId from Document where documentName = 'Medicare')	
declare @doc_MSPRC_Ltr int =(select documentId from Document where documentName = 'MSPRC Ltr')	
declare @doc_New_York_Benefits_Reached int =(select documentId from Document where documentName = 'New York Benefits Reached')	
declare @doc_New_York_Denial int =(select documentId from Document where documentName = 'New York Denial')	
declare @doc_NJ_Delay_Insured_P1 int =(select documentId from Document where documentName = 'NJ Delay Insured P1')	
declare @doc_NJ_Unacceptable_PIP1 int =(select documentId from Document where documentName = 'NJ Unacceptable PIP1')	
declare @doc_No_Coverage_14_Day_Notice int =(select documentId from Document where documentName = 'No Coverage 14 Day Notice')	
declare @doc_No_Coverage_Ltr int =(select documentId from Document where documentName = 'No Coverage Ltr')	
declare @doc_No_Wage_Attorney int =(select documentId from Document where documentName = 'No Wage Attorney')	
declare @doc_No_Wage_Loss_Reimbursement_Clmt int =(select documentId from Document where documentName = 'No Wage Loss Reimbursement-Clmt')	
declare @doc_NY_2nd_Notice_Ltr_Injured_Party int =(select documentId from Document where documentName = 'NY 2nd Notice Ltr-Injured Party')	
declare @doc_NY_APIP_Subro_Agreement_Ltr int =(select documentId from Document where documentName = 'NY APIP Subro Agreement Ltr')	
declare @doc_NY_Coverage_Ltr int =(select documentId from Document where documentName = 'NY Coverage Ltr')	
declare @doc_NY_Delay_Insured_P1 int =(select documentId from Document where documentName = 'NY Delay Insured P1')	
declare @doc_NY_Denial_Work_Comp int =(select documentId from Document where documentName = 'NY Denial Work Comp')	
declare @doc_NY_Employers_Wage_Ver_Rpt int =(select documentId from Document where documentName = 'NY Employers Wage Ver Rpt')	
declare @doc_NY_Initial_Wage_Loss_Explain int =(select documentId from Document where documentName = 'NY Initial Wage Loss Explain')	
declare @doc_NY_OBEL_Election_Ltr int =(select documentId from Document where documentName = 'NY OBEL Election Ltr')	
declare @doc_NY_Provider_Coverage_Ltr int =(select documentId from Document where documentName = 'NY Provider Coverage Ltr')	
declare @doc_NY_Unacceptable_PIP1 int =(select documentId from Document where documentName = 'NY Unacceptable PIP1')	
declare @doc_ODS_Explain_Ltr int =(select documentId from Document where documentName = 'ODS Explain Ltr')	
declare @doc_OH_60_Day_Notification_of_SOL int =(select documentId from Document where documentName = 'OH 60 Day Notification of SOL')	
declare @doc_OH_Denial_Letter int =(select documentId from Document where documentName = 'OH Denial Letter')	
declare @doc_PA_Delay_Insured_P1 int =(select documentId from Document where documentName = 'PA Delay Insured P1')	
declare @doc_PA_Explain_Ltr int =(select documentId from Document where documentName = 'PA Explain Ltr')	
declare @doc_PA_Ltr_of_Medical_Determination int =(select documentId from Document where documentName = 'PA Ltr of Medical Determination')	
declare @doc_PA_ProReview_Ltr_to_Provider int =(select documentId from Document where documentName = 'PA ProReview Ltr to Provider')	
declare @doc_PA_Reconsideration_Ltr int =(select documentId from Document where documentName = 'PA Reconsideration Ltr')	
declare @doc_PA_Unable_to_Contact_Ltr int =(select documentId from Document where documentName = 'PA Unable to Contact Ltr')	
declare @doc_PA_Unacceptable_PIP1 int =(select documentId from Document where documentName = 'PA Unacceptable PIP1')	
declare @doc_PA_Victims_of_Domestic_Abuse_Ltr int =(select documentId from Document where documentName = 'PA Victims of Domestic Abuse Ltr')	
--declare @doc_Past_21_Day_Ltr int =(select documentId from Document where documentName = 'Past 21 Day Ltr')	
declare @doc_Paysheet_Enclosed int =(select documentId from Document where documentName = 'Paysheet Enclosed')	
declare @doc_Peer_Report int =(select documentId from Document where documentName = 'Peer Report')	
--declare @doc_Pennsylvania_Benefits_Reached int =(select documentId from Document where documentName = 'Pennsylvania Benefits Reached')	
declare @doc_PIP_Hospital_Record_Request int =(select documentId from Document where documentName = 'PIP Hospital Record Request')	
declare @doc_PIP_Peer_Review_Request int =(select documentId from Document where documentName = 'PIP Peer Review Request')	
declare @doc_PIP_Reservation_of_Rights int =(select documentId from Document where documentName = 'PIP Reservation of Rights')	
declare @doc_Policy_Limits_All_States int =(select documentId from Document where documentName = 'Policy Limits All States')	
declare @doc_Precert_Coverage_Undetermined int =(select documentId from Document where documentName = 'Precert-Coverage Undetermined')	
declare @doc_Precertification_Health_Primary int =(select documentId from Document where documentName = 'Precertification Health Primary')	
declare @doc_Provider_Cover_Ltr int =(select documentId from Document where documentName = 'Provider Cover Ltr')	
declare @doc_Record_Request_Audit_Delay_Ltr int =(select documentId from Document where documentName = 'Record Request-Audit Delay Ltr')	
declare @doc_Records_Req_Ltr_to_Provider int =(select documentId from Document where documentName = 'Records Req Ltr to Provider')	
declare @doc_Refund_Request int =(select documentId from Document where documentName = 'Refund Request')	
declare @doc_Reg_Ltr int =(select documentId from Document where documentName = 'Reg Ltr')	
declare @doc_Reparations_Replacement_Service int =(select documentId from Document where documentName = 'Reparations Replacement Service')	
declare @doc_Representation_Acknowledged int =(select documentId from Document where documentName = 'Representation Acknowledged')	
declare @doc_Reservation_of_Rights_Multi_State int =(select documentId from Document where documentName = 'Reservation of Rights-Multi State')	
declare @doc_Statute_of_Limitations_2yr_1st_Pymt int =(select documentId from Document where documentName = 'Statute of Limitations 2yr-1st Pymt')	
declare @doc_Submit_Bills_to_Own_Carrier int =(select documentId from Document where documentName = 'Submit Bills to Own Carrier')	
declare @doc_Thirty_Day_Ltr int =(select documentId from Document where documentName = 'Thirty Day Ltr')	
declare @doc_TOB_Ltr int =(select documentId from Document where documentName = 'TOB Ltr')	
declare @doc_TOB_Specialty_Ltr int =(select documentId from Document where documentName = 'TOB-Specialty Ltr')	
declare @doc_UC_321 int =(select documentId from Document where documentName = 'UC 321')	
declare @doc_Unable_to_Contact int =(select documentId from Document where documentName = 'Unable to Contact')	
declare @doc_Unable_to_Contact_Re_Minor int =(select documentId from Document where documentName = 'Unable to Contact Re Minor')	
declare @doc_Wage_and_Salary_Verification_Multi_State int =(select documentId from Document where documentName = 'Wage and Salary Verification-Multi State')	
declare @doc_Wage_Explain int =(select documentId from Document where documentName = 'Wage-Explain')	
declare @doc_Wages_Limit_Reached_Approaching int =(select documentId from Document where documentName = 'Wages Limit Reached-Approaching')	
declare @doc_Workers_Comp int =(select documentId from Document where documentName = 'Workers Comp')	
declare @doc_10_Day_Will_Pay_Ltr int =(select documentId from Document where documentName = '10 Day Will Pay Ltr')	
--declare @doc_Basic_No_Ordinance_Ltr int =(select documentId from Document where documentName = 'Basic No Ordinance Ltr')	
--declare @doc_Basic_with_Ordinance_Ltr int =(select documentId from Document where documentName = 'Basic with Ordinance Ltr')	
declare @doc_Certification_of_Automobile_Repair int =(select documentId from Document where documentName = 'Certification of Automobile Repair')	
--declare @doc_Chain_Title int =(select documentId from Document where documentName = 'Chain Title')	
--declare @doc_Clmt_Report int =(select documentId from Document where documentName = 'Clmt Report')	
declare @doc_Damage_to_Property int =(select documentId from Document where documentName = 'Damage to Property')	
declare @doc_DE_Reg_Ltr int =(select documentId from Document where documentName = 'DE Reg Ltr')	
declare @doc_Delete_Coverage int =(select documentId from Document where documentName = 'Delete Coverage')	
declare @doc_Delete_Insd_Name_From_Ck int =(select documentId from Document where documentName = 'Delete Insd Name From Ck')	
declare @doc_Denial_Claimant int =(select documentId from Document where documentName = 'Denial Claimant')	
declare @doc_Denial_Diminished_Value__1st_Party int =(select documentId from Document where documentName = 'Denial Diminished Value- 1st Party')	
declare @doc_Denial_Diminished_Value__3rd_Party int =(select documentId from Document where documentName = 'Denial Diminished Value- 3rd Party')	
declare @doc_Denial_Emergency_Response_Costs_Ltr int =(select documentId from Document where documentName = 'Denial Emergency Response Costs Ltr')	
declare @doc_Denial_Partial__Auto int =(select documentId from Document where documentName = 'Denial Partial- Auto')	
declare @doc_Denial_to_Attorney_or_Company int =(select documentId from Document where documentName = 'Denial to Attorney or Company')	
declare @doc_Denial_to_Insd__PD int =(select documentId from Document where documentName = 'Denial to Insd- PD')	
declare @doc_Enterprise_Proofs int =(select documentId from Document where documentName = 'Enterprise Proofs')	
declare @doc_Impound_Facility_No_Storage_Fees int =(select documentId from Document where documentName = 'Impound Facility No Storage Fees')	
declare @doc_Insd_Incident_Report int =(select documentId from Document where documentName = 'Insd Incident Report')	
declare @doc_Low_Limits_Ltr_Clmt int =(select documentId from Document where documentName = 'Low Limits Ltr-Clmt')	
declare @doc_Low_Limits_Ltr_Insd int =(select documentId from Document where documentName = 'Low Limits Ltr-Insd')	
declare @doc_Ltr_of_Compromise int =(select documentId from Document where documentName = 'Ltr of Compromise')	
declare @doc_MD_Reg_Ltr int =(select documentId from Document where documentName = 'MD Reg Ltr')	
declare @doc_NJ_Reg_Ltr int =(select documentId from Document where documentName = 'NJ Reg Ltr')	
--declare @doc_NJTPK_GSP_Tow_Ltr int =(select documentId from Document where documentName = 'NJTPK-GSP Tow Ltr')	
declare @doc_Notice_of_Rights_Ltr int =(select documentId from Document where documentName = 'Notice of Rights Ltr')	
--declare @doc_Notification_of_Salvage_Facility int =(select documentId from Document where documentName = 'Notification of Salvage Facility')	
--declare @doc_Notification_of_Storage_Facility int =(select documentId from Document where documentName = 'Notification of Storage Facility')	
declare @doc_NY_Fire_District_Ltr int =(select documentId from Document where documentName = 'NY Fire District Ltr')	
declare @doc_NY_Reg_Ltr int =(select documentId from Document where documentName = 'NY Reg Ltr')	
declare @doc_OH_Reg_Ltr int =(select documentId from Document where documentName = 'OH Reg Ltr')	
declare @doc_PA_Reg_Ltr int =(select documentId from Document where documentName = 'PA Reg Ltr')	
declare @doc_PA_TL_Evaluation_Notification int =(select documentId from Document where documentName = 'PA TL Evaluation Notification')	
declare @doc_Payoff_LOG_Request_Ltr int =(select documentId from Document where documentName = 'Payoff LOG Request Ltr')	
declare @doc_Public_Entity_Immunity_Ltr int =(select documentId from Document where documentName = 'Public Entity Immunity Ltr')	
--declare @doc_Rental_Comp_Coll int =(select documentId from Document where documentName = 'Rental Comp-Coll')	
declare @doc_Rental_Loaner_First_Ltr int =(select documentId from Document where documentName = 'Rental Loaner First Ltr')	
declare @doc_Rental_Reservation_of_Rights_Ltr int =(select documentId from Document where documentName = 'Rental Reservation of Rights Ltr')	
declare @doc_Rental_Theft int =(select documentId from Document where documentName = 'Rental Theft')	
declare @doc_Right_of_Recourse_NJM_Takes int =(select documentId from Document where documentName = 'Right of Recourse NJM Takes')	
declare @doc_Right_of_Recourse_Owner_Keeps int =(select documentId from Document where documentName = 'Right of Recourse Owner Keeps')	
--declare @doc_SAIP_Ltr int =(select documentId from Document where documentName = 'SAIP Ltr')	
declare @doc_Setlmt_Repair_Agree_Amt int =(select documentId from Document where documentName = 'Setlmt Repair Agree Amt')	
declare @doc_Setlmt_Total_Loss___NJM_Take_Veh int =(select documentId from Document where documentName = 'Setlmt Total Loss - NJM Take Veh')	
declare @doc_Settlement_Repair_Estimate_No_AP int =(select documentId from Document where documentName = 'Settlement Repair Estimate No AP')	
declare @doc_Settlement_TL_Owner_Keeps_PA_OH_MD int =(select documentId from Document where documentName = 'Settlement TL Owner Keeps PA-OH-MD')	
declare @doc_Settlement_Total_Loss_Owner_Keeps int =(select documentId from Document where documentName = 'Settlement Total Loss Owner Keeps')	
--declare @doc_State_Police_Ltr int =(select documentId from Document where documentName = 'State Police Ltr')	
declare @doc_Stlmnt_TL_Stolen_Not_Recovered int =(select documentId from Document where documentName = 'Stlmnt TL Stolen Not Recovered')	
declare @doc_Storage_and_Rental_Termination int =(select documentId from Document where documentName = 'Storage and Rental Termination')	
declare @doc_Storage_Ltr_No_1st_Party_Coverage int =(select documentId from Document where documentName = 'Storage Ltr No 1st Party Coverage')	
declare @doc_Storage_Termination int =(select documentId from Document where documentName = 'Storage Termination')	
declare @doc_Storage_Termination_Liab_Ques int =(select documentId from Document where documentName = 'Storage Termination Liab Ques')	
declare @doc_Title_Request_Ltr int =(select documentId from Document where documentName = 'Title Request Ltr')	
declare @doc_Towing_Appraiser_Ltr int =(select documentId from Document where documentName = 'Towing Appraiser Ltr')	
declare @doc_Towing_Consent_reimbursement_Ltr int =(select documentId from Document where documentName = 'Towing Consent reimbursement Ltr')	
declare @doc_Towing_No_Breakdown_Ltr int =(select documentId from Document where documentName = 'Towing No Breakdown Ltr')	
declare @doc_Towing_No_Breakdown_Appraiser_Combo_Ltr int =(select documentId from Document where documentName = 'Towing No Breakdown-Appraiser Combo Ltr')	
declare @doc_Towing_Protest_Ltr int =(select documentId from Document where documentName = 'Towing Protest Ltr')	
declare @doc_Towing_Reimbursement_Ltr int =(select documentId from Document where documentName = 'Towing Reimbursement Ltr')	
declare @doc_UM_UIM_Reimbursement_Ltr int =(select documentId from Document where documentName = 'UM-UIM Reimbursement Ltr')	
declare @doc_Under_Ded_Ltr int =(select documentId from Document where documentName = 'Under Ded Ltr')	
declare @doc_Veh_Theft_Questionnaire_Ltr int =(select documentId from Document where documentName = 'Veh Theft Questionnaire Ltr')	
declare @doc_Co_Primary_Release int =(select documentId from Document where documentName = 'Co-Primary Release')	
declare @doc_Flood_Release int =(select documentId from Document where documentName = 'Flood Release')	
declare @doc_General_BI_Release int =(select documentId from Document where documentName = 'General BI Release')	
declare @doc_General_PD_Release_1st_Party int =(select documentId from Document where documentName = 'General PD Release-1st Party')	
declare @doc_General_PD_Release_3rd_Party int =(select documentId from Document where documentName = 'General PD Release-3rd Party')	
declare @doc_Med_Pay_Release int =(select documentId from Document where documentName = 'Med Pay Release')	
declare @doc_Minor_Release_and_Trust_Form_UM_UIM int =(select documentId from Document where documentName = 'Minor Release and Trust Form UM-UIM')	
declare @doc_Minor_Release_BI int =(select documentId from Document where documentName = 'Minor Release-BI')	
--declare @doc_PIP_Reimbursement_Release int =(select documentId from Document where documentName = 'PIP Reimbursement Release')	
declare @doc_UM_UIM_Release_and_Trust_BI int =(select documentId from Document where documentName = 'UM-UIM Release and Trust BI')	
declare @doc_UM_UIM_Release_and_Trust_BI_PD int =(select documentId from Document where documentName = 'UM-UIM Release and Trust BI-PD')	
declare @doc_UM_UIM_Release_and_Trust_PD int =(select documentId from Document where documentName = 'UM-UIM Release and Trust PD')	
declare @doc_Abandonment_Ltr int =(select documentId from Document where documentName = 'Abandonment Ltr')	
declare @doc_Auth_for_Salv_Tow_Ltr int =(select documentId from Document where documentName = 'Auth for Salv Tow Ltr')	
declare @doc_Limited_Power_of_Attorney int =(select documentId from Document where documentName = 'Limited Power of Attorney')	
declare @doc_Ltr_of_Authorization int =(select documentId from Document where documentName = 'Ltr of Authorization')	
declare @doc_No_Financial_Interest_Ltr int =(select documentId from Document where documentName = 'No Financial Interest Ltr')	
declare @doc_Notarized_Mileage_Error_Ltr int =(select documentId from Document where documentName = 'Notarized Mileage Error Ltr')	
declare @doc_NY_Owner_Keeps int =(select documentId from Document where documentName = 'NY Owner Keeps')	
declare @doc_Out_of_State_Facility_Ltr int =(select documentId from Document where documentName = 'Out of State Facility Ltr')	
declare @doc_Title_Transfer_Request_Ltr int =(select documentId from Document where documentName = 'Title Transfer Request Ltr')	
--declare @doc_Adversary_Ltr int =(select documentId from Document where documentName = 'Adversary Ltr')	
--declare @doc_Bill_Ltr int =(select documentId from Document where documentName = 'Bill Ltr')	
--declare @doc_ccADJ_Ltr int =(select documentId from Document where documentName = 'ccADJ Ltr')	
declare @doc_Cert int =(select documentId from Document where documentName = 'Cert')	
declare @doc_Cert_No_Rec int =(select documentId from Document where documentName = 'Cert No Rec')	
--declare @doc_DC_Resp_w_Rec_Ltr int =(select documentId from Document where documentName = 'DC Resp w Rec Ltr')	
--declare @doc_DC_Respond_Ltr int =(select documentId from Document where documentName = 'DC Respond Ltr')	
--declare @doc_Disregard_Ltr int =(select documentId from Document where documentName = 'Disregard Ltr')	
--declare @doc_No_Bill_Ltr int =(select documentId from Document where documentName = 'No Bill Ltr')	
--declare @doc_No_Claim_Ltr int =(select documentId from Document where documentName = 'No Claim Ltr')	
declare @doc_Out_of_State_Ltr int =(select documentId from Document where documentName = 'Out of State Ltr')	
--declare @doc_Prepay_Bill int =(select documentId from Document where documentName = 'Prepay Bill')	
--declare @doc_Prepay_Ltr int =(select documentId from Document where documentName = 'Prepay Ltr')	
declare @doc_1st_Sub___Ltr_to_Carr int =(select documentId from Document where documentName = '1st Sub - Ltr to Carr')	
declare @doc_1st_Sub___Ltr_to_Tort int =(select documentId from Document where documentName = '1st Sub - Ltr to Tort')	
declare @doc_1st_Sub_PIP___Ltr_to_Carr int =(select documentId from Document where documentName = '1st Sub PIP - Ltr to Carr')	
declare @doc_Addtl_Payment_Ltr int =(select documentId from Document where documentName = 'Addtl Payment Ltr')	
declare @doc_Collect_Refer_Form int =(select documentId from Document where documentName = 'Collect Refer Form')	
declare @doc_Concurrent_Notice_Ltr int =(select documentId from Document where documentName = 'Concurrent Notice Ltr')	
declare @doc_Concurrent_Request_Ltr int =(select documentId from Document where documentName = 'Concurrent Request Ltr')	
declare @doc_Dram_Shop_Questionnaire int =(select documentId from Document where documentName = 'Dram Shop Questionnaire')	
declare @doc_Dram_Shop_to_Establishment int =(select documentId from Document where documentName = 'Dram Shop to Establishment')	
declare @doc_Final_Salvage int =(select documentId from Document where documentName = 'Final Salvage')	
declare @doc_HO_Tort_Settlement_Agreement_Ltr int =(select documentId from Document where documentName = 'HO Tort Settlement Agreement Ltr')	
declare @doc_HO_1st_Sub_Ltr_to_Carr int =(select documentId from Document where documentName = 'HO-1st Sub-Ltr to Carr')	
declare @doc_HO_1st_Sub_Ltr_to_Tort int =(select documentId from Document where documentName = 'HO-1st Sub-Ltr to Tort')	
--declare @doc_Ltr_to_Appr_Disputed_Damages int =(select documentId from Document where documentName = 'Ltr to Appr-Disputed Damages')	
declare @doc_Ltr_to_Atty_RTS_Counter_CrossClaim int =(select documentId from Document where documentName = 'Ltr to Atty-RTS-Counter-CrossClaim')	
declare @doc_Ltr_to_Carr_Confirm_or_Deny_Covrage int =(select documentId from Document where documentName = 'Ltr to Carr-Confirm or Deny Covrage')	
--declare @doc_Ltr_to_Carr_Copy_of_their_Check int =(select documentId from Document where documentName = 'Ltr to Carr-Copy of their Check')	
declare @doc_Ltr_to_Carr_Proofs_Ltr int =(select documentId from Document where documentName = 'Ltr to Carr-Proofs Ltr')	
declare @doc_Ltr_to_Carr_Rntl_Pymt_Only_CarrpdPD int =(select documentId from Document where documentName = 'Ltr to Carr-Rntl Pymt Only-CarrpdPD')	
declare @doc_Ltr_to_Insd_Closing_Ltr int =(select documentId from Document where documentName = 'Ltr to Insd-Closing Ltr')	
declare @doc_Ltr_to_Insd_Paid_by_Torts_Carr int =(select documentId from Document where documentName = 'Ltr to Insd-Paid by Torts Carr')	
declare @doc_Ltr_to_Insd_Pd_by_Tort_Car_2nd_Ltr int =(select documentId from Document where documentName = 'Ltr to Insd-Pd by Tort Car-2nd Ltr')	
declare @doc_Ltr_to_Pros_Current_Status int =(select documentId from Document where documentName = 'Ltr to Pros-Current Status')	
declare @doc_Ltr_to_tort___non_coop_w_carr int =(select documentId from Document where documentName = 'Ltr to tort - non-coop w carr')	
declare @doc_Ltr_to_Tort__Cont_Pymt_Ltr int =(select documentId from Document where documentName = 'Ltr to Tort- Cont Pymt Ltr')	
declare @doc_Ltr_to_Tort_1st_Sub_Comp int =(select documentId from Document where documentName = 'Ltr to Tort-1st Sub-Comp')	
declare @doc_Ltr_to_Tort_Additional_Ltr int =(select documentId from Document where documentName = 'Ltr to Tort-Additional Ltr')	
declare @doc_Ltr_to_Tort_Insurance_Coverage int =(select documentId from Document where documentName = 'Ltr to Tort-Insurance Coverage')	
declare @doc_Ltr_to_Tort_Policy_Limit int =(select documentId from Document where documentName = 'Ltr to Tort-Policy Limit')	
declare @doc_Ltr_to_Tort_Threaten_Suit int =(select documentId from Document where documentName = 'Ltr to Tort-Threaten Suit')	
declare @doc_Ltr_to_Torts_Leasing_Company int =(select documentId from Document where documentName = 'Ltr to Torts Leasing Company')	
declare @doc_Ltr_to_Witness_Statement_Needed int =(select documentId from Document where documentName = 'Ltr to Witness-Statement Needed')	
declare @doc_PD_Release_for_Subrogation int =(select documentId from Document where documentName = 'PD Release for Subrogation')	
declare @doc_PIP_Subro_NY_Assignment_Agreement int =(select documentId from Document where documentName = 'PIP Subro-NY Assignment Agreement')	
declare @doc_Premier_Assignment_Form int =(select documentId from Document where documentName = 'Premier Assignment Form')	
declare @doc_Sub_1 int =(select documentId from Document where documentName = 'Sub 1')	
declare @doc_Subro_Addl_Payments_Made int =(select documentId from Document where documentName = 'Subro-Addl Payments Made')	
declare @doc_Subro_Addl_Payments_Made_w_Pct_Neg int =(select documentId from Document where documentName = 'Subro-Addl Payments Made w Pct Neg')	
declare @doc_Subro_WC_Recovery_Ltr int =(select documentId from Document where documentName = 'Subro-WC Recovery Ltr')	
declare @doc_Subrogation_Award_Pymt_Ltr_to_AFI int =(select documentId from Document where documentName = 'Subrogation Award Pymt Ltr to AFI')	
declare @doc_Subrogation_Award_Pymt_Ltr_to_Carr int =(select documentId from Document where documentName = 'Subrogation Award Pymt Ltr to Carr')	
declare @doc_Subrogation_Initial_Suit_Ltr int =(select documentId from Document where documentName = 'Subrogation Initial Suit Ltr')	
declare @doc_Subrogation_Ltr_to_Tort int =(select documentId from Document where documentName = 'Subrogation Ltr to Tort')	
--declare @doc_Subrogation_Request_Arb_Ltr int =(select documentId from Document where documentName = 'Subrogation Request Arb Ltr')	
--declare @doc_Subrogation_Suit_Follow_Up_Ltr int =(select documentId from Document where documentName = 'Subrogation Suit Follow Up Ltr')	
declare @doc_Subrogation_Suit_Referral_Ltr int =(select documentId from Document where documentName = 'Subrogation Suit Referral Ltr')	
declare @doc_Tort_Settlement_Agreement_Ltr int =(select documentId from Document where documentName = 'Tort Settlement Agreement Ltr')	


--DocumentCategory goes here for phase 1


IF not exists (select * from CategoryDocument where CategoryId=@cat_GC_BLANK_LETTER_TEMPLATES and DocumentId=@doc_Blank_Letter_Template_Group)
INSERT [dbo].[CategoryDocument] (CategoryId,DocumentId,DocumentOrder, EffectiveDate, ExpirationDate,CreatedBy, CreatedDateTime, UpdatedBy, UpdatedDateTime)
VALUES
(@cat_GC_BLANK_LETTER_TEMPLATES,@doc_Blank_Letter_Template_Group,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BLANK_LETTER_TEMPLATES,@doc_Blank_Letter_Template_Legal,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BLANK_LETTER_TEMPLATES,@doc_Blank_Letter_Template_Specific,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BLANK_LETTER_TEMPLATES,@doc_Blank_Letter_Template_Underwriting,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Ack_w_Authorization,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Ack_w_Denial,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Ack_wo_Authorization,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_AFFI_No_Insurance,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_AICRA_Claim_Threshold_Denial_Attny,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_AICRA_Claim_Threshold_Denial_Clmt,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Authorization_to_Attorney,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Authorization_to_Clmt_and_Insd,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Auto_Legal_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_BI_Reg_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Child_Support_Arrearages,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Demand_for_Limits_Need_Info,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Demand_for_Limits_Need_Time,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_ERISA_Lien_No_Claim_Presented,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_ERISA_Lien_Threshold_Denial_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_ERISA_Proof_Request_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Fatality_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Fatality_Ltr_to_Atty,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Florida_Ack_to_Atty,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Hospital_Records_Request_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_IME_Ltr_Attorney_Represented,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_IME_Ltr_Clmt,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Longworth_Ltr_1_Investigate_Further,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Longworth_Ltr_2_UIM_Denial,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Longworth_Ltr_3_Acceptance,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_MD_Acceptance_to_Consent_to_Settlement_Offer,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_MD_Refusal_to_Consent_to_Settlement_Offer,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Medical_Records_Request,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Medicare_Eligibility_Req_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Mockler_Denial,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_NJ_Child_Support_Judgment_Search_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_NJ_Medical_Bills_Recd_in_BI_Dept,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_No_Coverage_Letter,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_No_Pay_No_Play,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_NY_Denial_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_NY_Denial_to_Attny,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Out_of_State_Ack_w_Auths,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Out_of_State_Clmt_Inj_No_Attny,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Out_of_State_Clmt_Not_Repr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Out_of_State_New_Adj_to_Attny,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_PA_Threshold_Denial_to_Atty,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_PA_Threshold_Denial_to_Clmt,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_PA_UM_UIM_Acknowledgement_Ltr_no_blanks,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_PA_UM_UIM_Acknowledgement_Ltr_with_blanks,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_PA_Waive_Subrogation_Approval_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Pedestrian_Bicyclist_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_PIP_File_Request_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_PIP_Subro_Response,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Policy_Limit_Request_Compliant,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Policy_Limit_Request_Non_Compliant,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Status_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Status_Ltr_w_Authorizations,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_UIM_Ack_w_Authorization,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_UM_Ack_w_Authorization,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Unrepresent_BI_ACAV,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Unrepresent_Statute_Limit,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Unrepresented_BI_Status,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Unrepresented_Initial_BI_Contact,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_BODILY_INJURY,@doc_Wage_Loss_Check,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_ENVIRONMENTAL,@doc_Accept_Coverage_w_Cost_Share_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_ENVIRONMENTAL,@doc_After_Sale_Cleanup,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_ENVIRONMENTAL,@doc_Agree_to_Provide_Coverage,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_ENVIRONMENTAL,@doc_Denial_Above_Ground_Tank,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_ENVIRONMENTAL,@doc_Denial_AST_Rmval_Rplcmnt_Only,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_ENVIRONMENTAL,@doc_Denial_NghbrTankLeak2InsdProp,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_ENVIRONMENTAL,@doc_Denial_Standard,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_ENVIRONMENTAL,@doc_Denial_Tank_Rmval_Rplcmnt_Only,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_ENVIRONMENTAL,@doc_ROR_Above_Ground_Tank,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_ENVIRONMENTAL,@doc_ROR_Post_Sale_Coverage,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_ENVIRONMENTAL,@doc_ROR_Prior_Owner,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_ENVIRONMENTAL,@doc_ROR_Underground_Tank,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_ENVIRONMENTAL,@doc_UST_Denial_Declined_Tank_Liab_Endrs,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_FIRST_NOTICE_OF_LOSS,@doc_Denial_Excluded_Driver,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_FIRST_NOTICE_OF_LOSS,@doc_Denial_General,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_FIRST_NOTICE_OF_LOSS,@doc_Denial_Lapse_in_Coverage,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_FIRST_NOTICE_OF_LOSS,@doc_Denial_Mine_Subsidence,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_FIRST_NOTICE_OF_LOSS,@doc_Denial_Pol_Not_in_Force,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_FIRST_NOTICE_OF_LOSS,@doc_Denial_Veh_Not_Described_on_Policy,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_FIRST_NOTICE_OF_LOSS,@doc_Denial_Veh_Removed_Prior_to_Loss,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_FIRST_NOTICE_OF_LOSS,@doc_No_Coverage___Medical,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_FIRST_NOTICE_OF_LOSS,@doc_No_Coverage___Personal_Comm_Rental,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_FORMS,@doc_Additional_Information_Form,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_FORMS,@doc_Appraisal_Request,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_FORMS,@doc_Authorization_Medical,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_FORMS,@doc_Authorization_PIP_Claim,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_FORMS,@doc_Authorization_Wage_Loss,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_FORMS,@doc_HIPAA_Authorization,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_FORMS,@doc_IME_Enclosure,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_FORMS,@doc_Issue_Resolution_Request_Form,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_FORMS,@doc_Request_for_Scene_Photos,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_FORMS,@doc_SIU_Referral_PIP_Eligibility,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_FORMS,@doc_SIU_Referral_PIP_BI_MUD,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_GENERAL,@doc_ACAV,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_GENERAL,@doc_Cooperation_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_GENERAL,@doc_Damage_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_GENERAL,@doc_Excess_Umbrella_Carrier_Notice,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_GENERAL,@doc_Hold_Harmless_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_GENERAL,@doc_Ltr_to_Call,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_GENERAL,@doc_New_Adjuster_Status,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_GENERAL,@doc_Plea_and_Outcome,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_GENERAL,@doc_Request_for_Photos_or_Video,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_GENERAL,@doc_Reservation_of_Rights,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_GENERAL,@doc_Scene_Photos_Mark_up,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_GENERAL,@doc_Tax_ID_Num_Request_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_GENERAL,@doc_UMC_Ltr_to_Clmt,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_GENERAL,@doc_UMC_Ltr_to_Insd,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_GENERAL,@doc_Witness_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Adjusters_Settlement_Summary_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_CAT_Sump_Or_Backup_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Conditions_and_Duties,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Contact_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Covered_proof_and_Denial,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DE_HO_Reg_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Denial_and_Covered_Under_Ded,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Denial_Failed_to_Complete_Repairs,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL02,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL03,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL04a,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL04b,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL05,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL06a,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL07a,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL08,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL09,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL10,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL11,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL12,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL15a,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL15b,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL16,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL17,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL18,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL20,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL21,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL22,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL23,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL24,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL25,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL25a,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL26a,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL26b,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL29a,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL29b,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL29c,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DL30,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Document_Request_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_DP2_No_Peril_Denial,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Endorsed_Jewel_Fur_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Estimate_Needed,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Foreclosure_Claim_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Freeze_Loss_Questionnaire,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_HO_Pub_Adj_Rep_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_HO6_Broker_HOA_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_HO6_Master_Policy_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_HO6_Other_Ins_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Inventory_Follow_up_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Loss_of_Use_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_MD_HO_Reg_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_NJ_Appraisal_Denial_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_NJ_HO_Reg_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_No_Damage_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Notice_of_Payment,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_NY_HO_Reg_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_OH_HO_Reg_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_PA_Appraisal_Denial_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_PA_HO_Reg_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Police_Dept_Recovery_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Proof_of_Loss,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Public_Adjuster_Contract_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Reasonable_and_Fair_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Recoverable_Deprec_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_ROR_HO95,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_ROR_HO95x,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Theft_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Undisputed_Proof_Rejection_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_HOMEOWNERS,@doc_Withdraw_Claim_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_LEGAL,@doc_1000_5000_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_LEGAL,@doc_Cooperation_Ltr_1st_Adjuster,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_LEGAL,@doc_Cooperation_Ltr_1st_Attorney,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_LEGAL,@doc_Cooperation_Ltr_2nd_Adjuster,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_LEGAL,@doc_Correspondence_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_LEGAL,@doc_Demand_for_Arb,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_LEGAL,@doc_Double_Dipper,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_LEGAL,@doc_Excess_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_LEGAL,@doc_First_Notice_of_Lawsuit,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_LEGAL,@doc_Florida_Response_Letter,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_LEGAL,@doc_HO_Denial_Intra_Family_Exclusion,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_LEGAL,@doc_Insd_Contact_Ltr_Suit,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_MEMO,@doc_Blank_Memo,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_72_Hour_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_750_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Affidavit_No_Ins_w_NJ_PIP_App_Attny,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Affidavit_No_Ins_w_NJ_PIP_App_Clmt,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Affidavit_No_Ins_w_PA_PIP_App_Attny,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Affidavit_No_Ins_w_PA_PIP_App_Clmt,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Affidavit_No_Ins_wo_PIP_App_Attny,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Affidavit_No_Ins_wo_PIP_App_Clmt,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Appeal_Invalid_Appeal_No_Docs,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Approaching_Policy_Limits_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Auth_Needed_for_Information,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Authorization_2,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Balance_Billing_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Bill_by_Date_CPT,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Charge_for_Copies_Precharge_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Claim_Acceptance_Letter,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Combined_CPT_and_W9_Letter,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Concurrent_Info_Request,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Conversion_Memo,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Coverage_14_Day_Notice,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_CT_Explain_Letter,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_CT_Motorcycle_Denial,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_CT_SOL,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_CT_WC_Denial_Letter,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_DE_Denial___Excess_Coverage,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_DE_Denial___Policy_Exclusion,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_DE_Explain_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_DE_Statute_of_Limitations_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Death_Explain_Letter,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Death_Letter_Death_Wage_Exclusion,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Delay_Ltr_21_Day_Notice,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Delay_Ltr_45_Day,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Denial___Assault,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Denial___NonCompliance_IME,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Denial_Investigation,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Denial_Pedestrian_PIP,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Denial_Provider_No_PIP_App,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Denial_Returned_Bill,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Denial_Health_Care_Primary,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Denial_Household_Insurance,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Denial_Intentional_Act,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Denial_PLIGA,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Denial_Stranger_Pedestrian,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Deny_Subro,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Dependent_Survivor_Benefits,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Disability_Stmt_from_Doctor,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_DPR_Plan_IME_2_Attorney,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_DPR_Plan_IME_2_Clmt,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_DPR_Plan_IME_Attorney,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_DPR_Plan_IME_Clmt,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_DPR_Plan_IME_NonCompliance_Attny,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_DPR_Plan_IME_NonCompliance_Clmt,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_DPR_Response_Form,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_DPR_Response_Form_IME,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Enclose_Bill_Request_Results,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Essential_Service_Cover_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Explain_Ltr_Precert_Inj_Party,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_File_Transfer_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_FPB_Closure_Letter,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Health_Insurance_Primary,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Health_Primary,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_HIP_Explain_Ltr_Precert_Inj_Party,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_IME_Cancellation_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_IME_NonCompliance_Claimant_or_Attorney,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_IME_Questionnaire,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Lien_Asking_for_Ledger,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Lien_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Massage_Therapy_By_CMT_Denial_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_MD_Denial_12_Months_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_MD_Denial_Letter,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_MD_Explain_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_MD_SOL_Letter,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Med_Pay_Death_Letter,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Med_Pay_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Med_Pay_Ltr___School_and_Church_Buses,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Med_Pay_Denial_Regular_Use,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Med_Pay_Denial_Workers_Comp,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Medical_Report_Request,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Medicare,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_MSPRC_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_New_York_Benefits_Reached,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_New_York_Denial,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_NJ_Delay_Insured_P1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_NJ_Unacceptable_PIP1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_No_Coverage_14_Day_Notice,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_No_Coverage_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_No_Wage_Attorney,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_No_Wage_Loss_Reimbursement_Clmt,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_NY_2nd_Notice_Ltr_Injured_Party,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_NY_APIP_Subro_Agreement_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_NY_Coverage_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_NY_Delay_Insured_P1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_NY_Denial_Work_Comp,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_NY_Employers_Wage_Ver_Rpt,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_NY_Initial_Wage_Loss_Explain,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_NY_OBEL_Election_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_NY_Provider_Coverage_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_NY_Unacceptable_PIP1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_ODS_Explain_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_OH_60_Day_Notification_of_SOL,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_OH_Denial_Letter,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_PA_Delay_Insured_P1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_PA_Explain_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_PA_Ltr_of_Medical_Determination,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_PA_ProReview_Ltr_to_Provider,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_PA_Reconsideration_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_PA_Unable_to_Contact_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_PA_Unacceptable_PIP1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_PA_Victims_of_Domestic_Abuse_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Paysheet_Enclosed,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Peer_Report,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_PIP_Hospital_Record_Request,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_PIP_Peer_Review_Request,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_PIP_Reservation_of_Rights,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Policy_Limits_All_States,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Precert_Coverage_Undetermined,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Precertification_Health_Primary,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Provider_Cover_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Record_Request_Audit_Delay_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Records_Req_Ltr_to_Provider,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Refund_Request,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Reg_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Reparations_Replacement_Service,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Representation_Acknowledged,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Reservation_of_Rights_Multi_State,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Statute_of_Limitations_2yr_1st_Pymt,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Submit_Bills_to_Own_Carrier,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Thirty_Day_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_TOB_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_TOB_Specialty_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_UC_321,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Unable_to_Contact,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Unable_to_Contact_Re_Minor,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Wage_and_Salary_Verification_Multi_State,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Wage_Explain,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Wages_Limit_Reached_Approaching,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PIP,@doc_Workers_Comp,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_10_Day_Will_Pay_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Certification_of_Automobile_Repair,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Damage_to_Property,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_DE_Reg_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Delete_Coverage,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Delete_Insd_Name_From_Ck,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Denial_Claimant,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Denial_Diminished_Value__1st_Party,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Denial_Diminished_Value__3rd_Party,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Denial_Emergency_Response_Costs_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Denial_Partial__Auto,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Denial_to_Attorney_or_Company,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Denial_to_Insd__PD,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Enterprise_Proofs,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Impound_Facility_No_Storage_Fees,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Insd_Incident_Report,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Low_Limits_Ltr_Clmt,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Low_Limits_Ltr_Insd,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Ltr_of_Compromise,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_MD_Reg_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_NJ_Reg_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Notice_of_Rights_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_NY_Fire_District_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_NY_Reg_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_OH_Reg_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_PA_Reg_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_PA_TL_Evaluation_Notification,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Payoff_LOG_Request_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Public_Entity_Immunity_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Rental_Loaner_First_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Rental_Reservation_of_Rights_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Rental_Theft,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Right_of_Recourse_NJM_Takes,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Right_of_Recourse_Owner_Keeps,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Setlmt_Repair_Agree_Amt,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Setlmt_Total_Loss___NJM_Take_Veh,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Settlement_Repair_Estimate_No_AP,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Settlement_TL_Owner_Keeps_PA_OH_MD,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Settlement_Total_Loss_Owner_Keeps,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Stlmnt_TL_Stolen_Not_Recovered,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Storage_and_Rental_Termination,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Storage_Ltr_No_1st_Party_Coverage,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Storage_Termination,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Storage_Termination_Liab_Ques,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Title_Request_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Towing_Appraiser_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Towing_Consent_reimbursement_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Towing_No_Breakdown_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Towing_No_Breakdown_Appraiser_Combo_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Towing_Protest_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Towing_Reimbursement_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_UM_UIM_Reimbursement_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Under_Ded_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_PROPERTY_DAMAGE,@doc_Veh_Theft_Questionnaire_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_RELEASES,@doc_Co_Primary_Release,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_RELEASES,@doc_Flood_Release,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_RELEASES,@doc_General_BI_Release,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_RELEASES,@doc_General_PD_Release_1st_Party,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_RELEASES,@doc_General_PD_Release_3rd_Party,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_RELEASES,@doc_Med_Pay_Release,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_RELEASES,@doc_Minor_Release_and_Trust_Form_UM_UIM,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_RELEASES,@doc_Minor_Release_BI,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_RELEASES,@doc_UM_UIM_Release_and_Trust_BI,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_RELEASES,@doc_UM_UIM_Release_and_Trust_BI_PD,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_RELEASES,@doc_UM_UIM_Release_and_Trust_PD,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SALVAGE,@doc_Abandonment_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SALVAGE,@doc_Auth_for_Salv_Tow_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SALVAGE,@doc_Limited_Power_of_Attorney,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SALVAGE,@doc_Ltr_of_Authorization,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SALVAGE,@doc_No_Financial_Interest_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SALVAGE,@doc_Notarized_Mileage_Error_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SALVAGE,@doc_NY_Owner_Keeps,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SALVAGE,@doc_Out_of_State_Facility_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SALVAGE,@doc_Title_Transfer_Request_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBPOENA,@doc_Cert,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBPOENA,@doc_Cert_No_Rec,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBPOENA,@doc_Out_of_State_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_1st_Sub___Ltr_to_Carr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_1st_Sub___Ltr_to_Tort,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_1st_Sub_PIP___Ltr_to_Carr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Addtl_Payment_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Collect_Refer_Form,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Concurrent_Notice_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Concurrent_Request_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Dram_Shop_Questionnaire,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Dram_Shop_to_Establishment,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Final_Salvage,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_HO_Tort_Settlement_Agreement_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_HO_1st_Sub_Ltr_to_Carr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_HO_1st_Sub_Ltr_to_Tort,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Ltr_to_Atty_RTS_Counter_CrossClaim,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Ltr_to_Carr_Confirm_or_Deny_Covrage,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Ltr_to_Carr_Proofs_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Ltr_to_Carr_Rntl_Pymt_Only_CarrpdPD,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Ltr_to_Insd_Closing_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Ltr_to_Insd_Paid_by_Torts_Carr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Ltr_to_Insd_Pd_by_Tort_Car_2nd_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Ltr_to_Pros_Current_Status,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Ltr_to_tort___non_coop_w_carr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Ltr_to_Tort__Cont_Pymt_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Ltr_to_Tort_1st_Sub_Comp,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Ltr_to_Tort_Additional_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Ltr_to_Tort_Insurance_Coverage,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Ltr_to_Tort_Policy_Limit,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Ltr_to_Tort_Threaten_Suit,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Ltr_to_Torts_Leasing_Company,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Ltr_to_Witness_Statement_Needed,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_PD_Release_for_Subrogation,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_PIP_Subro_NY_Assignment_Agreement,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Premier_Assignment_Form,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Sub_1,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Subro_Addl_Payments_Made,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Subro_Addl_Payments_Made_w_Pct_Neg,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Subro_WC_Recovery_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Subrogation_Award_Pymt_Ltr_to_AFI,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Subrogation_Award_Pymt_Ltr_to_Carr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Subrogation_Initial_Suit_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Subrogation_Ltr_to_Tort,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Subrogation_Suit_Referral_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null),
(@cat_GC_SUBROGATION,@doc_Tort_Settlement_Agreement_Ltr,1,DATEADD(YEAR,-1,GETDATE()),DATEADD(YEAR,90,GETDATE()),SUSER_SNAME(),GETDATE(),null,null)

