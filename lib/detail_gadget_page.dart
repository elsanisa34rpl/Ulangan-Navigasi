
import 'package:flutter/material.dart';

class DetailGadgetPage extends StatefulWidget {
  final String nama;
  final int harga;

  const DetailGadgetPage({
    super.key,
    required this.nama,
    required this.harga,
  });

  @override
  State<DetailGadgetPage> createState() =>
      _DetailGadgetPageState();
}

class _DetailGadgetPageState extends State<DetailGadgetPage> {
  String voucher = '-';

  String formatHarga(int harga) {
    String angka = harga.toString();
    String hasil = '';

    for (int i = 0; i < angka.length; i++) {
      hasil += angka[i];

      int sisa = angka.length - i - 1;

      if (sisa > 0 && sisa % 3 == 0) {
        hasil += '.';
      }
    }

    return 'Rp$hasil';
  }

  @override
  Widget build(BuildContext context) {
    bool sudahDiklaim = voucher != '-';

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Gadget - ${widget.nama}'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Icon produk
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.devices,
                size: 110,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 25),

            Text(
              widget.nama,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Harga: ${formatHarga(widget.harga)}',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            // Bingkai status voucher
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: sudahDiklaim
                    ? Colors.green.shade50
                    : Colors.orange.shade50,
                border: Border.all(
                  color: sudahDiklaim
                      ? Colors.green
                      : Colors.orange,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Icon(
                    sudahDiklaim
                        ? Icons.verified
                        : Icons.confirmation_num_outlined,
                    size: 35,
                    color: sudahDiklaim
                        ? Colors.green
                        : Colors.orange,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    sudahDiklaim
                        ? 'Voucher Sudah Diklaim'
                        : 'Voucher Belum Diklaim',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: sudahDiklaim
                          ? Colors.green.shade800
                          : Colors.orange.shade900,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Voucher: $voucher',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  final hasil = await Navigator.pushNamed(
                    context,
                    '/voucher',
                  );

                  if (!mounted) return;

                  if (hasil != null && hasil is String) {
                    setState(() {
                      voucher = hasil;
                    });
                  }
                },
                icon: const Icon(Icons.discount),
                label: const Text('Klaim Voucher Diskon'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
