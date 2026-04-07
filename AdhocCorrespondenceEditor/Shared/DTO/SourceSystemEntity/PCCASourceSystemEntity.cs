using AdhocCorrespondenceEditor.Shared.CL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdhocCorrespondenceEditor.Shared.PCCA
{

    public class CommercialAutoLine
    {
        public VehicleCoverageListing[] VehicleCoverageDetails { get; set; }
        public CoverageElectionParameter[] CoverageElectionParameters { get; set; }
        public Party[] ListedDrivers { get; set; }
        public string FormTypeCd { get; set; }
        public string id { get; set; }
    }

    public class VehicleCoverageListing
    {

        public Vehicle Vehicle { get; set; }
        public Party[] AssociatedParties { get; set; }
        public Party[] ExcludedParties { get; set; }
        public CoverageElectionParameter[] Coverages { get; set; }
        public string VehicleSpecialtyTypeCd { get; set; }
        public Address GarageLocation { get; set; }
        public bool JointOwnershipIn { get; set; }
        public bool JointOwnershipInSpecified { get; set; }
        public string OwnershipTypeCd { get; set; }
        public double TotalPremiumAm { get; set; }
        public bool TotalPremiumAmSpecified { get; set; }
        public string VehicleClassificationTypeCd { get; set; }
        public string VehicleRegisteredToNm { get; set; }
        public string id { get; set; }
    }


    public class Vehicle
    {


        public string VehicleId { get; set; }
        public string ManufacturerVehicleIdentificationNr { get; set; }
        public ushort ModelYearNr { get; set; }
        public bool ModelYearNrSpecified { get; set; }
        public string VehicleTradeNm { get; set; }
        public string ModelNm { get; set; }
        public string BodyCategoryCd { get; set; }
        public string VehicleTypeCd { get; set; }
        public string ISOBodyCd { get; set; }
        public string CylinderNumberCd { get; set; }
        public string ISOSymbol { get; set; }
        public string id { get; set; }
    }



}
