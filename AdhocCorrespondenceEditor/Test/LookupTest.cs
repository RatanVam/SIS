using AdhocCorrespondenceEditor.Repository;
using AdhocCorrespondenceEditor.Server.Controllers;
using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Utility.Cache;
using Microsoft.AspNetCore.Mvc;

namespace Test
{

    [TestClass]
    public class LookupTest
    {
        ACERepository dbContext = new ACERepository();
        CacheHelper cacheHelper = new CacheHelper();


        [TestMethod]
        public void TestGetWebService()
        {
            LookupController controller = new LookupController(dbContext, cacheHelper);
            var webservicesDetails = controller.GetWebService();
            Assert.IsTrue(webservicesDetails.Count() > 0);
        }


        [TestMethod]
        [DataRow("PC-CA", "ESBUrl", "ISD1")]
        [DataRow("PC-CA", "SampleUrl", "ISD1")]
        public void TestGetWebService(string lobName, string urlType, string environment)
        {
            LookupController controller = new LookupController(dbContext, cacheHelper);
            var actionResult = controller.GetWebService(lobName, urlType, environment) as OkObjectResult; ;

            Assert.IsNotNull(actionResult);
            var result = (actionResult.Value as IEnumerable<PrinterLookupEntity>).Count();
            Assert.IsTrue(result == 1);
        }

        [TestMethod]
        [DataRow("PC-CA", "ESBUrl", "ISD")]
        [DataRow("PC-CA", "SampleUrl1", "ISD1")]
        [DataRow("PC-C", "SampleUrl", "ISD1")]
        public void TestGetWebServiceNoResult(string lobName, string urlType, string environment)
        {
            LookupController controller = new LookupController(dbContext, cacheHelper);
            var actionResult = controller.GetWebService(lobName, urlType, environment) as OkObjectResult; ;

            Assert.IsNull(actionResult);
        }


        [TestMethod]
        public void TestGetPrinter()
        {
            LookupController controller = new LookupController(dbContext, cacheHelper);
            var printers = controller.GetPrinter();
            Assert.IsTrue(printers.Count() > 0);
        }


        [TestMethod]
        [DataRow("PC-CA",7)]
        public void TestGetPrinter(string lobName, int noofPrinters)
        {
            LookupController controller = new LookupController(dbContext, cacheHelper);
            var actionResult = controller.GetPrinter(lobName) as OkObjectResult; ;

            Assert.IsTrue(actionResult.StatusCode == 200);
            //var result = (actionResult.Value as IEnumerable<PrinterLookupEntity>).Count();
            //Assert.IsTrue(result == noofPrinters);
        }

        [TestMethod]
        [DataRow("PC-CA")]
        [DataRow("PC-BOP")]
        [DataRow("PC-CUMB")]
        [DataRow("PC-CGL")]
        [DataRow("PC-MULTI")]
        [DataRow("BC-PA")]
        [DataRow("BC-WCU")]
        public void TestGetPrinterNoResult(string lobName)
        {
            LookupController controller = new LookupController(dbContext, cacheHelper);
            var actionResult = controller.GetPrinter(lobName) as OkObjectResult;
            Assert.IsTrue(actionResult.StatusCode == 200);
            //var result = (actionResult.Value as IEnumerable<PrinterLookupEntity>).Count();
            //Assert.IsTrue(result == 0);

        }

        [TestMethod]
        public void TestGetPolicyLookup()
        {
            LookupController controller = new LookupController(dbContext, cacheHelper);
            var policyLookup = controller.GetPolicyLookup();
            Assert.IsTrue(policyLookup.Count() > 0);
        }
        [TestMethod]
        public void TestGetGenericLookup()
        {
            LookupController controller = new LookupController(dbContext, cacheHelper);
            var categories = controller.GetGenericLookup();
            Assert.IsTrue(categories.Count() > 0);
        }
        [TestMethod]
        public void GetDocumentDropdownLookupData()
        {
            LookupController controller = new LookupController(dbContext, cacheHelper);
            var documentDropdownLookupData = controller.GetDocumentDropdownLookupData();
            Assert.IsTrue(documentDropdownLookupData.Count() == 0);
        }

        [TestMethod]
        [DataRow("PC-CA", 1,"mrlReport")]
        [DataRow("PC-CA", 2, "mrlReport")]
        [DataRow("PC-CA", 3, "mrlReport")]
        public void TestGetDocumentDropdownLookupData(string lobName, int documentID, string key)
        {
            LookupController controller = new LookupController(dbContext, cacheHelper);
            var actionResult = controller.GetDocumentDropdownLookupData(lobName, documentID, key) as OkObjectResult; ;

            Assert.IsTrue(actionResult.StatusCode == 200);
           // Assert.IsInstanceOfType(actionResult.Value, typeof(IEnumerable<DocumentDropdownLookupDataEntity>));
        }        
        

        
        [TestMethod]
        [DataRow("PC-CA")]
        [DataRow("PC-BOP")]
        [DataRow("PC-CUMB")]
        [DataRow("PC-CGL")]
        [DataRow("PC-MULTI")]
        [DataRow("BC-PA")]
        [DataRow("BC-WCU")]
        public void TestGetDocumentDropdownLookupData(string lobName)
        {
            LookupController controller = new LookupController(dbContext, cacheHelper);
            var actionResult = controller.GetConfigurationDatabyLob(lobName) as OkObjectResult; ;

            Assert.IsTrue(actionResult.StatusCode == 200);
        }
    }
}