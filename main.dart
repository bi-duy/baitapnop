import 'package:flutter/material.dart';

void main() {
  runApp(const ArtProfileApp());
}

class ArtProfileApp extends StatelessWidget {
  const ArtProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Art Profile UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:
            const Color(0xFFE2E8F0), // Nền xám nhạt để tôn khung điện thoại
        fontFamily: 'Roboto',
      ),
      home: const ArtProfileScreen(),
    );
  }
}

class ArtProfileScreen extends StatelessWidget {
  const ArtProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Container(
            // Kích thước chuẩn khung Figma: Width 390px, bo góc 44px, viền 3px #CBD5E1
            width: 390,
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(44),
              border: Border.all(
                color: const Color(0xFFCBD5E1),
                width: 3,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.08),
                  blurRadius: 30,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(24, 44, 24, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. TOP BAR: Nút Back, Tiêu đề "Profile", Nút Share
                _buildTopBar(),

                const SizedBox(height: 24),

                // 2. PROFILE HEADER (Chủ đề Vẽ hình / Digital Artist)
                _buildProfileHeader(),

                const SizedBox(height: 24),

                // 3. STATS CARD (Thống kê: Artworks, Kinh nghiệm, Đánh giá)
                _buildStatsCard(),

                const SizedBox(height: 24),

                // 4. ABOUT ME
                _buildAboutSection(),

                const SizedBox(height: 24),

                // 5. SKILLS & EXPERTISE (Kỹ năng vẽ hình, đồ họa)
                _buildSkillsSection(),

                const SizedBox(height: 24),

                // 6. FEATURED PROJECTS (Tác phẩm vẽ nổi bật)
                _buildFeaturedProjectsSection(),

                const SizedBox(height: 24),

                // 7. CONTACT INFORMATION
                _buildContactSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 1. Top Bar
  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCircleButton(
          icon: Icons.chevron_left,
          onTap: () {},
        ),
        const Text(
          'Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0F172A),
          ),
        ),
        _buildCircleButton(
          icon: Icons.share_outlined,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildCircleButton(
      {required IconData icon, required VoidCallback onTap}) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.04),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, size: 20, color: const Color(0xFF334155)),
        onPressed: onTap,
      ),
    );
  }

  // 2. Profile Header (Chủ đề Họa sĩ vẽ tranh)
  Widget _buildProfileHeader() {
    return Center(
      child: Column(
        children: [
          // Avatar có viền gradient nghệ thuật và tích xanh xác minh
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFF97316),
                      Color(0xFFEC4899),
                      Color(0xFF3B82F6)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                    radius: 54,
                    backgroundImage: AssetImage('images/doremon.jpg'),
                  ),
                ),
              ),
              // Huy hiệu verified xanh lam
              Positioned(
                bottom: 4,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_circle,
                    color: Color(0xFF0EA5E9),
                    size: 22,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Tên nghệ sĩ
          const Text(
            'Nhật Duy',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 6),
          // Chức danh chủ đề vẽ hình / Digital Artist
          const Text(
            'Lead Concept Artist & Illustrator',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF64748B),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          // Chip địa điểm
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_on_outlined,
                    size: 14, color: Color(0xFF64748B)),
                SizedBox(width: 4),
                Text(
                  'TP.HCM, Viet Nam',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF475569),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 3. Stats Card (Thống kê số lượng tranh vẽ, năm kinh nghiệm, đánh giá)
  Widget _buildStatsCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.03),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem('250', 'Artworks'),
          _buildVerticalDivider(),
          _buildStatItem('5 Yrs', 'Experience'),
          _buildVerticalDivider(),
          _buildStatRating('5.0', 'Rating'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF94A3B8),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildStatRating(String value, String label) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(width: 3),
            const Icon(Icons.star, color: Color(0xFFEAB308), size: 18),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF94A3B8),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 32,
      width: 1,
      color: const Color(0xFFE2E8F0),
    );
  }

  // 4. About Me
  Widget _buildAboutSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Me',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Passionate Concept Artist & Digital Painter specialized in 2D illustration, character design, and visual storytelling for games and comics.',
          style: TextStyle(
            fontSize: 13,
            height: 1.5,
            color: Color(0xFF64748B),
          ),
        ),
      ],
    );
  }

  // 5. Skills & Expertise (Chủ đề vẽ hình đồ họa)
  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Skills & Expertise',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 10,
          children: [
            _buildSkillChip(
              icon: Icons.brush_outlined,
              label: 'Digital Art',
              bgColor: const Color(0xFFE0F2FE),
              textColor: const Color(0xFF0284C7),
            ),
            _buildSkillChip(
              icon: Icons.draw_outlined,
              label: 'Sketching',
              bgColor: const Color(0xFFDCFCE7),
              textColor: const Color(0xFF16A34A),
            ),
            _buildSkillChip(
              icon: Icons.palette_outlined,
              label: 'Concept Art',
              bgColor: const Color(0xFFFFE4E6),
              textColor: const Color(0xFFE11D48),
            ),
            _buildSkillChip(
              icon: Icons.color_lens_outlined,
              label: 'Character Design',
              bgColor: const Color(0xFFF3E8FF),
              textColor: const Color(0xFF9333EA),
            ),
            _buildSkillChip(
              icon: Icons.layers_outlined,
              label: 'Procreate / PS',
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
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: textColor),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  // 6. Featured Projects (Tác phẩm tranh vẽ)
  Widget _buildFeaturedProjectsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Featured Artworks',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildArtCard(
                title: 'Cyber City Sketch',
                category: 'Digital Painting • 2026',
                gradientColors: [
                  const Color(0xFF3B82F6),
                  const Color(0xFF1D4ED8)
                ],
                icon: Icons.landscape_outlined,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: _buildArtCard(
                title: 'Neon Fantasy Girl',
                category: 'Character Art • Procreate',
                gradientColors: [
                  const Color(0xFFEC4899),
                  const Color(0xFF8B5CF6)
                ],
                icon: Icons.auto_awesome,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildArtCard({
    required String title,
    required String category,
    required List<Color> gradientColors,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.04),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Khung hình tranh vẽ
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Container(
              height: 95,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 38,
                  color: const Color.fromRGBO(255, 255, 255, 0.85),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  category,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 7. Contact Information
  Widget _buildContactSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.03),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildContactRow(
            icon: Icons.alternate_email,
            text: 'Contact Information',
            isHeader: true,
          ),
          const Divider(height: 1, color: Color(0xFFF1F5F9)),
          _buildContactRow(
            icon: Icons.mail_outline,
            text: 'dobimc2005@gmail.com',
          ),
          const Divider(height: 1, color: Color(0xFFF1F5F9)),
          _buildContactRow(
            icon: Icons.phone_outlined,
            text: '0396294605',
          ),
        ],
      ),
    );
  }

  Widget _buildContactRow({
    required IconData icon,
    required String text,
    bool isHeader = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: const Color(0xFF64748B),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isHeader ? FontWeight.w600 : FontWeight.w400,
                color: isHeader
                    ? const Color(0xFF0F172A)
                    : const Color(0xFF475569),
              ),
            ),
          ),
          const Icon(
            Icons.chevron_right,
            size: 18,
            color: Color(0xFF94A3B8),
          ),
        ],
      ),
    );
  }
}
