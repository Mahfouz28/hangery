import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';
import 'package:hangery/core/utils/pref_helpers.dart';

class HomeAppbar extends StatefulWidget {
  final String? image;
  final String? userName;

  const HomeAppbar({super.key, this.image, this.userName});

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar> {
  String? token;
  String? imageUrl;
  String? userName;

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    final savedToken = await PrefHelpers.getToken();
    setState(() {
      token = savedToken;
      imageUrl = widget.image;
      userName = widget.userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ====== App Name + Greeting ======
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/svg/Hungry_.svg',
                height: 40.h,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              8.verticalSpace,
              CoustomText(
                text: token != null ? 'Hello, Mahfouz 👋' : 'Welcome, Guest 👋',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ],
          ),

          // ====== Avatar ======
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (child, animation) =>
                FadeTransition(opacity: animation, child: child),
            child: _buildAvatar(),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    // 🧠 If user is logged in and image is available → show profile image
    if (token != null && imageUrl != null && imageUrl!.isNotEmpty) {
      return Container(
        key: const ValueKey('userAvatar'),
        width: 60.w,
        height: 60.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.9), width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipOval(
          child: Image.network(
            imageUrl!,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                const Icon(Icons.person_rounded, color: Colors.white),
          ),
        ),
      );
    }

    // 🧑‍ Guest / no image
    return Container(
      key: const ValueKey('guestAvatar'),
      width: 60.w,
      height: 60.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Color(0xFF444674), Color(0xFF2E2F4E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.white.withOpacity(0.6), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Icon(Icons.person_rounded, color: Colors.white, size: 34.sp),
      ),
    );
  }
}
