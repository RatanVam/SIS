namespace AdhocCorrespondenceEditor.Client.Common;

using System;
using System.ComponentModel.DataAnnotations;

public class ConditionalValidationAttribute : ValidationAttribute
{
    private readonly string _propertyName;

    public ConditionalValidationAttribute(string propertyName)
    {
        _propertyName = propertyName;
    }

    protected override ValidationResult IsValid(object value, ValidationContext validationContext)
    {
        var instance = validationContext.ObjectInstance;
        var type = instance.GetType();
        var propertyValue = type.GetProperty(_propertyName)?.GetValue(instance, null) as bool?;

        if (propertyValue.HasValue && propertyValue.Value)
        {
            if (value == null || string.IsNullOrWhiteSpace(value.ToString()))
            {
                return new ValidationResult(ErrorMessage);
            }
        }

        return ValidationResult.Success;
    }
}
