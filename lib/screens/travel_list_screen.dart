import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/travel_destination.dart';
import '../widgets/animated_fade_slide.dart';
import 'travel_detail_screen.dart';

class TravelListScreen extends StatelessWidget {
  const TravelListScreen({super.key});

  static List<TravelDestination> destinations = [
    TravelDestination(
      id: 1,
      name: 'Pantai Selat Baru',
      location: 'Bantan, Bengkalis, Riau',
      description: 'Pantai indah dengan pasir kuning dan view Selat Malaka.',
      price: 5000,
      imagePath: 'assets/images/pantai_selat_baru.jpg',
      rating: 4.5,
    ),
    TravelDestination(
      id: 2,
      name: 'Pantai Beting Aceh',
      location: 'Rupat, Bengkalis, Riau',
      description: 'Pulau kecil dengan pasir putih dan laut biru.',
      price: 10000,
      imagePath: 'assets/images/pantai_beting_aceh.jpg',
      rating: 4.5,
    ),
    TravelDestination(
      id: 3,
      name: 'Pantai Lapin',
      location: 'Rupat, Bengkalis, Riau',
      description: 'Pantai dengan sunset terbaik di Bengkalis.',
      price: 8000,
      imagePath: 'assets/images/pantai_lapin.jpeg',
      rating: 4.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      body: SafeArea(
        child: Column(
          children: [
            // ================= HEADER =================
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 30.h),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF3B82F6),
                    Color(0xFF06B6D4),
                  ],
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30.r),
                ),
              ),
              child: FadeSlideAnimation(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jelajahi Wisata 🌍",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "Temukan keindahan terbaik untukmu",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white70,
                      ),
                    ),

                    SizedBox(height: 20.h),

                    // SEARCH MINI
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "Cari wisata...",
                          border: InputBorder.none,
                          icon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ================= LIST =================
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                children: [
                  SizedBox(height: 25.h),

                  FadeSlideAnimation(
                    delay: 100,
                    child: _sectionHeader(),
                  ),

                  SizedBox(height: 15.h),

                  ...destinations.asMap().entries.map((entry) {
                    int index = entry.key;
                    var destination = entry.value;

                    return FadeSlideAnimation(
                      delay: 150 + (index * 100),
                      child: _buildModernCard(context, destination),
                    );
                  }),

                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= HEADER LIST =================
  Widget _sectionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Destinasi Populer",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text("Lihat Semua"),
        ),
      ],
    );
  }

  // ================= CARD MODERN =================
  Widget _buildModernCard(
      BuildContext context, TravelDestination destination) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              TravelDetailScreen(destination: destination),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 15.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Stack(
            children: [
              // IMAGE
              Image.asset(
                destination.imagePath,
                height: 200.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              // OVERLAY
              Container(
                height: 200.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.6),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),

              // CONTENT
              Positioned(
                bottom: 15,
                left: 15,
                right: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            size: 14, color: Colors.white70),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            destination.location,
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // RATING
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.amber, size: 14),
                            SizedBox(width: 4.w),
                            Text(
                              destination.rating.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),

                        // PRICE
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            "Rp ${destination.price}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}