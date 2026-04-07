use ACE
GO


IF OBJECT_ID (N'dbo.GetDropdownItemId', N'FN') IS NOT NULL
    DROP FUNCTION GetDropdownItemId;
GO
CREATE FUNCTION dbo.GetDropdownItemId(@typecode varchar(100), @itemcode varchar(100))
RETURNS int
AS
-- Returns the stock level for the product.
BEGIN
    DECLARE @ret int;
Select  @ret=  DocumentDropdownLookupItemId from [dbo].DocumentDropdownLookupType type
join dbo.DocumentDropdownLookupItem item
on type.DocumentDropdownLookupTypeId = item.DocumentDropdownLookupItemTypeId
where DocumentDropdownLookupTypeCode=@typecode and DocumentDropdownLookupItemCode=@itemcode

     IF (@ret IS NULL)
        SET @ret = 0;
    RETURN @ret;
END;