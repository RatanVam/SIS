using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared
{
    public class UserData
    {
        public string UserName { get; set; } = String.Empty;
        public string UserRoles { get; set; } = String.Empty;
        public string UserID{ get; set; } = String.Empty;
        public string UserEmail{ get; set; } = String.Empty;

        public string UserInital { get; set; } = String.Empty;
        public bool IsAuthericated { get; set; } = false;
    }
}
