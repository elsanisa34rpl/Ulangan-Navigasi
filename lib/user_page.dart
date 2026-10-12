
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 20),

        // Foto profil pengguna
        const Center(
          child: CircleAvatar(
            radius: 55,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.person,
              size: 70,
              color: Colors.white,
            ),
          ),
        ),

        const SizedBox(height: 15),

        const Center(
          child: Text(
            'Elsa Ghina Khoirun Nisa',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const Center(
          child: Text(
            'Pengguna Tech Express',
            style: TextStyle(color: Colors.grey),
          ),
        ),

        const SizedBox(height: 25),

        const Text(
          'Informasi Pengguna',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        // Kartu informasi pengguna
        infoCard(
          Icons.badge,
          'Kode Member',
          'TE001',
        ),

        infoCard(
          Icons.person_outline,
          'Nama Lengkap',
          'Elsa Ghina Khoirun Nisa',
        ),

        infoCard(
          Icons.school,
          'Sekolah',
          'SMK Telkom Malang',
        ),

        infoCard(
          Icons.code,
          'Jurusan',
          'Rekayasa Perangkat Lunak',
        ),

        infoCard(
          Icons.phone_android,
          'Keahlian',
          'Mobile Programming',
        ),
      ],
    );
  }

  static Widget infoCard(
    IconData icon,
    String judul,
    String isi,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.blue,
          size: 30,
        ),
        title: Text(
          judul,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
        subtitle: Text(
          isi,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
