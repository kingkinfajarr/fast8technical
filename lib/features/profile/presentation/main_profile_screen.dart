import 'dart:io';

import 'package:fast8technical/cores/constants/app_color.dart';
import 'package:fast8technical/features/profile/presentation/personal_information_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/personal_info/personal_info_bloc.dart';

class MainProfileScreen extends StatelessWidget {
  const MainProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clrLightGray,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue[200],
                child: const Text(
                  'K',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Kingkin Fajar Anifianto',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Masuk dengan Google',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 30),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PersonalInfoScreen()),
                );
              },
              child: _buildListTile(Icons.person, 'Informasi Pribadi')),
          _buildListTile(Icons.description, 'Syarat & Ketentuan'),
          _buildListTile(Icons.help, 'Bantuan'),
          _buildListTile(Icons.privacy_tip, 'Kebijakan Privasi'),
          GestureDetector(
            onTap: () {
              context.read<PersonalInfoBloc>().add(
                    ClearPersonalInfoEvent(),
                  );

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  content: const Text("Data berhasil dihapus"),
                  duration: const Duration(seconds: 1),
                  backgroundColor: clrGreen,
                ),
              );
            },
            child: _buildListTile(Icons.logout, 'Log Out'),
          ),
          _buildListTile(Icons.delete, 'Hapus Akun'),
        ],
      ),
      bottomNavigationBar: Padding(
        padding:
            Platform.isIOS ? const EdgeInsets.all(19) : const EdgeInsets.all(5),
        child: Text(
          'payuung\nVersi 1.13.0',
          textAlign: TextAlign.center,
          style: TextStyle(color: clrGray.withOpacity(0.5)),
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: clrWhite,
        boxShadow: [
          BoxShadow(
            color: clrBlack.withOpacity(0.1),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: clrGray.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: clrGray.withOpacity(0.4)),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 16, color: clrBlack),
        ),
      ),
    );
  }
}
