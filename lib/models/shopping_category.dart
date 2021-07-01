class ShoppingCategory {
  int id;
  String name;
  int priority;

  ShoppingCategory({required this.name, required this.priority, required this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': (id==0) ? null : id,
      'name': name,
      'priority': priority,
    };
  }

  void printCategory() {
    print('Category Item => id: $id, name: $name, priority: $priority}');
  }
}