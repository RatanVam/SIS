--Compare categories for CL
--Start with PC-CA

declare @lob_name varchar(50);
SET @lob_name='PC-CA'

print 'For LOB:' + @lob_name
print '------------------------'
print ''


declare @ace_lob_id varchar(50);
declare @ice_lob_id varchar(50);
declare @ace_lob_count int;
declare @ice_lob_count int;

declare @ace_cat_doc int;
declare @ice_cat_doc int;

declare @ace_cat_id varchar(50);
declare @ice_cat_id varchar(50);
declare @ace_doc_id varchar(50);
declare @ice_doc_id varchar(50);
declare @ace_cat_name varchar(100);
declare @ice_cat_name varchar(100);
declare @ace_doc_name varchar(100);
declare @ice_doc_name varchar(100);

declare @categoryId varchar(50);

/* This comparision only for CATEGORY  */
		select  @ace_lob_count=count(*) 
				FROM [ACE].[dbo].[LOBCategory]  ace
				JOIN [ACE].[dbo].[LOB]  acelob
				ON ace.LOBId = acelob.LOBId
				WHERE acelob.LOBName=@lob_name

		select  @ice_lob_count=count(*) 
				FROM [ICE_Prod].[dbo].[Category]  ice
				JOIN [ICE_Prod].[dbo].[LOB]  icelob
				ON ice.LOBId = icelob.LOBId
				WHERE icelob.LOBName=@lob_name

		IF (@ace_lob_count <> @ice_lob_count) 
		BEGIN
			print 'ACE ' + @lob_name + ' has Categories:' + CONVERT(VARCHAR, @ace_lob_count)  
			print 'ICE ' + @lob_name + ' has Categories:' + CONVERT(VARCHAR, @ice_lob_count)
			print ''
		END
/* CATEGORY EndsHere */


-- compare docouments and controls for the lo
select  @ace_lob_id=LOBId 
		FROM [ACE].[dbo].[LOB]  acelob
		WHERE acelob.LOBName=@lob_name

select  @ice_lob_id=LOBId 
		FROM ICE_Prod.[dbo].[LOB]  icelob
		WHERE icelob.LOBName=@lob_name


DECLARE @categoryName VARCHAR(MAX)

DECLARE lob_category CURSOR
FOR SELECT CategoryName,CategoryId 
    FROM  [ICE_Prod].[dbo].[Category] cat
	JOIN  [ICE_Prod].[dbo].[LOB] lob
	ON cat.LOBId = lob.LOBId
	WHERE LOBName= @lob_name

open lob_category
FETCH NEXT FROM lob_category INTO  @categoryName, @categoryId 

WHILE @@FETCH_STATUS = 0
    BEGIN
		
		--Compare documents for each category now in both ACE and ICE
		select  @ace_cat_doc=count(*) 
				FROM [ACE].[dbo].[Category]  ace
				JOIN [ACE].[dbo].[CategoryDocument]  acedoc
				ON ace.CategoryId = acedoc.CategoryId
				JOIN ACe.dbo.LOBCategory lobcat
				ON lobcat.CategoryId = ace.CategoryId
				WHERE ace.CategoryName=@categoryName and lobcat.LOBId = @ace_lob_id

		select  @ice_cat_doc=count(*) 
				FROM ICE_Prod.[dbo].[Category]  ice
				JOIN ICE_Prod.[dbo].[Document]  icedoc
				ON ice.CategoryId = icedoc.CategoryId
				WHERE ice.CategoryName=@categoryName and ice.LOBId = @ice_lob_id
		

		if (@ace_cat_doc <> @ice_cat_doc)
		BEGIN
    		 PRINT 'Category:' + @categoryName;

			print 'ACE Documents:' + CONVERT(VARCHAR,@ace_cat_doc)
			print 'ICE Documents:' + Convert(VARCHAR,@ice_cat_doc)
		END
		 
 

      FETCH NEXT FROM lob_category INTO @categoryName, @categoryId 
    END;
CLOSE lob_category;
DEALLOCATE lob_category;


DECLARE category_document CURSOR
FOR SELECT cat.CategoryId,CategoryName,documentId, documentName 
    FROM  [ICE_Prod].[dbo].[Category] cat
	JOIN  [ICE_Prod].[dbo].[Document] doc
	ON cat.CategoryId= doc.CategoryId
	where  cat.LOBId = @ice_lob_id


OPEN category_document
FETCH NEXT FROM category_document INTO  @ice_cat_id,@ice_cat_name, @ice_doc_id ,@ice_doc_name

WHILE @@FETCH_STATUS = 0
      BEGIN
         
			declare @acedocControl int;
			declare @icedocControl int;

			select @icedocControl = COUNT(*)
			FROM ICE_Prod.dbo.DocumentControl
			WHERE DocumentId= @ice_doc_id

			select @acedocControl = COUNT(*)
			FROM ACE.dbo.DocumentControl dc
			JOIN ACE.dbo.Document doc
			ON doc.DocumentId = dc.DocumentId
			JOIN ace.dbo.CategoryDocument doccat
			ON doccat.DocumentId = doc.DocumentId
			JOIN ace.dbo.Category cat
			ON cat.CategoryId = doccat.CategoryId
			WHERE doc.DocumentName= @ice_doc_name and cat.CategoryName = @ice_cat_name

			if (@icedocControl <> @acedocControl)
			BEGIN
				print 'Document:' + @ice_doc_name
				print 'ACE:Controls=>' + convert(varchar, @acedocControl)
				print 'ICE:Controls=>' + convert(varchar,@icedocControl)

			END
			FETCH NEXT FROM category_document INTO  @ice_cat_id,@ice_cat_name, @ice_doc_id ,@ice_doc_name
    END;
CLOSE category_document;
DEALLOCATE category_document;

