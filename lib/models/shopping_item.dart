import 'dart:math';

class ShoppingItem {
  int id;
  int categoryId;
  String name;
  String quantity;
  String note;

  ShoppingItem({required this.categoryId, required this.name, required this.quantity, required this.note, required this.id});

  void printItem() {
    print('Name: ${name}, Quantity: ${quantity}, Note: ${note}, CatId: ${categoryId}, Id: ${id}');
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryId': categoryId,
      'name': name,
      'quantity': quantity,
      'note': note,
    };
  }

}
