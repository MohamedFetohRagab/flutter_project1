import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/cart.dart';

enum PaymentMode { card, cod }

class CardNumberInputFormatter extends TextInputFormatter {
  // Groups digits in blocks of 4: "1234 5678 9012 3456"
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');
    final buffer = StringBuffer();
    for (var i = 0; i < digitsOnly.length; i++) {
      if (i != 0 && i % 4 == 0) buffer.write(' ');
      buffer.write(digitsOnly[i]);
    }
    final selectionIndex = buffer.length;
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

String? detectCardBrand(String digitsOnly) {
  if (digitsOnly.startsWith('4')) return 'VISA';
  if (digitsOnly.startsWith('5')) return 'MasterCard';
  return null;
}

class PaymentScreen extends StatefulWidget {
  final PaymentMode mode;
  final double total;

  const PaymentScreen({Key? key, required this.mode, required this.total})
    : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentMode? _method;
  final _addressController = TextEditingController();
  final _cardController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _method = widget.mode == PaymentMode.cod
        ? PaymentMode.cod
        : PaymentMode.card;
  }

  @override
  void dispose() {
    _addressController.dispose();
    _cardController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  Future<void> _completePayment() async {
    final address = _addressController.text.trim();
    if (address.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter delivery address')),
      );
      return;
    }

    if (_method == PaymentMode.card) {
      final card = _cardController.text.replaceAll(RegExp(r'\s+'), '');
      if (card.length < 12) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Enter a valid card number')),
        );
        return;
      }
      final cvv = _cvvController.text.trim();
      if (cvv.length < 3) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Enter a valid CVV')));
        return;
      }
    }

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pop();

    if (_method == PaymentMode.card) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment successful — order placed')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Order placed (Pay on Delivery)')),
      );
    }

    Cart.instance.clear();
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final digitsOnly = _cardController.text.replaceAll(RegExp(r'\D'), '');
    final brand = detectCardBrand(digitsOnly);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: const Color(0xFFFF5A00),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Total: \$${widget.total.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            if (widget.mode == PaymentMode.card) ...[
              const Text(
                'Choose Payment Method',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              RadioListTile<PaymentMode>(
                title: const Text('Visa / Mastercard'),
                value: PaymentMode.card,
                groupValue: _method,
                onChanged: (v) => setState(() => _method = v),
              ),
            ],

            const SizedBox(height: 8),

            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Delivery Address',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),

            const SizedBox(height: 12),

            if (_method == PaymentMode.card) ...[
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _cardController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CardNumberInputFormatter(),
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Card Number',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (brand != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        brand,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _cvvController,
                      decoration: const InputDecoration(
                        labelText: 'CVV2',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: Container()),
                ],
              ),
              const SizedBox(height: 12),
            ],

            const Spacer(),
            SizedBox(
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5A00),
                ),
                onPressed: _completePayment,
                child: Text(
                  widget.mode == PaymentMode.cod ? 'Confirm Order' : 'Pay Now',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
