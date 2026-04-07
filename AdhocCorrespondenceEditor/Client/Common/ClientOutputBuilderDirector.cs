using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.BC;
using AdhocCorrespondenceEditor.Shared.CL;
using AdhocCorrespondenceEditor.Shared.DTO.UserInputEntity;
using AdhocCorrespondenceEditor.Shared.PCMulti;
using AdhocCorrespondenceEditor.Shared.PL;
using AdhocCorrespondenceEditor.Shared.WCU;
using AdhocCorrespondenceEditor.Shared.PCPA;
using AdhocCorrespondenceEditor.Shared.WCC;
using AdhocCorrespondenceEditor.Shared.GC;

namespace AdhocCorrespondenceEditor.Client
{
    public class ClinetOutputDirector
    {
        public OutputBase GetUserDataBuilder(SourceSystemBaseEntity type)
        {
            switch (type)
            {
                case CLSourceSystemEntity: return new CLUserEntity();
                case PCMultiSourceSystemEntity: return new MultiUserEntity();
                case BCSourceSystemEntity: return new BCUserEntity();
                case PCWCUSourceSystemEntity: return new PCWCUUserEntity();
                case PLSourceSystemEntity: return new PLHoUmbDwUserEntity();
                case PLAutoSourceSystemEntity: return new PLPAUserEntity();
                case WCCSourceSystemEntity: return new WCCUserEntity();
                case GCSourceSystemEntity: return new GCUserEntity();
                default: throw new Exception("No user Entity class define for LOB Source system data");
            }
        }
    }
}
