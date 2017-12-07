part of model_base;

class SimpleModel implements FoModel
{
  SimpleModel(this.id, this.label);

  @override
  dynamic operator[](Object key)
  {
    if (key == 'id') return id;
    else if (key == 'label') return label;
    else if (key == 'created') return created;
    else if (key == 'added_by') return added_by;
    else if (key == 'status') return status;
    else return null;
  }

  @override
  operator []=(Object key, dynamic value)
  {
    if (key == 'id') id = value;
    else if (key == 'label') label = value;
    else if (key == 'created') created = value;
    else if (key == 'added_by') added_by = value;
    else if (key == 'status') status = value;
  }

  @override
  Map<dynamic, dynamic> toMap() => super.toMap()..addAll({"label":label});

  @override
  String toString() => label;

  String label;

  /**
   * FoModel fields
   */
  @override String id;
  @override DateTime created = new DateTime.now();
  @override String status = "active";
  @override String added_by = "system";
}