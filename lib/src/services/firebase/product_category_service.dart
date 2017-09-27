part of firebase_service;

@Injectable()
class ProductCategoryService extends FirebaseServiceBase
{
  ProductCategoryService() : super("product_categories"); /*1, [new UniqueField("products_article_nos", "article_no", true), new UniqueField("products_url_names", "url_name", true)]*/

  @override
  ProductCategory createModelInstance(String id, Map<String, dynamic> data) => data == null ? new ProductCategory(id) : new ProductCategory.decode(id, data);

  Future<String> uploadImage(String article_no, String base64) async
  {
    String url = null;
    try
    {
      _loading = true;
      List<String> parts = base64.split(";base64,");
      String contentType = parts.first.substring("data:".length);
      String data = parts.last;

      String filename = Uri.encodeFull(article_no);
      final firebase.UploadMetadata metadata = new firebase.UploadMetadata(contentType: contentType);
      await _imagesRef.child(filename).putString(data, "base64", metadata).future;
      url = (await _imagesRef.child(filename).getDownloadURL()).toString();
    }
    finally
    {
      _loading = false;
      return url;
    }
  }

  /*
  Future removeImage(String name) async
  {
    try
    {
      _loading = true;
      String filename = Uri.encodeFull(name);
      await _imagesRef.child(filename).delete();
    }
    finally { _loading = false; }
  }*/

  final firebase.StorageReference _imagesRef = firebase.storage().ref("product-category-images");
}