using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.Extentions
{
        public static class EnumExtension
        {
            public static string ToDescritpionString(this Enum val)
        {
                DescriptionAttribute[] attributes = (DescriptionAttribute[])val
                   .GetType()
                   .GetField(val.ToString())
                   .GetCustomAttributes(typeof(DescriptionAttribute), false);
                return attributes.Length > 0 ? attributes[0].Description : val.ToString();
            }
        }
    }
