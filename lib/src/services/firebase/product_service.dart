part of firebase_service;

@Injectable()
class ProductService extends FirebaseServiceBase<Product>
{
  ProductService() : super("products");

  @override
  Product createModelInstance(Map<String, dynamic> data)
  {
    Product model = new Product();
    if (data != null) model.addAll(data);
    return model;
  }

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

  final firebase.StorageReference _imagesRef = firebase.storage().ref("product-images");
}