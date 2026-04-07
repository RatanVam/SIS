namespace AdhocCorrespondenceEditor.Utility.Cache
{
    public interface ICacheHelper
    {
        public bool TryGetItem<T>(string key, out T item);

        public void Put(string key, object item);

        public T Get<T>(string key, T item);

        public bool DeleteItem(string key);
  
    }
}