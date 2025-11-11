import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';
import 'package:hangery/core/sheard/widgets/custom_text_botton.dart';
import 'package:hangery/featuer/home/data/product_model.dart';
import 'package:hangery/featuer/prouduct_details/logic/cubit/product_details_cubit.dart';
import 'package:hangery/featuer/prouduct_details/view/widgets/customize_ur_order.dart';
import 'package:hangery/featuer/prouduct_details/view/widgets/side_option_card.dart';
import 'package:hangery/featuer/prouduct_details/view/widgets/topping_card.dart';

class ProuductDetails extends StatelessWidget {
  final ProductModel? product;
  const ProuductDetails({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.primaryColor,

            child: Center(
              child: SizedBox(
                width: 50.w,
                height: 50.h,
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
          );
        } else if (state is ProductDetailsError) {
          return Center(
            child: Text(
              'Something went wrong',
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
          );
        } else if (state is ProductDetailsSuccess) {
          final toppings = state.toppings;
          final sideOptions = state.sideoptions;

          return Scaffold(
            body: Container(
              decoration: BoxDecoration(color: AppColors.primaryColor),
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 22.sp,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: CoustomText(
                                text: 'Product Details',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 48),
                        ],
                      ),
                      25.verticalSpace,
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: CustomizeUrOrder(
                          image: product!.image,
                          title: product!.name,
                        ),
                      ),
                      35.verticalSpace,
                      CoustomText(
                        text: 'Toppings',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      20.verticalSpace,
                      SizedBox(
                        height: 120.h,
                        child: ListView.separated(
                          clipBehavior: Clip.none,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final topping = toppings[index];
                            return ToppingCard(
                              name: topping.name,
                              image: topping.image,
                              onAdd: () {},
                            );
                          },
                          separatorBuilder: (_, __) => SizedBox(width: 12.w),
                          itemCount: toppings.length,
                        ),
                      ),
                      35.verticalSpace,
                      CoustomText(
                        text: 'Side Options',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      20.verticalSpace,
                      SizedBox(
                        height: 120.h,
                        child: ListView.separated(
                          clipBehavior: Clip.none,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final sideOption = sideOptions[index];
                            return SideOptionCard(
                              name: sideOption.name,
                              image: sideOption.image,
                              onAdd: () {},
                            );
                          },

                          separatorBuilder: (_, __) => SizedBox(width: 12.w),
                          itemCount: sideOptions.length,
                        ),
                      ),
                      40.verticalSpace,
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 20.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CoustomText(
                                  text: 'Total Price',
                                  fontSize: 16.sp,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ),
                                8.verticalSpace,
                                CoustomText(
                                  text: '\$12.00',
                                  fontSize: 22.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                            const Spacer(),
                            CustomTextButton(
                              height: 60.h,
                              width: 180.w,
                              textColor: AppColors.primaryColor,
                              onPressed: () {},
                              text: 'Add to Cart',
                              backgroundColor: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              borderRadius: 12.r,
                            ),
                          ],
                        ),
                      ),
                      15.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
