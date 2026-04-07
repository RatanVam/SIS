Go

IF  ((SELECT Count(*) from DocumentDropdownLookupItem where DocumentDropdownLookupItemCode = 'Vehicle On/Off Policy (Lapse)') = 1)
begin
  update DocumentDropdownLookupItem
  set DocumentDropdownLookupItemValue = 'Vehicle Lapse'
  where DocumentDropdownLookupItemCode = 'Vehicle On/Off Policy (Lapse)'
End
