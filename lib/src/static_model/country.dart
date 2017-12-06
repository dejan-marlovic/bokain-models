import 'package:fo_components/fo_components.dart';

class Country implements FoModel
{
  Country(this.id, this.name, this.iso_alpha2);

  final String name;
  final String iso_alpha2;

  @override
  String toString() => name;

  @override
  Map<dynamic, dynamic> toMap() => super.toMap();

  @override
  operator []=(Object key, dynamic value) => throw new UnsupportedError("Operator []= is not supported on Country");

  @override
  dynamic operator [](Object key) => throw new UnsupportedError("Operator [] is not supported on Country");

  @override
  String status = "active";
  @override
  DateTime created = new DateTime.now();
  @override
  String id;
  @override
  String added_by = "system";
}