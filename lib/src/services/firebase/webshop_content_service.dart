part of firebase_service;

@Injectable()
class WebshopContentService extends FirebaseServiceBase<WebshopContent>
{
  WebshopContentService() : super("webshop_contents");

  @override
  WebshopContent createModelInstance(Map<String, dynamic> data) => new WebshopContent()..fromMap(data);
}