part of firebase_service;

@Injectable()
class WebshopContentService extends FirebaseServiceBase<WebshopContent>
{
  WebshopContentService() : super("webshop_contents");

  @override
  WebshopContent createModelInstance(String id, Map<String, dynamic> data) => data == null ? new WebshopContent(id) : new WebshopContent.decode(id, data);
}