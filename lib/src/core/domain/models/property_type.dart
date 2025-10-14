import 'dart:math';

enum PropertyType {
  beachHouse,
  apartment,
  villa,
  townhouse,
  penthouse,
  condo,
  studio,
  loft,
  cabin,
  farmHouse;

  static PropertyType random() {
    final values = PropertyType.values;
    final randomIndex = Random().nextInt(values.length);
    return values[randomIndex];
  }
}
