import 'package:angular2/angular2.dart';
import 'package:vi_auth_client/vi_auth_client.dart';

@Injectable()
class CustomerAuthService extends ViAuthClient
{
  CustomerAuthService() : super("https://api.bokain.se/auth_customer/index.php/", "dahl_customers");
}