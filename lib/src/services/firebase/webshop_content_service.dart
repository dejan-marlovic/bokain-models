part of firebase_service;

@Injectable()
class WebshopContentService extends FirebaseServiceBase<WebshopContent>
{
  WebshopContentService() : super("webshop_contents");

  @override
  WebshopContent createModelInstance(Map<String, dynamic> data)
  {
    WebshopContent model = new WebshopContent();
    if (data != null) model.addAll(data);
    return model;
  }
}