import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisata_bengkalis/screens/add_destination_screen.dart';
import 'dashboard_screen.dart';
import 'searching_screen.dart';
import 'travel_list_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    DashboardScreen(),
    SearchingScreen(),
    TravelListScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // 🔥 INI KUNCI UTAMA

      backgroundColor: const Color(0xFFF1F5F9),

      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _screens[_selectedIndex],
      ),

      // FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddDestinationScreen()),
          );
        },
        backgroundColor: Colors.blueAccent,
        elevation: 6,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // NAVBAR
      bottomNavigationBar: BottomAppBar(
        color: Colors.white, // 🔥 WAJIB
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        elevation: 12,
        child: Container(
          height: 70.h,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Row(
            children: [
              _buildNavItem(Icons.home, "Home", 0),
              _buildNavItem(Icons.search, "Search", 1),

              SizedBox(width: 40.w), // 🔥 ruang FAB

              _buildNavItem(Icons.list_alt, "List", 2),
              _buildNavItem(Icons.person, "Profile", 3),
            ],
          ),
        ),
      ),
    );
  }

  // ================= NAV ITEM =================
  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isActive = _selectedIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() => _selectedIndex = index);
        },
        borderRadius: BorderRadius.circular(10.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 22.sp, // 🔥 kecilkan agar tidak overflow
              color: isActive ? Colors.blueAccent : Colors.grey,
            ),
            SizedBox(height: 2.h),
            Text(
              label,
              overflow: TextOverflow.ellipsis, // 🔥 anti overflow
              style: TextStyle(
                fontSize: 10.sp, // 🔥 kecilkan font
                color: isActive ? Colors.blueAccent : Colors.grey,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),

            // 🔥 indikator aktif
            if (isActive)
              Container(
                margin: EdgeInsets.only(top: 3.h),
                height: 3.h,
                width: 18.w,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
