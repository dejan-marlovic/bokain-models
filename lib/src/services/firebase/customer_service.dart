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
  Customer createModelInstance(Map<String, dynamic> data)
  {
    Customer customer = new Customer();
    if (data != null) customer.addAll(data);
    return customer;
  }

  Future patchBookings(Customer customer) async
  {
    _loading = true;
    await _db.ref(_name).child(customer.id).child("booking_ids").set(customer.booking_ids);
    _loading = false;
  }

  Future patchJournalEntries(Customer customer) async
  {
    _loading = true;
    await _db.ref(_name).child(customer.id).child("journal_entry_ids").set(customer.journal_entry_ids);
    _loading = false;
  }

  // TEMP
  Future removeDuplicates() async
  {
    List<String> removeIds = new List();

    for (Customer customer in cachedModels.values)
    {
      List<Customer> matches = new List.from(cachedModels.values.where((c) => c.email == customer.email));
      if (matches.length > 1)
      {
        for (int i = 1; i < matches.length; i++)
        {
          if (!removeIds.contains(matches[i].id)) removeIds.add(matches[i].id);
        }
      }
    }

    for (String id in removeIds)
    {
      await remove(id);
      print("REMOVED customer ${id}");
    }
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