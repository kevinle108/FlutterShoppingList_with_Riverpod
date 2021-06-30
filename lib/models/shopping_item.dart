class ShoppingItem {
  String name;
  int quantity;
  String note;
  int categoryId;
  int id = 0;

  ShoppingItem({required this.categoryId, required this.name, required this.quantity, required this.note, this.id = 0});

  void printItem() {
    print('Name: ${name}, Quantity: ${quantity}, Note: ${note}');
  }

}
