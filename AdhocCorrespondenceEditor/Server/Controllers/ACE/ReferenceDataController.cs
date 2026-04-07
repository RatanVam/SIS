using AdhocCorrespondenceEditor.Repository;
using AdhocCorrespondenceEditor.Shared;
using AdhocCorrespondenceEditor.Utility.Cache;
using Microsoft.AspNetCore.Mvc;
using NJM.DotNetLibrary.Logging;

namespace AdhocCorrespondenceEditor.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReferenceDataController : ControllerBase
    {
        IACERepository _iACERepository;
        ICacheHelper _iCacheHelper;
        public ReferenceDataController(IACERepository dbContext, ICacheHelper cacheHelper)
        {
            _iACERepository = dbContext;
            _iCacheHelper = cacheHelper;
        }

        [HttpGet("lob")]
        public IEnumerable<LOBEntity> GetLOB()
        {
            IEnumerable<LOBEntity> items = null;
            if (!_iCacheHelper.TryGetItem(ApplicationConstants.SPGetLOB, out items))
                _iCacheHelper.Put(ApplicationConstants.SPGetLOB, _iACERepository.GetLOB());

            return _iCacheHelper.Get(ApplicationConstants.SPGetLOB, items);
        }
        [HttpPost("lob")]
        public IActionResult GetLOB([FromBody] string roleNames)
        {
            LogAsync.Information("GetLOB", $"roll Name = {roleNames}");

            List<LOBEntity> items = new List<LOBEntity>();
            var roles = string.IsNullOrEmpty(roleNames) ? new string[0] : roleNames.Split(',');
            var lob = GetLOB();
            foreach (var role in roles)
                items.AddRange(lob.Where(x => x!=null && x.LOBAdmingroups != null  && x.LOBAdmingroups.Contains(role)));
            return Ok(items?.DistinctBy(x => x?.LOBName));
        }

        [HttpGet("category")]
        public IEnumerable<CategoryEntity> GetCategory()
        {
            IEnumerable<CategoryEntity> items = null;
            if (!_iCacheHelper.TryGetItem(ApplicationConstants.SPGetCategoty, out items))
                _iCacheHelper.Put(ApplicationConstants.SPGetCategoty, _iACERepository.GetCategory());

            return _iCacheHelper.Get(ApplicationConstants.SPGetCategoty, items);
        }

        [HttpGet("category/{lobName}/{roleNames}")]
        public IActionResult GetCategory(string lobName, string roleNames)
        {
            LogAsync.Information("GetCategory", $"LOB = {lobName} and roll Name = {roleNames}"  );

            List<CategoryEntity> items = new List<CategoryEntity>();
            var roles = roleNames.Split(',');
            var category = GetCategory().Where(x => x.LOBName.ToUpper() == lobName.ToUpper());
            foreach (var role in roles)
                items.AddRange(category.Where(x => x.CategoryGroups.Contains(role)));
            return  Ok(items?.DistinctBy(x => x?.CategoryId));
        }
        [HttpPost("category/{lobName}")]
        public IActionResult GetCategoryFromBody( string lobName, [FromBody] string roleNames)
        {
            List<CategoryEntity> items = new List<CategoryEntity>();
            var roles = string.IsNullOrEmpty(roleNames) ?new string[0] : roleNames.Split(',');
            var category = GetCategory().Where(x => x.LOBName.ToUpper() == lobName.ToUpper());
            foreach (var role in roles)
                items.AddRange(category.Where(x => x.CategoryGroups.Contains(role)));

            LogAsync.Information("GetCategory", $"Categorys for LOB count : {category.Count()}. LOB = {lobName} and roll Name = {roleNames}");

            return items.Count == 0 ? NotFound() : Ok(items.DistinctBy(x => x.CategoryId));
        }

        [HttpGet("document")]
        public IEnumerable<DocumentEntity> GetDocument()
        {
            IEnumerable<DocumentEntity> items = null;
            if (!_iCacheHelper.TryGetItem(ApplicationConstants.SPGetDocument, out items))
                _iCacheHelper.Put(ApplicationConstants.SPGetDocument, _iACERepository.GetDocument());

            return _iCacheHelper.Get(ApplicationConstants.SPGetDocument, items);
        }

        [HttpGet("document/{categoryId}")]
        public IActionResult GetDocument(int categoryId)
        {
            IEnumerable<DocumentEntity> items = GetDocument();
            var document = items.Where(x => x.CategoryId == categoryId);
            if (document == null)
                document = new List<DocumentEntity>();
            return Ok(document);
        }
        [HttpGet("documentcontrol")]
        public IEnumerable<DocumentControlEntity> GetDocumentControl()
        {
            IEnumerable<DocumentControlEntity> items = null;
            if (!_iCacheHelper.TryGetItem(ApplicationConstants.SPGetDocumentControl, out items))
                _iCacheHelper.Put(ApplicationConstants.SPGetDocumentControl, _iACERepository.GetDocumentControl());

            return _iCacheHelper.Get(ApplicationConstants.SPGetDocumentControl, items);
        }
        [HttpGet("documentcontrol/{documentId}")]
        public IActionResult GetDocumentControl(int documentId)
        {
            IEnumerable<DocumentControlEntity> items = GetDocumentControl();
            var documentControl = items.Where(x => x.DocumentId == documentId);
            if (documentControl == null)
                documentControl = new List<DocumentControlEntity>();
            return Ok(documentControl);
        }


    }
}

