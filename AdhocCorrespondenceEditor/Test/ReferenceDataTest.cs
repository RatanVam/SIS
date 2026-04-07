using AdhocCorrespondenceEditor.Repository;
using AdhocCorrespondenceEditor.Server.Controllers;
using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Utility.Cache;
using Microsoft.AspNetCore.Mvc;

namespace Test
{
    [TestClass]
    public class ReferenceDataTest
    {
        ACERepository dbContext = new ACERepository();
        CacheHelper cacheHelper = new CacheHelper();
        [TestMethod]
        public void TestGetESBData()
        {
            ReferenceDataController controller = new ReferenceDataController(dbContext, cacheHelper);
            var lobs = controller.GetLOB();
            Assert.IsTrue(lobs.Count() == 14);
        }
        [TestMethod]
        public void TestGetCategory()
        {
            ReferenceDataController controller = new ReferenceDataController(dbContext, cacheHelper);
            var categories = controller.GetCategory();
            Assert.IsTrue(categories.Count() > 0);
        }
        [TestMethod]
        [DataRow("PC-CA", "Inspire_Developers", "2")]
        [DataRow("PC-CUMB", "Inspire_Developers", "1")]
        public void TestGetCategorySecond(string lobName, string rollNames, string noofCategorys)
        {
            ReferenceDataController controller = new ReferenceDataController(dbContext, cacheHelper);
            var actionResult = controller.GetCategory(lobName, rollNames) as OkObjectResult; ;

            Assert.IsTrue(actionResult.StatusCode == 200);
          //  //Assert.IsInstanceOfType(actionResult.Value, typeof(IEnumerable<CategoryEntity>));
          //  var result = (actionResult.Value as IEnumerable<CategoryEntity>).Count();
          ////  Assert.IsTrue(result.ToString() == noofCategorys);
        }



        [TestMethod]

        public void TestGetDocument()
        {
            ReferenceDataController controller = new ReferenceDataController(dbContext, cacheHelper);
            var lobs = controller.GetDocument();
            Assert.IsTrue(lobs.Count() > 0);
        }

        [TestMethod]
        [DataRow(1,1)]
        [DataRow(2,1)]
        [DataRow(3,1)]
        public void TestGetDocumentSecond(int categoryId, int noofDocuemnts)
        {
            ReferenceDataController controller = new ReferenceDataController(dbContext, cacheHelper);
            var actionResult = controller.GetDocument(categoryId) as OkObjectResult;

            Assert.IsTrue(actionResult.StatusCode ==200);
        }

        [TestMethod]
        [DataRow(1,3)]
        [DataRow(2,4)]
        public void TestGetDocumentControl(int documentId, int controls)
        {
            ReferenceDataController controller = new ReferenceDataController(dbContext, cacheHelper);
            var actionResult = controller.GetDocumentControl(documentId) as OkObjectResult; ;

            Assert.IsNotNull(actionResult);
            //  Assert.IsInstanceOfType(actionResult.Value, typeof(IEnumerable<DocumentControlEntity>));
            var result = (actionResult.Value as IEnumerable<DocumentControlEntity>).Count();
            Assert.IsTrue(result == controls);
        }

        [TestMethod]
        public void TestGetDocumentControlSecond()
        {
            ReferenceDataController controller = new ReferenceDataController(dbContext, cacheHelper);
            var lobs = controller.GetDocumentControl();
            Assert.IsTrue(lobs.Count() > 0);
        }




    }


}