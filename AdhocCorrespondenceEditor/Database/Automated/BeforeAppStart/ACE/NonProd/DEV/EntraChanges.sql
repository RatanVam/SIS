-- =============================================
-- Author:		Suresh Murugesan
-- Create date: 11/19/2025
-- Description: Added the new Entra group for access
-- =============================================

update LOBCategory
set CategoryGroups  = CategoryGroups + ',APP_Entra_Inspire_ACE_DEV'