part of model_service;

@Injectable()
class CustomerService extends FirebaseServiceBase
{
  CustomerService() : super("customers");

  @override
  Customer createModelInstance(String id, Map<String, dynamic> data) => new Customer.decode(id, data);

  Future patchBookings(Customer customer) async
  {
    _loading = true;
    await _db.ref(_name).child(customer.id).child("booking_ids").set(customer.bookingIds);
    _loading = false;
  }

  Future patchJournalEntries(Customer customer) async
  {
    _loading = true;
    await _db.ref(_name).child(customer.id).child("journal_entry_ids").set(customer.journalEntryIds);
    _loading = false;
  }

  Future<Map<String, String>> fetchDetails(String social_number) async
  {
    _loading = true;

    try
    {
      String response = await dom.HttpRequest.getString("https://api.bokain.se/index.php/ssn/$social_number");
      return JSON.decode(response);
    }
    finally
    {
      _loading = false;
    }
  }
}