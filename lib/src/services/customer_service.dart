part of model_service;

@Injectable()
class CustomerService extends ModelService
{
  CustomerService() : super("customers");

  @override
  Customer createModelInstance(String id, Map<String, dynamic> data)
  {
    return new Customer.decode(id, data);
  }

  Future patchBookings(Customer customer) async
  {
    _loading = true;
    await _ref.child(customer.id).child("booking_ids").set(customer.bookingIds);
    _loading = false;
  }

  Future patchJournalEntries(Customer customer) async
  {
    _loading = true;
    await _ref.child(customer.id).child("journal_entry_ids").set(customer.journalEntryIds);
    _loading = false;
  }

  Future<Map<String, String>> fetchDetails(String social_number) async
  {
    _loading = true;
    String response = await dom.HttpRequest.getString("https://api.bokain.se/restful.php/ssn/$social_number", withCredentials: false);
    _loading = false;
    return JSON.decode(response);
  }
}