
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'main_page.dart';
import 'detail_gadget_page.dart';
import 'voucher_page.dart';
import 'profile_page.dart';

void main() {
  runApp(const TechExpressApp());
}

class TechExpressApp extends StatelessWidget {
  const TechExpressApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tech Express',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/main': (context) => const MainPage(),
        '/voucher': (context) => const VoucherPage(),
        '/profile': (context) => const ProfilePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final data = settings.arguments as Map<String, dynamic>;

          return MaterialPageRoute(
            builder: (context) => DetailGadgetPage(
              nama: data['nama'] as String,
              harga: data['harga'] as int,
            ),
          );
        }

        return null;
      },
    );
  }
}
