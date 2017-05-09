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
}