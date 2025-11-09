import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/utils/pref_helpers.dart';
import 'package:hangery/featuer/order_history.dart/widgets/history_card.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  String? token;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    token = await PrefHelpers.getToken();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      extendBody: true,
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.r, vertical: 26.r),
                child: token == null
                    ? _buildGuestView(context)
                    : _buildOrderHistoryList(),
              ),
      ),
    );
  }

  /// ======================= Guest View =======================
  Widget _buildGuestView(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.history_rounded,
              size: 70.sp,
              color: AppColors.primaryColor,
            ),
            15.verticalSpace,
            Text(
              'No Order History',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            10.verticalSpace,
            Text(
              'You’re browsing as a guest. Login to view your past orders.',
              style: TextStyle(fontSize: 15.sp, color: Colors.grey.shade700),
              textAlign: TextAlign.center,
            ),
            20.verticalSpace,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              onPressed: () {
                // TODO: Navigate to Login Screen
              },
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ======================= Logged-In View =======================
  Widget _buildOrderHistoryList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Orders',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        20.verticalSpace,
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => const HistoryCard(),
            separatorBuilder: (context, index) => 20.verticalSpace,
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
