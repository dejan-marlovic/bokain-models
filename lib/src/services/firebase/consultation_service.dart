part of firebase_service;

@Injectable()
class ConsultationService extends FirebaseServiceBase<Consultation>
{
  ConsultationService() : super("consultations");

  @override
  Consultation createModelInstance(String id, Map<String, dynamic> data) => data == null ? new Consultation(id) : new Consultation.decode(id, data);

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

  final firebase.StorageReference _imagesRef = firebase.storage().ref("consultation-images");
}