part of firebase_service;

@Injectable()
class ConsultationService extends FirebaseServiceBase<Consultation>
{
  ConsultationService() : super("consultations");

  @override
  Consultation createModelInstance(Map<String, dynamic> data) => new Consultation()..fromMap(data);

  Future<String> uploadImage(String name, String base64) async
  {
    String url = null;
    try
    {
      _loading = true;
      List<String> parts = base64.split(";base64,");
      String contentType = parts.first.substring("data:".length);
      String data = parts.last;

      String filename = Uri.encodeFull(name);
      final firebase.UploadMetadata metadata = new firebase.UploadMetadata(contentType: contentType);
      firebase.UploadTaskSnapshot snapshot = await _imagesRef.child(filename).putString(data, "base64", metadata).future;
      url = snapshot.downloadURL.toString();
    }
    finally
    {
      _loading = false;
      return url;
    }
  }

  @override
  Map<String, dynamic> _serialize(Consultation model)
  {
    Map<String, dynamic> data = super._serialize(model);
    data["symptoms"] = model.symptoms?.encoded;
    data["proudct_routines"] = model.product_routines.map((pair) => pair.encoded).toList(growable: false);
    return data;
  }

  @override
  Consultation _deserialize(Map<String, dynamic> data)
  {
    try
    {
      data["symptoms"] = new SymptomMap.decode(data["symptoms"]);
      data["product_routines"] = (data["product_routines"] as List<Map<String, String>>).map((row) => new ProductRoutinePair.decode(row));
      return super._deserialize(data);
    }
    catch (e, s)
    {
      print(e);
      print(s);
      return null;
    }
  }

  final firebase.StorageReference _imagesRef = firebase.storage().ref("consultation-images");
}