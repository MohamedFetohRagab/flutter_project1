class Cart {
  Cart._();
  static final Cart instance = Cart._();

  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => List.unmodifiable(_items);

  void addItem(Map<String, String> item) {
    final idx = _items.indexWhere((e) => e['title'] == item['title']);
    if (idx >= 0) {
      _items[idx]['qty'] = (_items[idx]['qty'] as int) + 1;
    } else {
      _items.add({
        'title': item['title'],
        'description': item['description'],
        'image': item['image'],
        'price': double.tryParse(item['price'] ?? '0') ?? 0.0,
        'qty': 1,
      });
    }
  }

  void removeItem(String title) {
    _items.removeWhere((e) => e['title'] == title);
  }

  void clear() {
    _items.clear();
  }

  double get total => _items.fold(
    0.0,
    (p, e) => p + (e['price'] as double) * (e['qty'] as int),
  );
}
