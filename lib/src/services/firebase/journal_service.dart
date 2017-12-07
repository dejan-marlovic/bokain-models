part of firebase_service;

@Injectable()
class JournalService extends FirebaseServiceBase<JournalEntry>
{
  JournalService() : super("journal");

  @override
  JournalEntry createModelInstance(Map<String, dynamic> data)
  {
    JournalEntry model = new JournalEntry();
    if (data != null) model.addAll(data);
    return model;
  }

  Future<String> uploadImage(String base64) async
  {
    String url = null;
    try
    {
      _loading = true;
      List<String> parts = base64.split(";base64,");
      String contentType = parts.first.substring("data:".length);
      String data = parts.last;

      String filename = Uri.encodeFull(new DateTime.now().millisecondsSinceEpoch.toString());
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

  final firebase.StorageReference _imagesRef = firebase.storage().ref("journal-images");
}