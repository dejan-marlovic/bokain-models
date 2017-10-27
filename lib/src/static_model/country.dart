import 'package:fo_components/fo_components.dart';

class Country extends FoModel
{
  Country(String id, String name, this.iso_alpha2) : super(id, name);

  final String iso_alpha2;
}