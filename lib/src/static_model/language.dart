import 'package:fo_components/fo_components.dart';

class Language implements FoModel
{
  Language(this.id, this.name, this.iso639_1);

  final String iso639_1;
  final String name;

  @override
  String toString() => name;

  @override
  operator []=(Object key, dynamic value) => throw new UnsupportedError("Operator []= is not supported on Language");

  @override
  dynamic operator [](Object key)
  {
    switch (key)
    {
      case "name": return name;
      case "iso639_1": return iso639_1;
      default: return null;
    }
  }

  @override
  DateTime created = new DateTime.now();

  @override String id;
  @override String added_by = "system";
  @override String status = "active";
  @override Map<dynamic, dynamic> toMap() => super.toMap()..addAll({"name":name, "iso639_1":iso639_1});
}