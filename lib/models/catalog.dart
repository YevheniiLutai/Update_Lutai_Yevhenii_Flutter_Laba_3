import 'package:flutter/material.dart';

class CatalogModel {
  static List<String> itemNames = [
    'Water',
    'Tomato',
    'Coca-Cola',
    'PS5',
    'Iphone',
    'Lays',
    'Spaghetti',
    'Fanta',
    'Pork',
    'Cheese',
    'Bread',
    'Soup',
    'Milk',
    'Beef',
    'Banana',
  ];

  /// Get item by [id].
  ///
  /// In this sample, the catalog is infinite, looping over [itemNames].
  Item getById(int id) => Item(id, itemNames[id % itemNames.length]);

  Item getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int price = 42;

  Item(this.id, this.name)
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
