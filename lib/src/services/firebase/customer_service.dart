part of firebase_service;

@Injectable()
class CustomerService extends FirebaseServiceBase<Customer>
{
  CustomerService() : super("customers",
    [
      new UniqueField("customers_phones", "phone", true),
      new UniqueField("customers_emails", "email", true),
      new UniqueField("customers_social_numbers", "social_number", false)
    ]);

  @override
  Customer createModelInstance(String id, Map<String, dynamic> data) => data == null ? new Customer(id) : new Customer.decode(id, data);

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