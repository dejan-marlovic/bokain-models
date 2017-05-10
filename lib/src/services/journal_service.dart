part of model_service;

@Injectable()
class JournalService extends ModelService
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
  Future _onChildAdded(firebase.QueryEvent e) async
  {
    await super._onChildAdded(e);

    JournalEntry journalEntry = _models[e.snapshot.key];

    Customer customer = _customerService.getModel(journalEntry.customerId);
    if (customer != null && !customer.journalEntryIds.contains(journalEntry.id))
    {
      customer.journalEntryIds.add(journalEntry.id);
      await _customerService.patchJournalEntries(customer);
    }
  }

  @override
  Future _onChildRemoved(firebase.QueryEvent e) async
  {
    JournalEntry journalEntry = _models[e.snapshot.key];

    Customer customer = _customerService.getModel(journalEntry.customerId);
    if (customer != null && customer.journalEntryIds.contains(journalEntry.id))
    {
      customer.journalEntryIds.remove(journalEntry.id);
      await _customerService.patchJournalEntries(customer);
    }

    await super._onChildRemoved(e);
  }

  final firebase.StorageReference _imagesRef = firebase.storage().ref("journal-images");
  final CustomerService _customerService;
}