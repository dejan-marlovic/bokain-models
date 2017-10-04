part of firebase_service;

@Injectable()
class ProductRoutineService extends FirebaseServiceBase
{
  ProductRoutineService() : super("product_routines"); /*1, [new UniqueField("products_article_nos", "article_no", true), new UniqueField("products_url_names", "url_name", true)]*/

  @override
  ProductRoutine createModelInstance(String id, Map<String, dynamic> data) => data == null ? new ProductRoutine(id) : new ProductRoutine.decode(id, data);
}