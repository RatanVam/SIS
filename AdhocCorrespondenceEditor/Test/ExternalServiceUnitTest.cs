using AdhocCorrespondenceEditor.Repository;
using AdhocCorrespondenceEditor.Server.Controllers;
using AdhocCorrespondenceEditor.Shared;

namespace Test
{
    [TestClass]
    public class ExternalServiceUnitTest
    {

        [TestMethod]
        [DataRow("2021-01-26", "PC-CA", "ISD1", "1600539423")]
        [DataRow("2023-06-15", "PC-CA", "ISD1", "1600451272")]
        [DataRow("2023-06-15", "PC-BOP", "ISD1", "1600544902")]
        [DataRow("2023-06-15", "PC-CUMB", "ISD1", "1600542583")]
        [DataRow("2023-06-15", "PC-CGL", "ISD1", "1600527279")]
        [DataRow("2023-06-15", "BC-PA", "ISD1", "H404179558-3")]
        [DataRow("2023-06-15", "BC-WCU", "ISD2", "M309997")]
        public void TestGetESBDataPolicy(string dt, string lob,string environment, string policyNumber)
        {
            var dbContext = new ACERepository();
            var controller = new ExternalServiceController(dbContext);
            SourceSystemInputRequest details = new SourceSystemInputRequest
            {
                AccountNumber = string.Empty,
                AsOfDate = DateTime.Parse(dt),
                ClaimNumber = String.Empty,
                ProducerCode = String.Empty,
                QuoteNumber = String.Empty,
                URL = String.Empty,
                LOB = lob,
                PolicyNumber = policyNumber,
                Environment = environment,
            };

            var data = controller.GetESBData(details);
            Assert.IsTrue(string.IsNullOrEmpty(data.ErroCode) && string.IsNullOrEmpty(data.ErroDiscription));

        }



        [TestMethod]

        [DataRow("2021-01-26", "PC-CA", "ISD1", "160053")]
        [DataRow("2023-06-15", "PC-PA", "ISD1", "1600451272")]
        [DataRow("2023-06-15", "PC-BOP", "ISD1", "160544902")]
        [DataRow("2023-06-15", "PC-CUMB", "ISD1", "160542583")]
        [DataRow("2023-06-15", "PC-CGL", "ISD1", "160057279")]
        [DataRow("2023-06-15", "PC-MULTI", "ISD1", "AA62364623")]
        [DataRow("2023-06-15", "BC-PA", "ISD1", "H417558-3")]
        [DataRow("2023-06-15", "BC-WCU", "ISD2", "M30997456")]
        public void TestGetESBDataNoResultPolicy(string dt, string lob, string environment, string policyNumber)
        {
            var dbContext = new ACERepository();
            var controller = new ExternalServiceController(dbContext);
            SourceSystemInputRequest details = new SourceSystemInputRequest
            {
                AccountNumber = string.Empty,
                AsOfDate = DateTime.Parse(dt),
                ClaimNumber = String.Empty,
                ProducerCode = String.Empty,
                QuoteNumber = String.Empty,
                URL = String.Empty,
                LOB = lob,
                PolicyNumber = policyNumber,
                Environment = environment,
            };

            var data = controller.GetESBData(details);
            Assert.IsTrue(!(string.IsNullOrEmpty(data.ErroCode) && string.IsNullOrEmpty(data.ErroDiscription)));

        }

        [TestMethod]
        [DataRow("2021-01-26", "PC-CA", "ISD1", "QQ715407518")]
        public void TestGetESBDataQuote(string dt, string lob, string environment, string quoteNumber)
        {
            var dbContext = new ACERepository();
            var controller = new ExternalServiceController(dbContext);
            SourceSystemInputRequest details = new SourceSystemInputRequest
            {
                AccountNumber = string.Empty,
                AsOfDate = DateTime.Parse(dt),
                ClaimNumber = String.Empty,
                ProducerCode = String.Empty,
                QuoteNumber = quoteNumber,
                URL = String.Empty,
                LOB = lob,
                PolicyNumber = string.Empty,
                Environment = environment,
            };

            var data = controller.GetESBData(details);
            Assert.IsTrue(string.IsNullOrEmpty(data.ErroCode) && string.IsNullOrEmpty(data.ErroDiscription));

        }
        [TestMethod]
        [DataRow("2021-01-26", "PC-CA", "ISD1", "Q715407518")]
        public void TestGetESBDataNoResultQuote(string dt, string lob, string environment, string quoteNumber)
        {
            var dbContext = new ACERepository();
            var controller = new ExternalServiceController(dbContext);
            SourceSystemInputRequest details = new SourceSystemInputRequest
            {
                AccountNumber = string.Empty,
                AsOfDate = DateTime.Parse(dt),
                ClaimNumber = String.Empty,
                ProducerCode = String.Empty,
                QuoteNumber = quoteNumber,
                URL = String.Empty,
                LOB = lob,
                PolicyNumber = String.Empty,
                Environment = environment,
            };

            var data = controller.GetESBData(details);
            Assert.IsTrue(!(string.IsNullOrEmpty(data.ErroCode) && string.IsNullOrEmpty(data.ErroDiscription)));
        }

        [TestMethod]
        [DataRow("2023-06-15", "PC-MULTI", "ISD1", "AA625364623")]
        public void TestGetESBDataAccount(string dt, string lob, string environment, string AccountyNumber)
        {
            var dbContext = new ACERepository();
            var controller = new ExternalServiceController(dbContext);
            SourceSystemInputRequest details = new SourceSystemInputRequest
            {
                AccountNumber = AccountyNumber,
                AsOfDate = DateTime.Parse(dt),
                ClaimNumber = String.Empty,
                ProducerCode = String.Empty,
                QuoteNumber = String.Empty,
                URL = String.Empty,
                LOB = lob,
                PolicyNumber = string.Empty,
                Environment = environment,
            };

            var data = controller.GetESBData(details);
            Assert.IsTrue(string.IsNullOrEmpty(data.ErroCode) && string.IsNullOrEmpty(data.ErroDiscription));

        }
        [TestMethod]
        [DataRow("2023-06-15", "PC-MULTI", "ISD1", "AA62364623")]
        public void TestGetESBDataNoResultAccount(string dt, string lob, string environment, string accountyNumber)
        {
            var dbContext = new ACERepository();
            var controller = new ExternalServiceController(dbContext);
            SourceSystemInputRequest details = new SourceSystemInputRequest
            {
                AccountNumber = accountyNumber,
                AsOfDate = DateTime.Parse(dt),
                ClaimNumber = String.Empty,
                ProducerCode = String.Empty,
                QuoteNumber = String.Empty,
                URL = String.Empty,
                LOB = lob,
                PolicyNumber = String.Empty,
                Environment = environment,
            };

            var data = controller.GetESBData(details);
            Assert.IsTrue(!(string.IsNullOrEmpty(data.ErroCode) && string.IsNullOrEmpty(data.ErroDiscription)));
        }

        [TestMethod]
        [DataRow("2023-06-15", "BC-WCU", "ISD2", "B2368")]
        public void TestGetESBDataProducerCode(string dt, string lob, string environment, string producerCode)
        {
            var dbContext = new ACERepository();
            var controller = new ExternalServiceController(dbContext);
            SourceSystemInputRequest details = new SourceSystemInputRequest
            {
                AccountNumber = string.Empty,
                AsOfDate = DateTime.Parse(dt),
                ClaimNumber = String.Empty,
                ProducerCode = producerCode,
                QuoteNumber = String.Empty,
                URL = String.Empty,
                LOB = lob,
                PolicyNumber = string.Empty,
                Environment = environment,
            };

            var data = controller.GetESBData(details);
            Assert.IsTrue(string.IsNullOrEmpty(data.ErroCode) && string.IsNullOrEmpty(data.ErroDiscription));
        }

        [TestMethod]
        [DataRow("2023-06-15", "BC-WCU", "ISD2", "M30997456")]
        public void TestGetESBDataNoResultProducerCode(string dt, string lob, string environment, string producerCode)
        {
            var dbContext = new ACERepository();
            var controller = new ExternalServiceController(dbContext);
            SourceSystemInputRequest details = new SourceSystemInputRequest
            {
                AccountNumber = string.Empty,
                AsOfDate = DateTime.Parse(dt),
                ClaimNumber = String.Empty,
                ProducerCode = producerCode,
                QuoteNumber = String.Empty,
                URL = String.Empty,
                LOB = lob,
                PolicyNumber = String.Empty,
                Environment = environment,
            };

            var data = controller.GetESBData(details);
            Assert.IsTrue(!(string.IsNullOrEmpty(data.ErroCode) && string.IsNullOrEmpty(data.ErroDiscription)));
        }

        [TestMethod]
        [DataRow("2022-09-25","2024-06-05", "BC-WCU", "ISD2", "M731497", true, true)]
        [DataRow("2020-09-25", "2023-12-25", "BC-WCU", "ISD2", "M829986", true, false)]
        [DataRow("2022-01-15", "2023-01-15", "BC-WCU", "ISD2", "M829986", false, true)]
        [DataRow("2021-01-05", "2024-01-05", "BC-WCU", "ISD2", "M731497", false, false)]
        [DataRow("2021-06-15", "2022-12-15", "BC-PA", "ISD1", "H404179558", true, false)]
        [DataRow("2022-06-25", "2023-12-15", "BC-PA", "ISD1", "H404179558", false, true)]
        [DataRow("2021-06-15", "2023-06-15", "BC-PA", "ISD1", "H404179558", true, true)]
        [DataRow("2023-01-15", "2023-12-15", "BC-PA", "ISD1", "H404179558", false, false)]
        public void TestGetESBDataManual(string startDate, string endDate, string lob, string environment, string policyNumber, bool isManual, bool isDatesUsed)
        {
            var dbContext = new ACERepository();
            var controller = new ExternalServiceController(dbContext);
            SourceSystemInputRequest details = new SourceSystemInputRequest
            {
                AccountNumber = string.Empty,
                StartDate = DateTime.Parse(startDate),
                EndDate = DateTime.Parse(endDate),
                ClaimNumber = string.Empty,
                ProducerCode = string.Empty,
                QuoteNumber = string.Empty,
                URL = string.Empty,
                LOB = lob,
                PolicyNumber = policyNumber,
                Environment = environment,
                IsItUseDates = isManual,
                IsManualInvoice = isDatesUsed,

            };

            var data = controller.GetESBData(details);
            Assert.IsTrue(string.IsNullOrEmpty(data.ErroCode) && string.IsNullOrEmpty(data.ErroDiscription));
        }


        [TestMethod]
        [DataRow("CL  Correspondence")]
        [DataRow("CL  Multiline Quote Cover Pages")]
        public void TestGetOnbaseId(string documentName)
        {
            var dbContext = new ACERepository();
            var controller = new ExternalServiceController(dbContext);

            var data = controller.GetOnbaseId(documentName);
            Assert.IsTrue(data.Result > 0);

        }

        [TestMethod]
        [DataRow("CL  Correspondence1")]
        [DataRow("CL Multiline Quote Cover Pages")]
        public void TestGetOnbaseIdNoResult(string documentName)
        {
            var dbContext = new ACERepository();
            var controller = new ExternalServiceController(dbContext);

            var data = controller.GetOnbaseId(documentName);
            Assert.IsTrue(data.Result == 0);
        }

        [TestMethod]
        [DataRow("1600243455")]
        public void TestPostInspireData(string documentName)
        {
            var dbContext = new ACERepository();
            var controller = new ExternalServiceController(dbContext);

            var xmlValue = File.ReadAllText("../../../Files/" + documentName + ".txt");
            var data = controller.PostInspireData(new AdhocCorrespondenceEditor.Shared.Common.InspireInputRequest
            {
                XMLRequest = xmlValue
            });
            while (!data.IsCompleted)
            {
            }
            var result = data.Result;
            Assert.IsTrue(!string.IsNullOrEmpty(result));
            Assert.IsTrue(!result.Contains("errorMessage"));
        }
    }
}