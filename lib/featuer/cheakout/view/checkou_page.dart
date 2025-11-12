import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/network/api_services.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';
import 'package:hangery/featuer/auth/data/auth_model.dart';
import 'package:hangery/featuer/auth/data/auth_repo.dart';
import 'package:hangery/featuer/cheakout/widgets/order_summry.dart';
import 'package:hangery/featuer/cheakout/widgets/pay.dart';
import 'package:hangery/featuer/cheakout/widgets/payment_methodes.dart';

class CheckouPage extends StatefulWidget {
  final double totalPrice;
  const CheckouPage({super.key, required this.totalPrice});

  @override
  State<CheckouPage> createState() => _CheckouPageState();
}

class _CheckouPageState extends State<CheckouPage> {
  final isLoading = true;
  final AuthRepo authRepo = AuthRepo(ApiServices());
  UserModel? userModel;
  Future<UserModel> fetchUserData() async {
    try {
      final userData = await authRepo.getProfilrData();
      setState(() {
        userModel = userData;
      });
      return userData;
    } catch (e) {
      throw Exception('Failed to load user data: $e');
      //
    }
  }

  @override
  void initState() {
    fetchUserData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 28.sp,
                  color: Colors.white,
                ),
              ),
              20.verticalSpace,
              OrderSummry(
                totalPrice: widget.totalPrice,
                deliveryFee: 20,
                taxes: 15,
                total: widget.totalPrice + 20 + 15,
              ),
              70.verticalSpace,
              CoustomText(
                color: Colors.white,
                text: 'Payment methods',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
              20.verticalSpace,
              userModel == null
                  ? Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : userModel?.visa == null
                  ? Center(
                      child: CoustomText(
                        text: 'No visa card available',
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    )
                  : PaymentMethodes(
                      visa: userModel?.visa ?? '**** **** **** 1234',
                    ),

              Spacer(),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 140.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 8,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.h),
          child: Pay(totalPayPrice: widget.totalPrice + 20 + 15),
        ),
      ),
    );
  }
}
