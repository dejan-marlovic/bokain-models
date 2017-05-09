part of model_service;

@Injectable()
class JournalService extends ModelService
{
  @override
  JournalService(this._customerService) : super("journal")
  {
    _ref.onChildAdded.listen(_onChildAdded);
    _ref.onChildRemoved.listen(_onChildRemoved);
  }

  @override
  JournalEntry createModelInstance(String id, Map<String, dynamic> data)
  {
    return new JournalEntry.decode(id, data);
  }

  Future<String> uploadImage(String data_base64) async
  {
    String filename = new DateTime.now().millisecondsSinceEpoch.toString() + ".jpg";
    _loading = true;
    await _imagesRef.child(filename).putString(data_base64, "base64", new firebase.UploadMetadata(contentType: "image/jpeg"));
    _loading = false;
    return filename;
  }

  Future _onChildAdded(firebase.QueryEvent e) async
  {
    JournalEntry journalEntry = new JournalEntry.decode(e.snapshot.key, e.snapshot.val());

    Customer customer = _customerService.getModel(journalEntry.customerId);
    if (customer != null && !customer.journalEntryIds.contains(journalEntry.id))
    {
      customer.journalEntryIds.add(journalEntry.id);
      await _customerService.patchJournalEntries(customer);
    }
  }

  Future _onChildRemoved(firebase.QueryEvent e) async
  {
    JournalEntry journalEntry = new JournalEntry.decode(e.snapshot.key, e.snapshot.val());
    Customer customer = _customerService.getModel(journalEntry.customerId);
    if (customer != null && customer.journalEntryIds.contains(journalEntry.id))
    {
      customer.journalEntryIds.remove(journalEntry.id);
      await _customerService.patchJournalEntries(customer);
    }
  }

  final firebase.StorageReference _imagesRef = firebase.storage().ref("journal-images");

  final CustomerService _customerService;
}