using AdhocCorrespondenceEditor.Client.ControlClass;
using AdhocCorrespondenceEditor.Shared;

namespace AdhocCorrespondenceEditor.Client.PageHelper
{
    public interface IPartyAddressUIDT
    {
        public List<PartyAddressUI> GetPartAddress(SourceSystemBaseEntity sourceSystemEntity, bool isPrimaryAddress, bool includeCurrentUser);
    }
}
