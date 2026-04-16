import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/animated_fade_slide.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      body: SafeArea(
        child: SingleChildScrollView(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Halo, Azmiiii 👋",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white70,
                                ),
                              ),
                              Text(
                                "Mau Liburan Ke Mana?",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 24.r,
                            backgroundColor: Colors.white.withOpacity(0.2),
                            child: const Icon(Icons.notifications, color: Colors.white),
                          ),
                        ],
                      ),

                      SizedBox(height: 20.h),

                      // SEARCH
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.95),
                          borderRadius: BorderRadius.circular(15.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 12,
                            ),
                          ],
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: "Cari destinasi...",
                            border: InputBorder.none,
                            icon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25.h),

                    // ================= KATEGORI =================
                    FadeSlideAnimation(
                      delay: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildCategory(Icons.beach_access, "Pantai"),
                          _buildCategory(Icons.terrain, "Gunung"),
                          _buildCategory(Icons.restaurant, "Kuliner"),
                          _buildCategory(Icons.hotel, "Hotel"),
                        ],
                      ),
                    ),

                    SizedBox(height: 30.h),

                    // ================= POPULER =================
                    FadeSlideAnimation(
                      delay: 200,
                      child: _sectionHeader("Destinasi Populer"),
                    ),

                    SizedBox(height: 10.h),

                    SizedBox(
                      height: 250.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildCard(
                            "Pantai Selat Baru",
                            "Bantan, Bengkalis",
                            "4.9",
                            "assets/images/pantai_selat_baru.jpg",
                          ),
                          _buildCard(
                            "Pantai Beting Aceh",
                            "Rupat, Bengkalis",
                            "4.8",
                            "assets/images/pantai_beting_aceh.jpg",
                          ),
                          _buildCard(
                            "Pantai Lapin",
                            "Bengkalis",
                            "4.7",
                            "assets/images/pantai_lapin.jpeg",
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 25.h),

                    // ================= REKOMENDASI =================
                    FadeSlideAnimation(
                      delay: 300,
                      child: _sectionHeader("Rekomendasi"),
                    ),

                    SizedBox(height: 10.h),

                    _buildRecommendation(
                      "Wisata Mangrove",
                      "Rekomendasi terbaik untuk Anda",
                      "assets/images/pantai_lapin.jpeg",
                    ),

                    SizedBox(height: 100.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= HEADER =================
  Widget _sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        TextButton(onPressed: () {}, child: const Text("Lihat Semua")),
      ],
    );
  }

  // ================= CATEGORY =================
  Widget _buildCategory(IconData icon, String title) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3B82F6), Color(0xFF60A5FA)],
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white),
          ),
          SizedBox(height: 6.h),
          Text(title, style: TextStyle(fontSize: 12.sp)),
        ],
      ),
    );
  }

  // ================= CARD (SUDAH ADA GAMBAR) =================
  Widget _buildCard(
    String title,
    String location,
    String rating,
    String imagePath,
  ) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 190.w,
        margin: EdgeInsets.only(right: 15.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.4),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  padding: EdgeInsets.all(10.w),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                const Icon(Icons.location_on, size: 14, color: Colors.grey),
                SizedBox(width: 4.w),
                Text(location,
                    style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
              ],
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 14),
                SizedBox(width: 4.w),
                Text(rating),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ================= REKOMENDASI =================
  Widget _buildRecommendation(
      String title, String subtitle, String imagePath) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFE2E8F0),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset(
              imagePath,
              width: 70.w,
              height: 70.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14.sp)),
                Text(subtitle,
                    style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}