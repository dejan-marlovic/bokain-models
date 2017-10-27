import 'package:fo_components/fo_components.dart';

class Language extends FoModel
{
  Language(String id, String name, this.iso639_1) : super(id, name);

  final String iso639_1;
}