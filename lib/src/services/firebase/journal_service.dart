part of model_service;

@Injectable()
class JournalService extends FirebaseServiceBase
{
  JournalService(this._customerService) : super("journal");

  @override
  JournalEntry createModelInstance(String id, Map<String, dynamic> data)
  {
    return new JournalEntry.decode(id, data);
  }

  Future<String> uploadImage(String data_base64) async
  {
    String filename = new DateTime.now().millisecondsSinceEpoch.toString() + ".jpg";
    _loading = true;
    await _imagesRef.child(filename).putString(data_base64, "base64", new firebase.UploadMetadata(contentType: "image/jpeg")).future;
    String url = (await _imagesRef.child(filename).getDownloadURL()).toString();

    _loading = false;
    return url;
  }

  @override
  Future<String> push(JournalEntry model) async
  {
    String id = await super.push(model);
    _loading = true;

    

    _loading = false;
    return id;
  }

  @override
  void _onChildAdded(firebase.QueryEvent e)
  {
    super._onChildAdded(e);

    JournalEntry journalEntry = _models[e.snapshot.key];

    Customer customer = _customerService.getModel(journalEntry.customerId);
    if (customer != null && !customer.journalEntryIds.contains(journalEntry.id))
    {
      customer.journalEntryIds.add(journalEntry.id);
      //await _customerService.patchJournalEntries(customer);
    }
  }

  @override
  void _onChildRemoved(firebase.QueryEvent e)
  {
    JournalEntry journalEntry = _models[e.snapshot.key];

    Customer customer = _customerService.getModel(journalEntry.customerId);
    if (customer != null && customer.journalEntryIds.contains(journalEntry.id))
    {
      customer.journalEntryIds.remove(journalEntry.id);
      //await _customerService.patchJournalEntries(customer);
    }
    super._onChildRemoved(e);
  }

  final firebase.StorageReference _imagesRef = firebase.storage().ref("journal-images");
  final CustomerService _customerService;
}