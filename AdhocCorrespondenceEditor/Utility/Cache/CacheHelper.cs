using Microsoft.Extensions.Caching.Memory;

namespace AdhocCorrespondenceEditor.Utility.Cache
{
    public class CacheHelper : ICacheHelper
    {
        private IMemoryCache _cache;
        private MemoryCacheEntryOptions _cacheEntryOptions;

        public CacheHelper()
        {
            _cache = new MemoryCache(
                  new MemoryCacheOptions
                  {
                  });

            _cacheEntryOptions = new MemoryCacheEntryOptions()
                .SetSlidingExpiration(TimeSpan.FromDays(7));
            
        }

        public bool TryGetItem<T>(string key, out T item)
        {
            bool found;
            item = default(T);
            found = _cache.TryGetValue<T>(key, out item);
            return found;
        }

        public void Put(string key, object item)
        {
            _cache.Set(key, item, _cacheEntryOptions);
        }

        public T Get<T>(string key,  T item)
        {
            bool found =  this.TryGetItem<T>(key, out item);
            return found ? item : default(T);
        }

        public bool DeleteItem(string key)
        {
            bool cacheCleared = false;
            try
            {
                object value = new object();
                if (TryGetItem(key, out value))
                {
                    _cache.Remove(key);
                    cacheCleared = true;
                }
            }
            catch (Exception ex)
            {
            }
            return cacheCleared;
        } 
    }
}
