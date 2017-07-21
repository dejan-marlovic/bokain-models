import 'dart:async';
import 'package:intl/intl.dart' show DateFormat;
import 'package:angular2/angular2.dart';
import 'package:http/http.dart' as http;
import 'package:http/browser_client.dart';
import 'package:bokain_models/bokain_models.dart';

@Injectable()
class BillogramService
{
  BillogramService();

  Future generateNoShow(Booking b, Customer c, List<Service> services, List<ServiceAddon> sa) async
  {
    /// Create or find billogram customer
    BillogramContact contact = new BillogramContact(c.email, c.phone);
    BillogramAddress address = new BillogramAddress(c.street, c.city, c.postalCode, "SE", c.careOf);

    /// Convert social number from bokain format (YYYYMMDDXXXX => YYMMDD-XXXX)
    String socialNumber = (c.socialNumber == null) ? null : c.socialNumber.substring(2, 8) + "-" + c.socialNumber.substring(8);
    BillogramCustomer customer = new BillogramCustomer(socialNumber, "${c.firstname} ${c.lastname}", contact, address);

    http.Response response = await _client.post(apiBase + "/customer", body: customer.toJSON());
    customer.customerNo = int.parse(response.body);

    final DateFormat df = new DateFormat("yyyy-MM-dd 'kl 'HH:mm");

    List<BillogramItem> items = services.map((s) => new BillogramItem(s.name, "Missad tid: ${df.format(b.startTime)}", s.price)).toList(growable: false);
    BillogramBillogram billogram = new BillogramBillogram(customer, items);

    response = await _client.put(apiBase + "/billogram", body: billogram.toJSON());
  }

  final String apiBase = "https://api.bokain.se/index.php/billogram";

  final BrowserClient _client = new BrowserClient();
}