import 'package:fo_components/fo_components.dart';

class SkinType extends FoModel
{
  SkinType(String id, String name, this.symptomsRegistry) : super(id, name)
  {
    if (symptomsRegistry == null) symptomsRegistry = new List();
  }

  List<Map<String, dynamic>> symptomsRegistry;
}