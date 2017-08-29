import 'dart:async';
import 'package:intl/intl.dart' show DateFormat;
import 'package:angular/angular.dart';
import 'package:bokain_models/bokain_models.dart';
import 'package:bokain_models/src/services/api.bokain.se/restful_service_base.dart';

@Injectable()
class BillogramService extends RestfulServiceBase
{
  BillogramService() : super();

  Future generateNoShow(Booking b, Customer c, List<Service> services, List<ServiceAddon> sa) async
  {
    /// Create or find billogram customer
    BillogramContact contact = new BillogramContact(c.email, c.phone);
    BillogramAddress address = new BillogramAddress(c.street, c.city, c.postalCode, "SE", c.careOf);

    /// Convert social number from bokain format (YYYYMMDDXXXX => YYMMDD-XXXX)
    String socialNumber = (c.socialNumber == null) ? null : c.socialNumber.substring(2, 8) + "-" + c.socialNumber.substring(8);
    BillogramCustomer customer = new BillogramCustomer(socialNumber, "${c.firstname} ${c.lastname}", contact, address);

    customer.customerNo = await httpPOST("billogram/customer", customer.data);

    final DateFormat df = new DateFormat("yyyy-MM-dd 'kl 'HH:mm");

    List<BillogramItem> items = services.map((s) => new BillogramItem(s.name, "Missad tid: ${df.format(b.startTime)}", s.price)).toList(growable: false);
    BillogramBillogram billogram = new BillogramBillogram(customer, items);

    await httpPUT("billogram/billogram", billogram.data);
  }
}