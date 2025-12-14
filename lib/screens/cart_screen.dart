import 'package:flutter/material.dart';
import '../models/cart.dart';
import 'payment_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final items = Cart.instance.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: const Color(0xFFFF5A00),
      ),
      body: items.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(12),
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final it = items[index];
                      return Card(
                        child: ListTile(
                          leading: it['image'] != null
                              ? Image.network(
                                  it['image'],
                                  width: 56,
                                  height: 56,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) =>
                                      const Icon(Icons.broken_image),
                                )
                              : const Icon(Icons.fastfood),
                          title: Text(it['title'] ?? ''),
                          subtitle: Text(
                            'Qty: ${it['qty']}  •  \$${(it['price'] as double).toStringAsFixed(2)}',
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () {
                              setState(() {
                                Cart.instance.removeItem(it['title']);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Total: \$${Cart.instance.total.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () async {
                                final result = await Navigator.push<bool?>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => PaymentScreen(
                                      mode: PaymentMode.cod,
                                      total: Cart.instance.total,
                                    ),
                                  ),
                                );
                                if (result ?? false) {
                                  setState(() {});
                                }
                              },
                              child: const Text('Pay on Delivery'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFF5A00),
                              ),
                              onPressed: () async {
                                final result = await Navigator.push<bool?>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => PaymentScreen(
                                      mode: PaymentMode.card,
                                      total: Cart.instance.total,
                                    ),
                                  ),
                                );
                                if (result ?? false) {
                                  setState(() {});
                                }
                              },
                              child: const Text('Pay Now'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
