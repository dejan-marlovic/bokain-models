part of firebase_service;

@Injectable()
class JournalService extends FirebaseServiceBase
{
  JournalService(this._customerService) : super("journal");

  @override
  JournalEntry createModelInstance(String id, Map<String, dynamic> data) => new JournalEntry.decode(id, data);

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

  /*
  @override
  void _onChildAdded(firebase.QueryEvent e)
  {
    super._onChildAdded(e);

    JournalEntry journalEntry = _models[e.snapshot.key];

    Customer customer = _customerService.get(journalEntry.customerId);
    if (customer != null && !customer.journalEntryIds.contains(journalEntry.id))
    {
      customer.journalEntryIds.add(journalEntry.id);
      //await _customerService.patchJournalEntries(customer);
    }
  }
*/
  /*
  @override
  Future _onChildRemoved(firebase.QueryEvent e) async
  {
    JournalEntry journalEntry = _models[e.snapshot.key];

    Customer customer = _customerService.get(journalEntry.customerId);
    if (customer != null && customer.journalEntryIds.contains(journalEntry.id))
    {
      customer.journalEntryIds.remove(journalEntry.id);
      //await _customerService.patchJournalEntries(customer);
    }
    super._onChildRemoved(e);
  }
*/
  final firebase.StorageReference _imagesRef = firebase.storage().ref("journal-images");
  final CustomerService _customerService;
}