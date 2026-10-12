
import 'package:flutter/material.dart';

class VoucherPage extends StatelessWidget {
  const VoucherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Voucher'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Diskon 10%');
              },
              child: const Text('Diskon 10%'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Diskon 20%');
              },
              child: const Text('Diskon 20%'),
            ),
          ],
        ),
      ),
    );
  }
}
