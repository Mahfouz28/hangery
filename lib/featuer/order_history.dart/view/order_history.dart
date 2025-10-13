import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/featuer/order_history.dart/widgets/history_card.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      extendBody: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.r, vertical: 26.r),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return const HistoryCard();
                  },
                  separatorBuilder: (context, index) {
                    return 20.verticalSpace;
                  },
                  itemCount: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
