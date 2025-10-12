import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';
import 'package:hangery/core/sheard/widgets/custom_text_botton.dart';
import 'package:hangery/featuer/prouduct_details/view/widgets/customize_ur_order.dart';
import 'package:hangery/featuer/prouduct_details/view/widgets/side_option_card.dart';
import 'package:hangery/featuer/prouduct_details/view/widgets/topping_card.dart';

class ProuductDetails extends StatelessWidget {
  const ProuductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),

              const CustomizeUrOrder(),
              40.verticalSpace,

              CoustomText(
                text: 'Toppings',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xff3C2F2F),
              ),
              30.verticalSpace,

              SizedBox(
                height: 120.h,
                child: ListView.separated(
                  clipBehavior: Clip.none,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ToppingCard(
                      name: 'Tomato',
                      image: 'assets/images/tomato.png',
                      onAdd: () {},
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(width: 10.w),
                  itemCount: 6,
                ),
              ),
              30.verticalSpace,
              CoustomText(
                text: 'Side options',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xff3C2F2F),
              ),
              30.verticalSpace,
              SizedBox(
                height: 120.h,
                child: ListView.separated(
                  clipBehavior: Clip.none,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SideOptionCard(
                    name: 'Fries',
                    image: 'assets/images/fries.png',
                    onAdd: () {},
                  ),
                  separatorBuilder: (_, __) => SizedBox(width: 10.w),
                  itemCount: 6,
                ),
              ),
              40.verticalSpace,
              Row(
                children: [
                  Column(
                    children: [
                      CoustomText(
                        text: 'Total Price',
                        fontSize: 18.sp,
                        color: const Color(0xff3C2F2F),
                        fontWeight: FontWeight.w600,
                      ),
                      10.verticalSpace,
                      CoustomText(
                        text: '\$12.00',
                        fontSize: 22.sp,
                        color: const Color(0xff3C2F2F),
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomTextButton(
                    height: 70.h,
                    width: 200.w,
                    textColor: Colors.white,
                    onPressed: () {},
                    text: 'Add to Cart',
                    backgroundColor: AppColors.primaryColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
