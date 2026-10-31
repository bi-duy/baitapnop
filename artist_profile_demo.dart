import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProfileApp());
}

// ==============================================================================
// 1. CẤU HÌNH ỨNG DỤNG (THEME & FRAMEWORK)
// ==============================================================================
class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hồ Sơ Họa Sĩ - Figma Art Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        fontFamily: 'Roboto',
      ),
      builder: (context, child) {
        return PhoneMockupFrame(child: child ?? const SizedBox());
      },
      home: const ArtistProfileScreen(),
    );
  }
}

typedef ToeicExamApp = ProfileApp;

// ==============================================================================
// 2. KHUNG ĐIỆN THOẠI FIGMA MOCKUP (THIẾT KẾ CHUẨN FIGMA 390 × 1163)
// ==============================================================================
class PhoneMockupFrame extends StatefulWidget {
  final Widget child;
  const PhoneMockupFrame({super.key, required this.child});

  @override
  State<PhoneMockupFrame> createState() => _PhoneMockupFrameState();
}

class _PhoneMockupFrameState extends State<PhoneMockupFrame> {
  bool _enablePhoneFrame = true;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final screenW = media.size.width;

    // Hiển thị trực tiếp nếu chạy trên màn hình hẹp hoặc tắt khung
    if (screenW < 520 || !_enablePhoneFrame) {
      return widget.child;
    }

    const double phoneWidth = 390.0;
    const double phoneHeight = 844.0;

    return Material(
      color: const Color(0xFFE2E8F0),
      child: Stack(
        children: [
          // Nền Grid Canvas chấm bi của Figma
          Positioned.fill(
            child: CustomPaint(
              painter: _FigmaGridBackgroundPainter(),
            ),
          ),

          // Thanh công cụ trên cùng của Figma
          Positioned(
            top: 14,
            left: 20,
            right: 20,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 12,
              runSpacing: 8,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.palette_rounded, size: 16, color: Color(0xFF0F172A)),
                      SizedBox(width: 8),
                      Text(
                        'Figma Art Profile • 390 × 1163 (Hug)',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _enablePhoneFrame = !_enablePhoneFrame;
                    });
                  },
                  icon: Icon(
                    _enablePhoneFrame ? Icons.fullscreen_rounded : Icons.phone_android_rounded,
                    size: 16,
                  ),
                  label: Text(_enablePhoneFrame ? 'Toàn màn hình' : 'Khung điện thoại'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF0F172A),
                    elevation: 1,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ],
            ),
          ),

          // Khung điện thoại giữa màn hình đúng tỉ lệ 390px
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  width: phoneWidth,
                  height: phoneHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(52),
                    border: Border.all(
                      color: const Color(0xFFCBD5E1), // Viền bo bạc kim loại Figma 3px - 10px
                      width: 10,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.16),
                        blurRadius: 40,
                        spreadRadius: 4,
                        offset: const Offset(0, 16),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(42),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: MediaQuery(
                            data: media.copyWith(
                              size: const Size(phoneWidth, phoneHeight),
                              padding: const EdgeInsets.only(top: 40, bottom: 20),
                              viewPadding: const EdgeInsets.only(top: 40, bottom: 20),
                            ),
                            child: widget.child,
                          ),
                        ),

                        // Dynamic Island
                        Positioned(
                          top: 10,
                          left: 0,
                          right: 0,
                          child: IgnorePointer(
                            child: Center(
                              child: Container(
                                width: 105,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1E293B),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 12),
                                      width: 9,
                                      height: 9,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF334155),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Home Indicator
                        Positioned(
                          bottom: 6,
                          left: 0,
                          right: 0,
                          child: IgnorePointer(
                            child: Center(
                              child: Container(
                                width: 125,
                                height: 4.5,
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FigmaGridBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF94A3B8).withValues(alpha: 0.3)
      ..strokeWidth = 1;
    const step = 24.0;
    for (double x = 0; x < size.width; x += step) {
      for (double y = 0; y < size.height; y += step) {
        canvas.drawCircle(Offset(x, y), 0.8, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ==============================================================================
// 3. MÀN HÌNH HỒ SƠ HỌA SĨ / VẼ TRANH THEO KHUNG FIGMA
// Thông số Figma: Width: 390px | Padding: Top 44, R 24, B 36, L 24 | Gap: 24px
// ==============================================================================
class ArtistProfileScreen extends StatelessWidget {
  const ArtistProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          // Đúng chuẩn thông số Padding từ bảng thuộc tính Figma:
          // Top: 44px, Right: 24px, Bottom: 36px, Left: 24px
          padding: const EdgeInsets.only(
            top: 10,
            left: 24,
            right: 24,
            bottom: 36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 1. TOP BAR (Height: 42px)
              _buildTopBar(context),

              // Gap chuẩn Figma: 24px
              const SizedBox(height: 24),

              // 2. AVATAR NGHỆ SĨ & THÔNG TIN CHỦ ĐỀ VẼ TRANH (Height: ~241px)
              _buildArtistHeader(),

              const SizedBox(height: 24),

              // 3. STATS CARD: 200 Artworks | 5 Yrs Experience | 5.0 Rating (Height: ~78px)
              _buildStatsCard(),

              const SizedBox(height: 24),

              // 4. ABOUT ME - GIỚI THIỆU HỌA SĨ (Height: ~90px)
              _buildAboutMeSection(),

              const SizedBox(height: 24),

              // 5. SKILLS & EXPERTISE - KỸ NĂNG VẼ TRANH (Height: ~105px)
              _buildSkillsSection(),

              const SizedBox(height: 24),

              // 6. FEATURED ARTWORKS - BỘ SƯU TẬP TRANH NỔI BẬT (Height: ~185px)
              _buildFeaturedArtworksSection(),

              const SizedBox(height: 24),

              // 7. CONTACT INFORMATION - LIÊN HỆ ĐẶT TRANH (Height: ~192px)
              _buildContactSection(),
            ],
          ),
        ),
      ),
    );
  }

  // --- 1. Top Navigation Bar (336 Fill × 42) ---
  Widget _buildTopBar(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavButton(
            icon: Icons.chevron_left_rounded,
            onTap: () {},
          ),
          const Text(
            'Profile',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF0F172A),
              letterSpacing: -0.3,
            ),
          ),
          _buildNavButton(
            icon: Icons.share_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, size: 20, color: const Color(0xFF0F172A)),
      ),
    );
  }

  // --- 2. Artist Header: Avatar (doremon.jpg) + Name + Role + Location (336 Fill × 241 Hug) ---
  Widget _buildArtistHeader() {
    return Column(
      children: [
        // Avatar với viền tròn Gradient hoàng hôn & Tích xanh họa sĩ
        Center(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: 124,
                height: 124,
                padding: const EdgeInsets.all(3.5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFF7A59),
                      Color(0xFFFF5252),
                      Color(0xFFFFA07A),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(2.5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'images/doremon.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: const Color(0xFFE2E8F0),
                        child: const Icon(Icons.palette_rounded, size: 55, color: Color(0xFF94A3B8)),
                      ),
                    ),
                  ),
                ),
              ),

              // Huy hiệu xác minh màu xanh dương
              Positioned(
                bottom: 4,
                right: 4,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0284C7),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF0284C7).withValues(alpha: 0.35),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    size: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Tên Họa sĩ: Nguyễn Nhật Duy
        const Text(
          'Nguyễn Nhật Duy',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0F172A),
            letterSpacing: -0.4,
          ),
        ),

        const SizedBox(height: 5),

        // Chuyên môn: Lead Digital Artist & Painter
        const Text(
          'Lead Digital Artist & Painter',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF64748B),
          ),
        ),

        const SizedBox(height: 10),

        // Chỗ ở: TP. Hồ Chí Minh
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 14,
                color: Color(0xFF64748B),
              ),
              SizedBox(width: 5),
              Text(
                'TP. Hồ Chí Minh',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF475569),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // --- 3. Stats Card (336 Fill × 78): 200 Projects | 5 Yrs | 5.0 Rating ---
  Widget _buildStatsCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // 200 Dự án tranh vẽ
          _buildStatColumn('200', 'Artworks'),

          _buildStatDivider(),

          // 5 Năm kinh nghiệm hội họa
          _buildStatColumn('5 Yrs', 'Experience'),

          _buildStatDivider(),

          // Đánh giá 5.0 sao
          _buildRatingColumn('5.0', 'Rating'),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Color(0xFF0F172A),
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF94A3B8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingColumn(String value, String label) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFEAB308),
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.star_rounded,
                size: 20,
                color: Color(0xFFEAB308),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF94A3B8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatDivider() {
    return Container(
      height: 32,
      width: 1,
      color: const Color(0xFFE2E8F0),
    );
  }

  // --- 4. About Me Section - Chủ đề Hội họa & Vẽ Tranh (336 Fill × 90) ---
  Widget _buildAboutMeSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Me',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0F172A),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Họa sĩ Digital Art và tranh phong cảnh đương đại tại TP. Hồ Chí Minh. Đam mê thổi hồn vào từng nét vẽ với phong cách phối màu ánh sáng ấn tượng, từ tranh minh họa nhân vật đến tranh sơn dầu kỹ thuật số.',
          style: TextStyle(
            fontSize: 13.5,
            height: 1.55,
            color: Color(0xFF64748B),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  // --- 5. Skills & Expertise - Các phong cách & Kỹ thuật vẽ tranh (336 Fill × 105 Hug) ---
  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Skills & Expertise',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildSkillChip(
              icon: Icons.brush_rounded,
              label: 'Digital Art',
              bgColor: const Color(0xFFE0F2FE),
              textColor: const Color(0xFF0284C7),
            ),
            _buildSkillChip(
              icon: Icons.palette_outlined,
              label: 'Tranh Sơn Dầu',
              bgColor: const Color(0xFFDCFCE7),
              textColor: const Color(0xFF16A34A),
            ),
            _buildSkillChip(
              icon: Icons.landscape_outlined,
              label: 'Concept Art',
              bgColor: const Color(0xFFFFE4E6),
              textColor: const Color(0xFFE11D48),
            ),
            _buildSkillChip(
              icon: Icons.gesture_rounded,
              label: 'Sketch & Line',
              bgColor: const Color(0xFFF3E8FF),
              textColor: const Color(0xFF9333EA),
            ),
            _buildSkillChip(
              icon: Icons.wb_sunny_outlined,
              label: 'Phối Màu Ánh Sáng',
              bgColor: const Color(0xFFFEF3C7),
              textColor: const Color(0xFFD97706),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSkillChip({
    required IconData icon,
    required String label,
    required Color bgColor,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: textColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  // --- 6. Featured Projects / Tranh Vẽ Nổi Bật (336 Fill × 185) ---
  Widget _buildFeaturedArtworksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Featured Artworks',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildArtworkCard(
                title: 'Hoàng Hôn Sơn Cước',
                subtitle: 'Digital Painting • 2026',
                isSunsetPainting: true,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: _buildArtworkCard(
                title: 'Cực Quang Huyền Bí',
                subtitle: 'Concept Art • Oil Style',
                isSunsetPainting: false,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildArtworkCard({
    required String title,
    required String subtitle,
    required bool isSunsetPainting,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Khung tranh vẽ nghệ thuật (Canvas CustomPainter)
            SizedBox(
              height: 92,
              width: double.infinity,
              child: isSunsetPainting
                  ? CustomPaint(painter: _SunsetMountainLandscapePainter())
                  : CustomPaint(painter: _AuroraGalacticWavesPainter()),
            ),

            // Tiêu đề tác phẩm
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- 7. Contact Information - Thông Tin Liên Hệ & Đặt Tranh (336 Fill × 192) ---
  Widget _buildContactSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildContactTile(
            icon: Icons.art_track_rounded,
            title: 'Contact Information',
            isHeader: true,
          ),
          const Divider(height: 1, color: Color(0xFFF1F5F9)),
          _buildContactTile(
            icon: Icons.mail_outline_rounded,
            title: 'nhatduy.art@email.com',
          ),
          const Divider(height: 1, color: Color(0xFFF1F5F9)),
          _buildContactTile(
            icon: Icons.phone_outlined,
            title: '+84 (90) 1234-5678',
          ),
        ],
      ),
    );
  }

  Widget _buildContactTile({
    required IconData icon,
    required String title,
    bool isHeader = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isHeader ? const Color(0xFFF1F5F9) : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 18,
              color: isHeader ? const Color(0xFF0F172A) : const Color(0xFF64748B),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: isHeader ? FontWeight.w800 : FontWeight.w500,
                color: isHeader ? const Color(0xFF0F172A) : const Color(0xFF334155),
              ),
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            size: 18,
            color: Color(0xFF94A3B8),
          ),
        ],
      ),
    );
  }
}

// ==============================================================================
// 4. VẼ TRANH NGHỆ THUẬT (CUSTOM PAINTERS CHUYÊN ĐỀ VẼ TRANH)
// ==============================================================================

/// Bức tranh 1: Hoàng Hôn Sơn Cước (Sunset Mountain Landscape)
class _SunsetMountainLandscapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 1. Bầu trời hoàng hôn rực rỡ
    final skyPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFFF5252), Color(0xFFFF7A59), Color(0xFFFEB47B), Color(0xFFFFD166)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), skyPaint);

    // 2. Mặt trời lặn tỏa sáng vàng
    final sunPaint = Paint()..color = const Color(0xFFFFFBEB);
    canvas.drawCircle(Offset(size.width * 0.72, size.height * 0.38), 16, sunPaint);

    // 3. Dãy núi xa màu tím lam sương mờ
    final farMountainPaint = Paint()..color = const Color(0xFF814E69).withValues(alpha: 0.75);
    final farMountain = Path()
      ..moveTo(0, size.height * 0.6)
      ..lineTo(size.width * 0.3, size.height * 0.42)
      ..lineTo(size.width * 0.6, size.height * 0.58)
      ..lineTo(size.width * 0.85, size.height * 0.46)
      ..lineTo(size.width, size.height * 0.62)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(farMountain, farMountainPaint);

    // 4. Dãy núi gần màu đen tím bóng đổ
    final nearMountainPaint = Paint()..color = const Color(0xFF2D1B36);
    final nearMountain = Path()
      ..moveTo(0, size.height * 0.75)
      ..lineTo(size.width * 0.45, size.height * 0.55)
      ..lineTo(size.width * 0.75, size.height * 0.72)
      ..lineTo(size.width, size.height * 0.58)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(nearMountain, nearMountainPaint);

    // 5. Cánh chim bay trên bầu trời hoàng hôn
    final birdPaint = Paint()
      ..color = const Color(0xFF2D1B36)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;
    final bird1 = Path()
      ..moveTo(size.width * 0.28, size.height * 0.26)
      ..quadraticBezierTo(size.width * 0.31, size.height * 0.22, size.width * 0.34, size.height * 0.26)
      ..quadraticBezierTo(size.width * 0.37, size.height * 0.22, size.width * 0.40, size.height * 0.26);
    canvas.drawPath(bird1, birdPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Bức tranh 2: Cực Quang Huyền Bí (Aurora Galactic Waves)
class _AuroraGalacticWavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 1. Nền đêm vũ trụ sâu thẳm
    final spacePaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF0F172A), Color(0xFF1E1B4B), Color(0xFF2E1065)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), spacePaint);

    // 2. Dải cực quang màu ngọc bích (Neon Cyan Aurora)
    final auroraPaint1 = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF06B6D4), Color(0xFF10B981)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    final auroraPath1 = Path()
      ..moveTo(0, size.height * 0.3)
      ..quadraticBezierTo(size.width * 0.35, size.height * 0.65, size.width * 0.7, size.height * 0.35)
      ..quadraticBezierTo(size.width * 0.85, size.height * 0.2, size.width, size.height * 0.45)
      ..lineTo(size.width, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.6, size.height * 0.85, 0, size.height * 0.55)
      ..close();
    canvas.drawPath(auroraPath1, auroraPaint1);

    // 3. Dải cực quang tím hồng huyền ảo (Magenta Glow)
    final auroraPaint2 = Paint()
      ..shader = LinearGradient(
        colors: [
          const Color(0xFFD946EF).withValues(alpha: 0.85),
          const Color(0xFF8B5CF6).withValues(alpha: 0.65),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    final auroraPath2 = Path()
      ..moveTo(0, size.height * 0.5)
      ..quadraticBezierTo(size.width * 0.45, size.height * 0.15, size.width * 0.8, size.height * 0.5)
      ..quadraticBezierTo(size.width * 0.92, size.height * 0.65, size.width, size.height * 0.55)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(auroraPath2, auroraPaint2);

    // 4. Các vì sao lấp lánh trên bầu trời
    final starPaint = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(size.width * 0.15, size.height * 0.18), 1.2, starPaint);
    canvas.drawCircle(Offset(size.width * 0.42, size.height * 0.12), 1.6, starPaint);
    canvas.drawCircle(Offset(size.width * 0.78, size.height * 0.16), 1.0, starPaint);
    canvas.drawCircle(Offset(size.width * 0.9, size.height * 0.28), 1.4, starPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
