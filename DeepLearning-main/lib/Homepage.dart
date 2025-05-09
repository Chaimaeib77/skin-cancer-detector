// page2.dart

import 'package:flutter/material.dart';
import 'uv_index_page.dart';
import 'archive_page.dart';
import 'e_doctor_page.dart';
import 'scan_camera_page.dart'; 
import 'Description_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DescriptionPage(),
    const UVIndexPage(),
    const ArchivePage(),
    const EDoctorPage(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      // ScanCameraPage au lieu de ScanPage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ScanCameraPage(),
        ),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skin Cancer Detection'),
        backgroundColor: const Color(0xFF0D47A1),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: 'UV Index',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
            label: 'Scan',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: 'Archive',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'E-Doctor',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFF0D47A1),
      ),
    );
  }
}
