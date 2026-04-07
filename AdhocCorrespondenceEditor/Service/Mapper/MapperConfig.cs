using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using AutoMapper;
using CommercialAuto;

namespace AdhocCorrespondenceEditor.Service.Mapper
{


    public class MapperConfig
    {
        public static MapperConfiguration mapperConfiguration;
        public static AutoMapper.Mapper InitializeAutomapperPCCA()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<CommercialAuto.retrievePolicyByPolicyNumberResponse, Shared.CL.CLSourceSystemEntity>()
                .ForMember(dest => dest.PolicyData, act => act.MapFrom(src => src.RetrievePolicyByPolicyNumberResponseMessage));
                cfg.CreateMap<CommercialAuto.retrievePolicyByQuoteNumberResponse, Shared.CL.CLSourceSystemEntity>()
               .ForMember(dest => dest.PolicyData, act => act.MapFrom(src => src.RetrievePolicyByQuoteNumberResponseMessage));

                cfg.CreateMap<CommercialAuto.RetrievePolicyByPolicyNumberResponseMessage, Shared.CL.RetrievePolicyByPolicyNumberResponseMessage>();
                cfg.CreateMap<CommercialAuto.RetrievePolicyByQuoteNumberResponseMessage, Shared.CL.RetrievePolicyByPolicyNumberResponseMessage>();

                cfg.CreateMap<CommercialAuto.Policy, Shared.CL.Policy>();
                cfg.CreateMap<CommercialAuto.Account, Shared.CL.Account>();
                cfg.CreateMap<CommercialAuto.Organization, Shared.CL.Organization>();
                cfg.CreateMap<CommercialAuto.PartyAddress, Shared.CL.PartyAddress>();
                cfg.CreateMap<CommercialAuto.Address, Shared.CL.Address>();
                cfg.CreateMap<CommercialAuto.Municipality, Shared.CL.Municipality>();
                cfg.CreateMap<CommercialAuto.CountrySubdivision, Shared.CL.CountrySubdivision>();
                cfg.CreateMap<CommercialAuto.PolicyPeriod, Shared.CL.PolicyPeriod>();
                cfg.CreateMap<CommercialAuto.PolicyLine, Shared.CL.PolicyLine>();
                cfg.CreateMap<CommercialAuto.CommercialAutoLine, Shared.PCCA.CommercialAutoLine>();
                cfg.CreateMap<CommercialAuto.VehicleCoverageListing, Shared.PCCA.VehicleCoverageListing>();
                cfg.CreateMap<CommercialAuto.Vehicle, Shared.PCCA.Vehicle>();
                cfg.CreateMap<CommercialAuto.Person, Shared.CL.Person>();
                cfg.CreateMap<CommercialAuto.Party, Shared.CL.Party>();
                cfg.CreateMap<CommercialAuto.PersonalName, Shared.CL.PersonalName>();
                cfg.CreateMap<CommercialAuto.CoverageElectionParameter, Shared.CL.CoverageElectionParameter>();
                cfg.CreateMap<CommercialAuto.PartyListing, Shared.CL.PartyListing>();
            });
            mapperConfiguration = config;
            var mapper = new AutoMapper.Mapper(config);
            return mapper;
        }


        public static AutoMapper.Mapper InitializeAutomapperBOP()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<CommercialBOP.retrievePolicyByPolicyNumberResponse, Shared.CL.CLSourceSystemEntity>()
                .ForMember(dest => dest.PolicyData, act => act.MapFrom(src => src.RetrievePolicyByPolicyNumberResponseMessage));
                cfg.CreateMap<CommercialBOP.retrievePolicyByQuoteNumberResponse, Shared.CL.CLSourceSystemEntity>()
               .ForMember(dest => dest.PolicyData, act => act.MapFrom(src => src.RetrievePolicyByQuoteNumberResponseMessage));

                cfg.CreateMap<CommercialBOP.RetrievePolicyByPolicyNumberResponseMessage, Shared.CL.RetrievePolicyByPolicyNumberResponseMessage>();
                cfg.CreateMap<CommercialBOP.RetrievePolicyByQuoteNumberResponseMessage, Shared.CL.RetrievePolicyByPolicyNumberResponseMessage>();

                cfg.CreateMap<CommercialBOP.Policy, Shared.CL.Policy>();
                cfg.CreateMap<CommercialBOP.Account, Shared.CL.Account>();
                cfg.CreateMap<CommercialBOP.Organization, Shared.CL.Organization>();
                cfg.CreateMap<CommercialBOP.PartyAddress, Shared.CL.PartyAddress>();
                cfg.CreateMap<CommercialBOP.Address, Shared.CL.Address>();
                cfg.CreateMap<CommercialBOP.Municipality, Shared.CL.Municipality>();
                cfg.CreateMap<CommercialBOP.CountrySubdivision, Shared.CL.CountrySubdivision>();
                cfg.CreateMap<CommercialBOP.PolicyPeriod, Shared.CL.PolicyPeriod>();
                cfg.CreateMap<CommercialBOP.PolicyLine, Shared.CL.PolicyLine>();
                cfg.CreateMap<CommercialBOP.CoverageElectionParameter, Shared.CL.CoverageElectionParameter>();
                cfg.CreateMap<CommercialBOP.Person, Shared.CL.Person>();
                cfg.CreateMap<CommercialBOP.Party, Shared.CL.Party>();
                cfg.CreateMap<CommercialBOP.PersonalName, Shared.CL.PersonalName>();
                cfg.CreateMap<CommercialBOP.CoverageElectionParameter, Shared.CL.CoverageElectionParameter>();
                cfg.CreateMap<CommercialBOP.PartyListing, Shared.CL.PartyListing>();

            });
            mapperConfiguration = config;
            var mapper = new AutoMapper.Mapper(config);
            return mapper;
        }


        public static AutoMapper.Mapper InitializeAutomapperCGL()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<CommercialCGL.retrievePolicyByPolicyNumberResponse, Shared.CL.CLSourceSystemEntity>()
                .ForMember(dest => dest.PolicyData, act => act.MapFrom(src => src.RetrievePolicyByPolicyNumberResponseMessage));
                cfg.CreateMap<CommercialCGL.retrievePolicyByQuoteNumberResponse, Shared.CL.CLSourceSystemEntity>()
               .ForMember(dest => dest.PolicyData, act => act.MapFrom(src => src.RetrievePolicyByQuoteNumberResponseMessage));

                cfg.CreateMap<CommercialCGL.RetrievePolicyByPolicyNumberResponseMessage, Shared.CL.RetrievePolicyByPolicyNumberResponseMessage>();
                cfg.CreateMap<CommercialCGL.RetrievePolicyByQuoteNumberResponseMessage, Shared.CL.RetrievePolicyByPolicyNumberResponseMessage>();

                cfg.CreateMap<CommercialCGL.Policy, Shared.CL.Policy>();
                cfg.CreateMap<CommercialCGL.Account, Shared.CL.Account>();
                cfg.CreateMap<CommercialCGL.Organization, Shared.CL.Organization>();
                cfg.CreateMap<CommercialCGL.PartyAddress, Shared.CL.PartyAddress>();
                cfg.CreateMap<CommercialCGL.Address, Shared.CL.Address>();
                cfg.CreateMap<CommercialCGL.Municipality, Shared.CL.Municipality>();
                cfg.CreateMap<CommercialCGL.CountrySubdivision, Shared.CL.CountrySubdivision>();
                cfg.CreateMap<CommercialCGL.PolicyPeriod, Shared.CL.PolicyPeriod>();
                cfg.CreateMap<CommercialCGL.PolicyLine, Shared.CL.PolicyLine>();
                cfg.CreateMap<CommercialCGL.CoverageElectionParameter, Shared.CL.CoverageElectionParameter>();
                cfg.CreateMap<CommercialCGL.Person, Shared.CL.Person>();
                cfg.CreateMap<CommercialCGL.Party, Shared.CL.Party>();
                cfg.CreateMap<CommercialCGL.PersonalName, Shared.CL.PersonalName>();
                cfg.CreateMap<CommercialCGL.CoverageElectionParameter, Shared.CL.CoverageElectionParameter>();
                cfg.CreateMap<CommercialCGL.PartyListing, Shared.CL.PartyListing>();

            });
            mapperConfiguration = config;
            var mapper = new AutoMapper.Mapper(config);
            return mapper;
        }


        public static AutoMapper.Mapper InitializeAutomapperCUMB()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<CommercialUMB.retrievePolicyByPolicyNumberResponse, Shared.CL.CLSourceSystemEntity>()
                .ForMember(dest => dest.PolicyData, act => act.MapFrom(src => src.RetrievePolicyByPolicyNumberResponseMessage));
                cfg.CreateMap<CommercialUMB.retrievePolicyByQuoteNumberResponse, Shared.CL.CLSourceSystemEntity>()
               .ForMember(dest => dest.PolicyData, act => act.MapFrom(src => src.RetrievePolicyByQuoteNumberResponseMessage));

                cfg.CreateMap<CommercialUMB.RetrievePolicyByPolicyNumberResponseMessage, Shared.CL.RetrievePolicyByPolicyNumberResponseMessage>();
                cfg.CreateMap<CommercialUMB.RetrievePolicyByQuoteNumberResponseMessage, Shared.CL.RetrievePolicyByPolicyNumberResponseMessage>();

                cfg.CreateMap<CommercialUMB.Policy, Shared.CL.Policy>();
                cfg.CreateMap<CommercialUMB.Account, Shared.CL.Account>();
                cfg.CreateMap<CommercialUMB.Organization, Shared.CL.Organization>();
                cfg.CreateMap<CommercialUMB.PartyAddress, Shared.CL.PartyAddress>();
                cfg.CreateMap<CommercialUMB.Address, Shared.CL.Address>();
                cfg.CreateMap<CommercialUMB.Municipality, Shared.CL.Municipality>();
                cfg.CreateMap<CommercialUMB.CountrySubdivision, Shared.CL.CountrySubdivision>();
                cfg.CreateMap<CommercialUMB.PolicyPeriod, Shared.CL.PolicyPeriod>();
                cfg.CreateMap<CommercialUMB.PolicyLine, Shared.CL.PolicyLine>();
                cfg.CreateMap<CommercialUMB.CoverageElectionParameter, Shared.CL.CoverageElectionParameter>();
                cfg.CreateMap<CommercialUMB.Person, Shared.CL.Person>();
                cfg.CreateMap<CommercialUMB.Party, Shared.CL.Party>();
                cfg.CreateMap<CommercialUMB.PersonalName, Shared.CL.PersonalName>();
                cfg.CreateMap<CommercialUMB.CoverageElectionParameter, Shared.CL.CoverageElectionParameter>();
                cfg.CreateMap<CommercialUMB.PartyListing, Shared.CL.PartyListing>();

            });
            mapperConfiguration = config;
            var mapper = new AutoMapper.Mapper(config);
            return mapper;
        }

        public static AutoMapper.Mapper InitializeAutomapperMulti()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<CommercialMulti.retrieveAccountInformationResponse, Shared.PCMulti.PCMultiSourceSystemEntity>();
                cfg.CreateMap<CommercialMulti.RetrieveAccountInformationResponseMessage, Shared.PCMulti.RetrieveAccountInformationResponseMessage>();
                cfg.CreateMap<CommercialMulti.AccountInformationMessage, Shared.PCMulti.AccountInformationMessage>();
                cfg.CreateMap<CommercialMulti.PolicyTransactionDetailsDTO, Shared.PCMulti.PolicyTransactionDetailsDTO>();
                cfg.CreateMap<CommercialMulti.SubLineDTO, Shared.PCMulti.SubLineDTO>();
                cfg.CreateMap<CommercialMulti.AccountRoleInformationDTO, Shared.PCMulti.AccountRoleInformationDTO>();
                cfg.CreateMap<CommercialMulti.ADSAddressDTO, Shared.PCMulti.ADSAddressDTO>();

            });
            mapperConfiguration = config;
            var mapper = new AutoMapper.Mapper(config);
            return mapper;
        }

        public static AutoMapper.Mapper InitializeAutomapperBCPA()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<BCSourceSystemData.retrievePolicyInvoiceDetailsResponse, Shared.BC.BCSourceSystemEntity>();
                cfg.CreateMap<BCSourceSystemData.retrieveInvoiceTransactionsResponse, Shared.BC.BCSourceSystemEntity>();

                cfg.CreateMap<BCSourceSystemData.RetrievePolicyInvoiceResponse, Shared.BC.RetrievePolicyInvoiceResponse>();
                cfg.CreateMap<BCSourceSystemData.RetrieveInvoiceTransactionsResponse, Shared.BC.RetrieveInvoiceTransactionsResponse>();

                cfg.CreateMap<BCSourceSystemData.retrieveProducerStatementDetailsResponse, Shared.BC.BCSourceSystemEntity>();
                cfg.CreateMap<BCSourceSystemData.RetrieveProducerStatementResponse, Shared.BC.RetrieveProducerStatementResponse>();

                cfg.CreateMap<BCSourceSystemData.ProducerStatement, Shared.BC.ProducerStatement>();
                cfg.CreateMap<BCSourceSystemData.Producer1, Shared.BC.Producer1>();
                cfg.CreateMap<BCSourceSystemData.ProducerCode1, Shared.BC.ProducerCode1>();
                cfg.CreateMap<BCSourceSystemData.ProducerActivity, Shared.BC.ProducerActivity>();
                cfg.CreateMap<BCSourceSystemData.ProducerActivity, Shared.BC.ProducerActivity>();

                cfg.CreateMap<BCSourceSystemData.PolicyPeriod, Shared.BC.PolicyPeriod>();
                cfg.CreateMap<BCSourceSystemData.Account, Shared.BC.Account>();
                cfg.CreateMap<BCSourceSystemData.Cancellation, Shared.BC.Cancellation>();
                cfg.CreateMap<BCSourceSystemData.PolicyPeriodContact, Shared.BC.PolicyPeriodContact>();
                cfg.CreateMap<BCSourceSystemData.Contact, Shared.BC.Contact>();
                cfg.CreateMap<BCSourceSystemData.ContactEntityPerson, Shared.BC.ContactEntityPerson>();
                cfg.CreateMap<BCSourceSystemData.ContactEntityPersonPrefix, Shared.BC.ContactEntityPersonPrefix>();
                cfg.CreateMap<BCSourceSystemData.ContactEntityPersonSuffix, Shared.BC.ContactEntityPersonSuffix>();
                cfg.CreateMap<BCSourceSystemData.Address, Shared.BC.Address>();
                cfg.CreateMap<BCSourceSystemData.AddressState, Shared.BC.AddressState>();
                cfg.CreateMap<BCSourceSystemData.ContactSubtype, Shared.BC.ContactSubtype>();
                cfg.CreateMap<BCSourceSystemData.PolPeriodContactRole, Shared.BC.PolPeriodContactRole>();
                cfg.CreateMap<BCSourceSystemData.PolPeriodContactRoleRole, Shared.BC.PolPeriodContactRoleRole>();
                cfg.CreateMap<BCSourceSystemData.PolicyPeriodHOPolicyType_Ext, Shared.BC.PolicyPeriodHOPolicyType_Ext>();
                cfg.CreateMap<BCSourceSystemData.PolicyPeriodNotHonoredPaymentReason_Ext, Shared.BC.PolicyPeriodNotHonoredPaymentReason_Ext>();
                cfg.CreateMap<BCSourceSystemData.Invoice, Shared.BC.Invoice>();
                cfg.CreateMap<BCSourceSystemData.Policy, Shared.BC.Policy>();
                cfg.CreateMap<BCSourceSystemData.PolicyLOBCode, Shared.BC.PolicyLOBCode>();
                cfg.CreateMap<BCSourceSystemData.ProducerCode, Shared.BC.ProducerCode>();
                cfg.CreateMap<BCSourceSystemData.Producer, Shared.BC.Producer>();
                cfg.CreateMap<BCSourceSystemData.PolicyPeriodRiskState, Shared.BC.PolicyPeriodRiskState>();
                cfg.CreateMap<BCSourceSystemData.PolicyPeriodStatus, Shared.BC.PolicyPeriodStatus>();
                cfg.CreateMap<BCSourceSystemData.PolicyPeriodUWCompany, Shared.BC.PolicyPeriodUWCompany>();
                cfg.CreateMap<BCSourceSystemData.AccountViewTransactionDetails, Shared.BC.AccountViewTransactionDetails>();
                cfg.CreateMap<BCSourceSystemData.AccountInvoice, Shared.BC.AccountInvoice>();

            });
            mapperConfiguration = config;
            var mapper = new AutoMapper.Mapper(config);
            return mapper;
        }
        public static AutoMapper.Mapper InitializeAutomapperPCWCU()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<WCUSourceSystemData.retrievePolicyByPolicyNumberResponse, AdhocCorrespondenceEditor.Shared.WCU.PCWCUSourceSystemEntity>()
                .ForMember(dest => dest.PolicyData, act => act.MapFrom(src => src.retrievePolicyByPolicyNumberRespMsg));
                cfg.CreateMap<WCUSourceSystemData.retrievePolicySummaryByQuoteNumberResponse, AdhocCorrespondenceEditor.Shared.WCU.PCWCUSourceSystemEntity>()
               .ForMember(dest => dest.PolicyData, act => act.MapFrom(src => src.retrievePolicySummaryByQuoteNumberRespMsg));

                cfg.CreateMap<WCUSourceSystemData.RetrievePolicyByPolicyNumberResponseMessage, Shared.WCU.RetrievePolicyResponseMessage>();
                cfg.CreateMap<WCUSourceSystemData.RetrievePolicySummaryByQuoteNumberResponseMessage, Shared.WCU.RetrievePolicyResponseMessage>();
                cfg.CreateMap<WCUSourceSystemData.Policy, Shared.WCU.Policy>();
                cfg.CreateMap<WCUSourceSystemData.Address, Shared.WCU.Address>();
                cfg.CreateMap<WCUSourceSystemData.Municipality, Shared.WCU.Municipality>();
                cfg.CreateMap<WCUSourceSystemData.CountrySubdivision, Shared.WCU.CountrySubdivision>();
                cfg.CreateMap<WCUSourceSystemData.IdentificationDetails, Shared.WCU.IdentificationDetails>();
                cfg.CreateMap<WCUSourceSystemData.PhoneNumber, Shared.WCU.PhoneNumber>();
                cfg.CreateMap<WCUSourceSystemData.PartyPhoneNumber, Shared.WCU.PartyPhoneNumber>();
                cfg.CreateMap<WCUSourceSystemData.PartyAddress, Shared.WCU.PartyAddress>();
                cfg.CreateMap<WCUSourceSystemData.Organization, Shared.WCU.Organization>();
                cfg.CreateMap<WCUSourceSystemData.Trade, Shared.WCU.Trade>();
                cfg.CreateMap<WCUSourceSystemData.PersonalName, Shared.WCU.PersonalName>();
                cfg.CreateMap<WCUSourceSystemData.Person, Shared.WCU.Person>();
                cfg.CreateMap<WCUSourceSystemData.Party, Shared.WCU.Party>();
                cfg.CreateMap<WCUSourceSystemData.PolicyLine, Shared.WCU.PolicyLine>();
                cfg.CreateMap<WCUSourceSystemData.PolicyPeriod, Shared.WCU.PolicyPeriod>();
                cfg.CreateMap<WCUSourceSystemData.Account, Shared.WCU.Account>();
            });
            mapperConfiguration = config;
            var mapper = new AutoMapper.Mapper(config);
            return mapper;
        }


        public static AutoMapper.Mapper InitializeAutomapperPCUMB()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<PCUMBSourceSystemData.retrievePolicyByPolicyNumberResponse, Shared.PL.PLSourceSystemEntity>()
                .ForMember(dest => dest.PolicyData, act => act.MapFrom(src => src.retrievePolicyByPolicyNumberRespMsg));
                cfg.CreateMap<PCUMBSourceSystemData.retrievePolicyByQuoteNumberResponse, Shared.PL.PLSourceSystemEntity>()
               .ForMember(dest => dest.PolicyData, act => act.MapFrom(src => src.retrievePolicyByQuoteNumberRespMsg));

                cfg.CreateMap<PCUMBSourceSystemData.RetrievePolicyByPolicyNumberResponseMessage, Shared.PL.RetrievePolicyByPolicyNumberResponseMessage>();
                cfg.CreateMap<PCUMBSourceSystemData.RetrievePolicyByQuoteNumberResponseMessage, Shared.PL.RetrievePolicyByPolicyNumberResponseMessage>();

                cfg.CreateMap<PCUMBSourceSystemData.Policy, Shared.PL.Policy>();
                cfg.CreateMap<PCUMBSourceSystemData.NotableEvent, Shared.PL.NotableEvent>();
                cfg.CreateMap<PCUMBSourceSystemData.SpecialDividend, Shared.PL.SpecialDividend>();
                cfg.CreateMap<PCUMBSourceSystemData.Organization, Shared.PL.Organization>();
                cfg.CreateMap<PCUMBSourceSystemData.PartyAddress, Shared.PL.PartyAddress>();
                cfg.CreateMap<PCUMBSourceSystemData.Address, Shared.PL.Address>();
                cfg.CreateMap<PCUMBSourceSystemData.Municipality, Shared.PL.Municipality>();
                cfg.CreateMap<PCUMBSourceSystemData.CountrySubdivision, Shared.PL.CountrySubdivision>();
                cfg.CreateMap<PCUMBSourceSystemData.PartyEmailAddress, Shared.PL.PartyEmailAddress>();
                cfg.CreateMap<PCUMBSourceSystemData.EmailAddress, Shared.PL.EmailAddress>();
                cfg.CreateMap<PCUMBSourceSystemData.PartyPhoneNumber, Shared.PL.PartyPhoneNumber>();
                cfg.CreateMap<PCUMBSourceSystemData.PhoneNumber, Shared.PL.PhoneNumber>();
                cfg.CreateMap<PCUMBSourceSystemData.PolicyPeriod, Shared.PL.PolicyPeriod>();
                cfg.CreateMap<PCUMBSourceSystemData.RelatedPolicy, Shared.PL.RelatedPolicy>();
                cfg.CreateMap<PCUMBSourceSystemData.PolicyLine, Shared.PL.PolicyLine>();
                cfg.CreateMap<PCUMBSourceSystemData.UmbrellaLine, Shared.PL.UmbrellaLine>();
                cfg.CreateMap<PCUMBSourceSystemData.HouseholdMember, Shared.PL.HouseholdMember>();
                cfg.CreateMap<PCUMBSourceSystemData.CoverageElectionParameter, Shared.PL.CoverageElectionParameter>();
                cfg.CreateMap<PCUMBSourceSystemData.PartyListing, Shared.PL.PartyListing>();
                cfg.CreateMap<PCUMBSourceSystemData.Party, Shared.PL.Party>();
                cfg.CreateMap<PCUMBSourceSystemData.Person, Shared.PL.Person>();
                cfg.CreateMap<PCUMBSourceSystemData.PersonalName, Shared.PL.PersonalName>();
                cfg.CreateMap<PCUMBSourceSystemData.VehicleDriverLicense, Shared.PL.VehicleDriverLicense>();
                cfg.CreateMap<PCUMBSourceSystemData.FinancialInstitution, Shared.PL.FinancialInstitution>();
                cfg.CreateMap<PCUMBSourceSystemData.PolicyLocation, Shared.PL.PolicyLocation>();
                cfg.CreateMap<PCUMBSourceSystemData.CoverageStatus, Shared.PL.CoverageStatus>();
                //cfg.CreateMap<PCUMBSourceSystemData.Endorsement, Shared.PL.Endorsement>();
                cfg.CreateMap<PCUMBSourceSystemData.Discount, Shared.PL.Discount>();
                cfg.CreateMap<PCUMBSourceSystemData.SummaryAmount, Shared.PL.SummaryAmount>();
                cfg.CreateMap<PCUMBSourceSystemData.VehicleExposure, Shared.PL.VehicleExposure>();
                cfg.CreateMap<PCUMBSourceSystemData.VehicleFeature, Shared.PL.VehicleFeature>();
                cfg.CreateMap<PCUMBSourceSystemData.Vehicle, Shared.PL.Vehicle>();
                cfg.CreateMap<PCUMBSourceSystemData.WatercraftExposure, Shared.PL.WatercraftExposure>();
                cfg.CreateMap<PCUMBSourceSystemData.Watercraft, Shared.PL.Watercraft>();
                cfg.CreateMap<PCUMBSourceSystemData.LocationExposure, Shared.PL.LocationExposure>();
                cfg.CreateMap<PCUMBSourceSystemData.ExposureIndicators, Shared.PL.ExposureIndicators>();
                cfg.CreateMap<PCUMBSourceSystemData.AutoMobileIndicators, Shared.PL.AutoMobileIndicators>();
                cfg.CreateMap<PCUMBSourceSystemData.MotorCycleIndicators, Shared.PL.MotorCycleIndicators>();
                cfg.CreateMap<PCUMBSourceSystemData.RecreationalMotorVehicleIndicators, Shared.PL.RecreationalMotorVehicleIndicators>();
                cfg.CreateMap<PCUMBSourceSystemData.WatercraftIndicators, Shared.PL.WatercraftIndicators>();
                cfg.CreateMap<PCUMBSourceSystemData.VacatLandIndicators, Shared.PL.VacatLandIndicators>();
                cfg.CreateMap<PCUMBSourceSystemData.SummaryAmount, Shared.PL.SummaryAmount>();
            });
            mapperConfiguration = config;
            var mapper = new AutoMapper.Mapper(config);
            return mapper;
        }


        public static AutoMapper.Mapper InitializeAutomapperPCDWHO()
        {

            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<PCHODWSourceSystemData.retrievePolicyByPolicyNumberResponse, Shared.PL.PLSourceSystemEntity>()
                .ForMember(dest => dest.PolicyData, act => act.MapFrom(src => src.retrievePolicyByPolicyNumberRespMsg));
                cfg.CreateMap<PCHODWSourceSystemData.retrievePolicyByQuoteNumberResponse, Shared.PL.PLSourceSystemEntity>()
               .ForMember(dest => dest.PolicyData, act => act.MapFrom(src => src.retrievePolicyByQuoteNumberRespMsg));

                cfg.CreateMap<PCHODWSourceSystemData.RetrievePolicyByPolicyNumberResponseMessage, Shared.PL.RetrievePolicyByPolicyNumberResponseMessage>();
                cfg.CreateMap<PCHODWSourceSystemData.RetrievePolicyByQuoteNumberResponseMessage, Shared.PL.RetrievePolicyByPolicyNumberResponseMessage>();


                cfg.CreateMap<PCHODWSourceSystemData.Policy, Shared.PL.Policy>();
                cfg.CreateMap<PCHODWSourceSystemData.NotableEvent, Shared.PL.NotableEvent>();
                cfg.CreateMap<PCHODWSourceSystemData.SpecialDividend, Shared.PL.SpecialDividend>();
                cfg.CreateMap<PCHODWSourceSystemData.Organization, Shared.PL.Organization>();
                cfg.CreateMap<PCHODWSourceSystemData.PartyAddress, Shared.PL.PartyAddress>();
                cfg.CreateMap<PCHODWSourceSystemData.Address, Shared.PL.Address>();
                cfg.CreateMap<PCHODWSourceSystemData.Municipality, Shared.PL.Municipality>();
                cfg.CreateMap<PCHODWSourceSystemData.CountrySubdivision, Shared.PL.CountrySubdivision>();
                cfg.CreateMap<PCHODWSourceSystemData.PartyEmailAddress, Shared.PL.PartyEmailAddress>();
                cfg.CreateMap<PCHODWSourceSystemData.EmailAddress, Shared.PL.EmailAddress>();
                cfg.CreateMap<PCHODWSourceSystemData.PartyPhoneNumber, Shared.PL.PartyPhoneNumber>();
                cfg.CreateMap<PCHODWSourceSystemData.PhoneNumber, Shared.PL.PhoneNumber>();
                cfg.CreateMap<PCHODWSourceSystemData.PolicyPeriod, Shared.PL.PolicyPeriod>();
                cfg.CreateMap<PCHODWSourceSystemData.RelatedPolicy, Shared.PL.RelatedPolicy>();
                cfg.CreateMap<PCHODWSourceSystemData.PolicyLine, Shared.PL.PolicyLine>();
                cfg.CreateMap<PCHODWSourceSystemData.CoverageElectionParameter, Shared.PL.CoverageElectionParameter>();
                cfg.CreateMap<PCHODWSourceSystemData.PartyListing, Shared.PL.PartyListing>();
                cfg.CreateMap<PCHODWSourceSystemData.Party, Shared.PL.Party>();
                cfg.CreateMap<PCHODWSourceSystemData.Person, Shared.PL.Person>();
                cfg.CreateMap<PCHODWSourceSystemData.PersonalName, Shared.PL.PersonalName>();
                cfg.CreateMap<PCHODWSourceSystemData.FinancialInstitution, Shared.PL.FinancialInstitution>();
                cfg.CreateMap<PCHODWSourceSystemData.PolicyLocation, Shared.PL.PolicyLocation>();
                cfg.CreateMap<PCHODWSourceSystemData.CoverageStatus, Shared.PL.CoverageStatus>();
                //cfg.CreateMap<PCHODWSourceSystemData.Endorsement, Shared.PCUMB.Endorsement>();
                cfg.CreateMap<PCHODWSourceSystemData.Discount, Shared.PL.Discount>();
                cfg.CreateMap<PCHODWSourceSystemData.SummaryAmount, Shared.PL.SummaryAmount>();
                cfg.CreateMap<PCHODWSourceSystemData.NonCoverageCharge, Shared.PL.NonCoverageCharge>();
                cfg.CreateMap<PCHODWSourceSystemData.CertificateOfInsurance, Shared.PL.CertificateOfInsurance>();
                cfg.CreateMap<PCHODWSourceSystemData.HomeownersLine, Shared.PL.HomeownersLine>();
                cfg.CreateMap<PCHODWSourceSystemData.DwellingCoverageListing, Shared.PL.DwellingCoverageListing>();
                cfg.CreateMap<PCHODWSourceSystemData.DwellingAddress, Shared.PL.DwellingAddress>();
                cfg.CreateMap<PCHODWSourceSystemData.DwellingUsage, Shared.PL.DwellingUsage>();
                cfg.CreateMap<PCHODWSourceSystemData.Form, Shared.PL.Form>();
                cfg.CreateMap<PCHODWSourceSystemData.ScheduledItem, Shared.PL.ScheduledItem>();
            });
            mapperConfiguration = config;
            var mapper = new AutoMapper.Mapper(config);
            return mapper;
        }

        public static AutoMapper.Mapper InitializeAutomapperWCC()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<WCCSourceSystemData.CorrespondenceDataResponse, Shared.WCC.WCCSourceSystemEntity>()
                .ForMember(dest => dest.Claim, act => act.MapFrom(src => src.Claim));
                cfg.CreateMap<WCCSourceSystemData.Claim, Shared.WCC.Claim>();
                cfg.CreateMap<WCCSourceSystemData.Subrogation, Shared.WCC.Subrogation>();
                cfg.CreateMap<WCCSourceSystemData.PhysicalTherapy, Shared.WCC.PhysicalTherapy>();
                cfg.CreateMap<WCCSourceSystemData.Procedure, Shared.WCC.Procedure>();
                cfg.CreateMap<WCCSourceSystemData.Precertification, Shared.WCC.Precertification>();
                cfg.CreateMap<WCCSourceSystemData.Policy, Shared.WCC.Policy>();
                cfg.CreateMap<WCCSourceSystemData.Party, Shared.WCC.Party>()
                .ForMember(dest => dest.Role, act => act.MapFrom<RoleNameResolver>());
                cfg.CreateMap<WCCSourceSystemData.PhoneNumber, Shared.WCC.PhoneNumber>();
                cfg.CreateMap<WCCSourceSystemData.EmailAddress, Shared.WCC.EmailAddress>();
                cfg.CreateMap<WCCSourceSystemData.Address, Shared.WCC.Address>();
                cfg.CreateMap<WCCSourceSystemData.EmploymentRelationship, Shared.WCC.EmploymentRelationship>();
                cfg.CreateMap<WCCSourceSystemData.WorkStatus, Shared.WCC.WorkStatus>();
                cfg.CreateMap<WCCSourceSystemData.BenefitPaid, Shared.WCC.BenefitPaid>();
                cfg.CreateMap<WCCSourceSystemData.PartyRelationship, Shared.WCC.PartyRelationship>();
                cfg.CreateMap<WCCSourceSystemData.Vehicle, Shared.WCC.Vehicle>();
                cfg.CreateMap<WCCSourceSystemData.Incident, Shared.WCC.Incident>();
                cfg.CreateMap<WCCSourceSystemData.InjuredBodyPart, Shared.WCC.InjuredBodyPart>();
                cfg.CreateMap<WCCSourceSystemData.Matter, Shared.WCC.Matter>();
                cfg.CreateMap<WCCSourceSystemData.MatterStatus, Shared.WCC.MatterStatus>();
                cfg.CreateMap<WCCSourceSystemData.NJMAgreedBodyPartImpairment, Shared.WCC.NJMAgreedBodyPartImpairment>();
                cfg.CreateMap<WCCSourceSystemData.FinancialReport, Shared.WCC.FinancialReport>();
                cfg.CreateMap<WCCSourceSystemData.FinancialReportLineItem, Shared.WCC.FinancialReportLineItem>();
                cfg.CreateMap<WCCSourceSystemData.DMEDetail, Shared.WCC.DMEDetail>();
                cfg.CreateMap<WCCSourceSystemData.Precertification, Shared.WCC.Precertification>();
            });
            mapperConfiguration = config;
            var mapper = new AutoMapper.Mapper(config);
            return mapper;
        }

        public static AutoMapper.Mapper InitializeAutomapperPCPA()
        {

            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<PCPASourceSystemData.retrievePolicyByPolicyNumberResponse, Shared.PCPA.PLAutoSourceSystemEntity>()
                .ForMember(dest => dest.PolicyData, act => act.MapFrom(src => src.retrievePolicyByPolicyNumberRespMsg));
                cfg.CreateMap<PCPASourceSystemData.retrievePolicyByQuoteNumberResponse, Shared.PCPA.PLAutoSourceSystemEntity>()
               .ForMember(dest => dest.PolicyData, act => act.MapFrom(src => src.retrievePolicyByQuoteNumberRespMsg));

                cfg.CreateMap<PCPASourceSystemData.RetrievePolicyByPolicyNumberResponseMessage, Shared.PCPA.RetrievePolicyByPolicyNumberResponseMessage>();
                cfg.CreateMap<PCPASourceSystemData.RetrievePolicyByQuoteNumberResponseMessage, Shared.PCPA.RetrievePolicyByPolicyNumberResponseMessage>();


                cfg.CreateMap<PCPASourceSystemData.Policy, Shared.PCPA.Policy>();
                cfg.CreateMap<PCPASourceSystemData.NotableEvent, Shared.PCPA.NotableEvent>();
                cfg.CreateMap<PCPASourceSystemData.SpecialDividend, Shared.PCPA.SpecialDividend>();
                cfg.CreateMap<PCPASourceSystemData.Organization, Shared.PCPA.Organization>();
                cfg.CreateMap<PCPASourceSystemData.PartyAddress, Shared.PCPA.PartyAddress>();
                cfg.CreateMap<PCPASourceSystemData.Address, Shared.PCPA.Address>();
                cfg.CreateMap<PCPASourceSystemData.Municipality, Shared.PCPA.Municipality>();
                cfg.CreateMap<PCPASourceSystemData.CountrySubdivision, Shared.PCPA.CountrySubdivision>();
                cfg.CreateMap<PCPASourceSystemData.EmailAddress, Shared.PCPA.EmailAddress>();
                cfg.CreateMap<PCPASourceSystemData.PartyPhoneNumber, Shared.PCPA.PartyPhoneNumber>();
                cfg.CreateMap<PCPASourceSystemData.PhoneNumber, Shared.PCPA.PhoneNumber>();
                cfg.CreateMap<PCPASourceSystemData.PolicyPeriod, Shared.PCPA.PolicyPeriod>();
                cfg.CreateMap<PCPASourceSystemData.AssociatedPolicy, Shared.PCPA.AssociatedPolicy>();
                cfg.CreateMap<PCPASourceSystemData.PolicyLine, Shared.PCPA.PolicyLine>();
                cfg.CreateMap<PCPASourceSystemData.CoverageElectionParameter, Shared.PCPA.CoverageElectionParameter>();
                cfg.CreateMap<PCPASourceSystemData.PartyListing, Shared.PCPA.PartyListing>();
                cfg.CreateMap<PCPASourceSystemData.Party, Shared.PCPA.Party>();
                cfg.CreateMap<PCPASourceSystemData.Person, Shared.PCPA.Person>();
                cfg.CreateMap<PCPASourceSystemData.PersonalName, Shared.PCPA.PersonalName>();
                cfg.CreateMap<PCPASourceSystemData.VehicleDriverLicense, Shared.PCPA.VehicleDriverLicense>();
                cfg.CreateMap<PCPASourceSystemData.PolicyLocation, Shared.PCPA.PolicyLocation>();
                cfg.CreateMap<PCPASourceSystemData.CoverageStatus, Shared.PCPA.CoverageStatus>();
                //cfg.CreateMap<PCPASourceSystemData.Endorsement, Shared.PCUMB.Endorsement>();
                cfg.CreateMap<PCPASourceSystemData.Discount, Shared.PCPA.Discount>();
                cfg.CreateMap<PCPASourceSystemData.SummaryAmount, Shared.PCPA.SummaryAmount>();
                cfg.CreateMap<PCPASourceSystemData.RatingWorksheet, Shared.PCPA.RatingWorksheet>();
                cfg.CreateMap<PCPASourceSystemData.NonCoverageCharge, Shared.PCPA.NonCoverageCharge>();
                cfg.CreateMap<PCPASourceSystemData.Vehicle, Shared.PCPA.Vehicle>();
                cfg.CreateMap<PCPASourceSystemData.VehicleFeature, Shared.PCPA.VehicleFeature>();
                cfg.CreateMap<PCPASourceSystemData.Account, Shared.PCPA.Account>();
                cfg.CreateMap<PCPASourceSystemData.PolicyComment, Shared.PCPA.PolicyComment>();
                cfg.CreateMap<PCPASourceSystemData.IdentificationDetails, Shared.PCPA.IdentificationDetails>();
                cfg.CreateMap<PCPASourceSystemData.Trade, Shared.PCPA.Trade>();
                cfg.CreateMap<PCPASourceSystemData.PersonalAutoLine, Shared.PCPA.PersonalAutoLine>();
                cfg.CreateMap<PCPASourceSystemData.Report, Shared.PCPA.Report>();
                cfg.CreateMap<PCPASourceSystemData.ActivityRecord, Shared.PCPA.ActivityRecord>();
                cfg.CreateMap<PCPASourceSystemData.VehicleCoverageListing, Shared.PCPA.VehicleCoverageListing>();
                cfg.CreateMap<PCPASourceSystemData.IDCardEffectiveDate, Shared.PCPA.IDCardEffectiveDate>();
                cfg.CreateMap<PCPASourceSystemData.VehicleUsage, Shared.PCPA.VehicleUsage>();
            });
            mapperConfiguration = config;
            var mapper = new AutoMapper.Mapper(config);
            return mapper;
        }

        public class RoleNameResolver : IValueResolver<WCCSourceSystemData.Party, Shared.WCC.Party, string[]>
        {
            public string[] Resolve(WCCSourceSystemData.Party source, Shared.WCC.Party destination, string[] member, ResolutionContext context)
            {
                try
                {
                    if (source.Role == null)
                        return new string[0];
                    source.Role = Array.ConvertAll(source.Role, x =>
                    {
                        return x.Replace("\'", "");

                    });
                    source.Role = Array.ConvertAll(source.Role, x =>
                     {
                         var roleValue = x.Replace("'", "");
                         if (x.Contains("Adjuster - I") || x.Contains("Adjuster - II") || x.Contains("Adjuster - III"))
                             return "Adjuster";
                         else if (x.Contains("Awards Representative"))
                             return "Awards Rep";
                         else if (x.Contains("Case Management Representative"))
                             return "Case Management Rep";
                         else if (x.Contains("DME Representative"))
                             return "DME Rep";
                         else if (x.Contains("FNOL Representative"))
                             return "FNOL Rep";
                         else if (x.Contains("Bill Processor"))
                             return "Medical Services";
                         else if (x.Contains("Provider Services Representative"))
                             return "Provider Services Rep";
                         else if (x.Contains("Reinsurance Representative"))
                             return "Reinsurance Rep";
                         else if (x.Contains("Reserve Representative"))
                             return "Reserve Rep";
                         else if (x.Contains("Sales Representative"))
                             return "Sales Rep";
                         else if (x.Contains("SIU Representative"))
                             return "SIU Rep";
                         else if (x.Contains("Subrogation Representative"))
                             return "Subrogation Rep";
                         else if (x.Contains("Utilization Review Representative"))
                             return "Utilization Review Rep";
                         else if (x.Contains("Supervisor"))
                             return "Supervisor";
                         if (roleValue.Equals("Petitioners Attorney") || roleValue.Equals("Petitioners Law Firm"))
                             return roleValue;
                         return x;
                     });
                    return source.Role;
                }
                catch(Exception ex)
                {
                    return new string[0];
                }
            }
        }

        public static AutoMapper.Mapper InitializeAutomapperGC()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<GCSourceSystemData.CorrespondenceDataResponse, Shared.GC.GCSourceSystemEntity>()
                               .ForMember(dest => dest.Claim, act => act.MapFrom(src => src.Claim));
                cfg.CreateMap<GCSourceSystemData.Claim, Shared.GC.Claim>();
                cfg.CreateMap<GCSourceSystemData.Address, Shared.GC.Address>();
                cfg.CreateMap<GCSourceSystemData.Policy, Shared.GC.Policy>();
                cfg.CreateMap<GCSourceSystemData.CoverageTerm, Shared.GC.CoverageTerm>();
                cfg.CreateMap<GCSourceSystemData.Coverages, Shared.GC.Coverages>();
                cfg.CreateMap<GCSourceSystemData.Endorsements, Shared.GC.Endorsements>();
                cfg.CreateMap<GCSourceSystemData.Building, Shared.GC.Building>();
                cfg.CreateMap<GCSourceSystemData.Classification, Shared.GC.Classification>();
                cfg.CreateMap<GCSourceSystemData.Blankets, Shared.GC.Blankets>();
                cfg.CreateMap<GCSourceSystemData.PIPLimits, Shared.GC.PIPLimits>();
                cfg.CreateMap<GCSourceSystemData.BlanketCoverages, Shared.GC.BlanketCoverages>();
                cfg.CreateMap<GCSourceSystemData.Party, Shared.GC.Party>();
                cfg.CreateMap<GCSourceSystemData.PhoneNumber, Shared.GC.PhoneNumber>();
                cfg.CreateMap<GCSourceSystemData.EmailAddress, Shared.GC.EmailAddress>();
                cfg.CreateMap<GCSourceSystemData.Exposure, Shared.GC.Exposure>();
                cfg.CreateMap<GCSourceSystemData.Procedure, Shared.GC.Procedure>();
                cfg.CreateMap<GCSourceSystemData.Determination, Shared.GC.Determination>();
                cfg.CreateMap<GCSourceSystemData.Precertification, Shared.GC.Precertification>();
                cfg.CreateMap<GCSourceSystemData.Transaction, Shared.GC.Transaction>();
                cfg.CreateMap<GCSourceSystemData.Financial, Shared.GC.Financial>();
                cfg.CreateMap<GCSourceSystemData.Check, Shared.GC.Check>();
                cfg.CreateMap<GCSourceSystemData.Vehicle, Shared.GC.Vehicle>();
            });
            mapperConfiguration = config;
            var mapper = new AutoMapper.Mapper(config);
            return mapper;
        }

    }
}
