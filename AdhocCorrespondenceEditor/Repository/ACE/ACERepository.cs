using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Shared.Common;
using NJM.DotNetLibrary.ADO;
using NJM.DotNetLibrary.Logging;
using NJM.DotNetLibrary.Common;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using System.Text.Json;
using RuleEntity = AdhocCorrespondenceEditor.Shared.RuleEntity;

namespace AdhocCorrespondenceEditor.Repository
{
    public static class DataTableExtensions
    {
        public static IList<T> ToList<T>(this DataTable table) where T : new()
        {
            IList<PropertyInfo> properties = typeof(T).GetProperties().ToList();
            IList<T> result = new List<T>();

            foreach (var row in table.Rows)
            {
                var item = CreateItemFromRow<T>((DataRow)row, properties);
                result.Add(item);
            }
            return result;
        }

        private static T CreateItemFromRow<T>(DataRow row, IList<PropertyInfo> properties) where T : new()
        {
            T item = new T();
            foreach (var property in properties)
            {
                if (row.Table.Columns.Contains(property.Name))
                {
                    if (row[property.Name] != DBNull.Value)
                        property.SetValue(item, row[property.Name], null);
                }
            }
            return item;
        }
    }

    public class ACERepository : IACERepository
    {
        public IEnumerable<WebServiceEntity> GetWebService()
        {
            var dataTable = Ado.GetDataTable(ApplicationConstants.SPGetWebService);
            return dataTable == null ? null : dataTable.ToList<WebServiceEntity>().ToList();
        }

        public IEnumerable<CategoryEntity> GetCategory()
        {
            var dataTable = Ado.GetDataTable(ApplicationConstants.SPGetCategoty);
            return dataTable == null ? null : dataTable.ToList<CategoryEntity>().ToList();
        }

        public IEnumerable<DocumentEntity> GetDocument()
        {
            var dataTable = Ado.GetDataTable(ApplicationConstants.SPGetDocument);
            return dataTable == null ? null : dataTable.ToList<DocumentEntity>().ToList();
        }

        public IEnumerable<DocumentControlEntity> GetDocumentControl()
        {
            var dataTable = Ado.GetDataTable(ApplicationConstants.SPGetDocumentControl);
            return dataTable == null ? null : dataTable.ToList<DocumentControlEntity>().ToList();
        }
        public IEnumerable<LOBEntity> GetLOB()
        {
            var dataTable = Ado.GetDataTable(ApplicationConstants.SPGetLOB);
            return dataTable == null ? null : dataTable.ToList<LOBEntity>().ToList();
        }

        public IEnumerable<PrinterLookupEntity> GetPrinterLookupData()
        {
            var dataTable = Ado.GetDataTable(ApplicationConstants.SPGetPrinterLookup);
            return dataTable == null ? null : dataTable.ToList<PrinterLookupEntity>().ToList();
        }

        public IEnumerable<PrinterEntity> GetPrinter()
        {
            var dataTable = Ado.GetDataTable(ApplicationConstants.SPGetPrinter);
            return dataTable == null ? null : dataTable.ToList<PrinterEntity>().ToList();
        }

        public IEnumerable<PolicyLookupEntity> GetPolicyLookupData()
        {
            var dataTable = Ado.GetDataTable(ApplicationConstants.SPGetPolicyLookup);
            return dataTable == null ? null : dataTable.ToList<PolicyLookupEntity>().ToList();
        }

        public IEnumerable<GenericLookupEntity> GetGenericLookupData()
        {
            var dataTable = Ado.GetDataTable(ApplicationConstants.SPGetGenericLookup);
            return dataTable == null ? null : dataTable.ToList<GenericLookupEntity>().ToList();
        }
        public IEnumerable<DocumentDropdownLookupDataEntity> GetDocumentDropdownLookupData()
        {
            var dataTable = Ado.GetDataTable(ApplicationConstants.SPGetDocumentDropdownDataLookup);
            return dataTable == null ? null : dataTable.ToList<DocumentDropdownLookupDataEntity>().ToList();
        }
        public IEnumerable<DocumentDropdownChildControlEntity> GetDocumentDropdownChildControl()
        {
            var dataTable = Ado.GetDataTable(ApplicationConstants.SPGetDocumentDropdownChildControl);
            return dataTable == null ? null : dataTable.ToList<DocumentDropdownChildControlEntity>().ToList();
        }

        public IEnumerable<ConfigurationEntity> GetConfigurationLookupData()
        {
            var dataTable = Ado.GetDataTable(ApplicationConstants.SPConfigurationLookup);
            return dataTable == null ? null : dataTable.ToList<ConfigurationEntity>().ToList();
        }

        public IEnumerable<DenialReasonEnitity> GetDenialReasons()
        {
            var dataTable = Ado.GetDataTable(ApplicationConstants.SPGetDenialReasons);
            return dataTable == null ? null : dataTable.ToList<DenialReasonEnitity>().ToList();
        }
        public IEnumerable<RuleEntity> GetRule()
        {
            var dataTable = Ado.GetDataTable(ApplicationConstants.SPGetRule);
            return dataTable == null ? null : dataTable.ToList<RuleEntity>().ToList();
        }
        public IEnumerable<RuleLookupEntity> GetRuleLookup()
        {
            var dataTable = Ado.GetDataTable(ApplicationConstants.SPGetRuleLookup);
            return dataTable == null ? null : dataTable.ToList<RuleLookupEntity>().ToList();
        }

        public IEnumerable<EZSendRequestData> GetEZSendRequest(string docId)
        {
            var parameter = new SqlParameter("@DocumentId", docId);
            var dataTable = Ado.GetDataTable(ApplicationConstants.SPGetEZSendRequest, parameter);

            var result = new List<EZSendRequestData>();

            if (dataTable != null)
            {
                foreach (DataRow row in dataTable.Rows)
                {
                    var item = new EZSendRequestData
                    {
                        Id = Convert.ToInt32(row["Id"]),
                        UserId = row["UserId"].ToString(),
                        Payload = row["Payload"].ToString(),
                        DocumentId = row["DocumentId"].ToString(),
                        CreatedDateTime = Convert.ToDateTime(row["CreatedDateTime"])
                    };
                    result.Add(item);
                }
            }

            return result;
        }

        public int UpdateUserEZSendRequest(string UserId, int Id)
        {
            var sqlParamters = new[]
            {
                 new SqlParameter("@UserId", UserId),
                 new SqlParameter("@Id", Id)
            };

            return Ado.NonQuery(ApplicationConstants.SPUpdateUserEZSendRequest, sqlParamters);
        }
        public int DeletePrinter(int LOBPrinterId,string userId)
        {
            var sqlParamters = new[]
           {
                new SqlParameter("@LOBPrinterId", LOBPrinterId),
                 new SqlParameter("@UserId", userId),
            };

            return Ado.NonQuery(ApplicationConstants.SPDeletePrinter, sqlParamters);
        }

        public int AddPrinterMap(PrinterLookupRequest printerLookupEntity)
        {
            var sqlParamters = new[]
           {
                 new SqlParameter("@PrinterName", printerLookupEntity.PrinterName),
                 new SqlParameter("@PrinterCode", printerLookupEntity.PrinterCode),
                 new SqlParameter("@LOBName", printerLookupEntity.LOBName),
                 new SqlParameter("@CategoryId", printerLookupEntity.CategoryId),
                 new SqlParameter("@DocumentId", printerLookupEntity.DocumentId),
                 new SqlParameter("@UserId", printerLookupEntity.UserId),

            };

            return Ado.NonQuery(ApplicationConstants.SPAddPrinterMap, sqlParamters);
        }
        public int UpdatePrinterMap(PrinterLookupRequest printerLookupEntity)
        {
            var sqlParamters = new[]
           {
                 new SqlParameter("@LOBPrinterId", printerLookupEntity.LOBPrinterId),
                   new SqlParameter("@CategoryId", printerLookupEntity.CategoryId),
                 new SqlParameter("@DocumentId", printerLookupEntity.DocumentId),
                 new SqlParameter("@UserId", printerLookupEntity.UserId)
            };

            return Ado.NonQuery(ApplicationConstants.SPUpdatePrinterMap, sqlParamters);
        }
        public int UpdateStatusEZSendRequest(int Status, int Id)
        {
            var sqlParamters = new[]
            {
                 new SqlParameter("@Status", Status),
                 new SqlParameter("@Id", Id)
            };

            return Ado.NonQuery(ApplicationConstants.SPUpdateStatusEZSendRequest, sqlParamters);
        }
        public int InsertDocumentLog(DocumentLogEntity documentLogEntity)
        {
            var sqlParamters = new[]
            {
                new SqlParameter("@UserId", documentLogEntity.UserID),
                new SqlParameter("@CreatedTime", documentLogEntity.CreateDateTime),
                new SqlParameter("@Lob", documentLogEntity.LOB),
                new SqlParameter("@LetterName", documentLogEntity.LetterName),
                new SqlParameter("@Payload", documentLogEntity.Payload),
                new SqlParameter("@PolicyNumber", documentLogEntity.PolicyNumber),
                new SqlParameter("@Environment", documentLogEntity.Environment),
                new SqlParameter("@BaseState", documentLogEntity.BaseState),
                new SqlParameter("@ClaimNumber", documentLogEntity.ClaimNumber),
                new SqlParameter("@QuoteNumber", documentLogEntity.QuoteNumber),
                new SqlParameter("@ProducerCode", documentLogEntity.ProducerCode),
                new SqlParameter("@AccountNumber", documentLogEntity.AccountNumber)
            };
            return Ado.NonQuery(ApplicationConstants.SPInsertocumentLog, sqlParamters);
        }

        public int InsertEasySendRequest(EasySendRequest request)
        {
            var sqlParamters = new[]
            {
                new SqlParameter("@UserId", request.UserID),
                new SqlParameter("@Status", request.Status),
                new SqlParameter("@Payload", request.ToJson()),
                new SqlParameter("@DocumentId", request.DocumentSessionID),

            };
            return Ado.NonQuery(ApplicationConstants.SPInsertEzSendRequest, sqlParamters);
        }

        public int AddPrinter(PrinterRequest printerEntity)
        {
            var sqlParamters = new[]
          {
                 new SqlParameter("@PrinterName", printerEntity.PrinterName),
                 new SqlParameter("@PrinterCode", printerEntity.PrinterCode),
                 new SqlParameter("@UserId", printerEntity.UserId),
            };

            return Ado.NonQuery(ApplicationConstants.SPAddPrinter, sqlParamters);
        }

        public int UpdatePrinter(PrinterRequest printerEntity)
        {
            var sqlParamters = new[]
          {
                 new SqlParameter("@PrinterName", printerEntity.PrinterName),
                 new SqlParameter("@PrinterCode", printerEntity.PrinterCode),
                 new SqlParameter("@UserId", printerEntity.UserId),
                 new SqlParameter("@PrinterId", printerEntity.PrinterId),
            };

            return Ado.NonQuery(ApplicationConstants.SPUpdatePrinter, sqlParamters);
        }
    }
}