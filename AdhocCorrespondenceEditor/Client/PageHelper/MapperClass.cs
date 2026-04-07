using AdhocCorrespondenceEditor.Client.ControlClass;
using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.BC;
using AdhocCorrespondenceEditor.Shared.CL;
using AdhocCorrespondenceEditor.Shared.GC;
using AdhocCorrespondenceEditor.Shared.PCPA;
using AdhocCorrespondenceEditor.Shared.PL;
using AdhocCorrespondenceEditor.Shared.WCC;
using AdhocCorrespondenceEditor.Shared.WCU;

namespace AdhocCorrespondenceEditor.Client.PageHelper
{
    public class MapperClass
    {
        public List<PartyAddressUI> GetMappedObjects(SourceSystemBaseEntity type, bool isPrimaryAddress = false, bool includeCurrentUser = false)
        {
            switch (type)
            {
                case CLSourceSystemEntity: return new CLCAPartyAddressDT().GetPartAddress(type, isPrimaryAddress, includeCurrentUser);
                case BCSourceSystemEntity: return new BCPartyAddressDT().GetPartAddress(type, isPrimaryAddress, includeCurrentUser);
                case PCWCUSourceSystemEntity: return new PCWCUPartyAddressDT().GetPartAddress(type, isPrimaryAddress, includeCurrentUser);
                case PLSourceSystemEntity: return new PLPartyAddressDT().GetPartAddress(type, isPrimaryAddress, includeCurrentUser);
                case PLAutoSourceSystemEntity: return new PCPAPartyAddressDT().GetPartAddress(type, isPrimaryAddress, includeCurrentUser);
                case WCCSourceSystemEntity: return new WCCPartyAddressDT().GetPartAddress(type, isPrimaryAddress, includeCurrentUser);
                case GCSourceSystemEntity: return new GCPartyAddressDT().GetPartAddress(type, isPrimaryAddress, includeCurrentUser);               
                default: throw new Exception("Can't find correct Mapper object for the source Data");
            }
        }
    }
}
