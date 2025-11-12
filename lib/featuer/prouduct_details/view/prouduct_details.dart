import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';
import 'package:hangery/core/sheard/widgets/custom_text_botton.dart';
import 'package:hangery/core/utils/snacbar_helper.dart';
import 'package:hangery/featuer/cart/data/cart_model.dart';
import 'package:hangery/featuer/home/data/product_model.dart';
import 'package:hangery/featuer/prouduct_details/logic/cubit/product_details_cubit.dart';
import 'package:hangery/featuer/prouduct_details/view/widgets/customize_ur_order.dart';
import 'package:hangery/featuer/prouduct_details/view/widgets/side_option_card.dart';
import 'package:hangery/featuer/prouduct_details/view/widgets/topping_card.dart';

class ProuductDetails extends StatefulWidget {
  final ProductModel? product;
  const ProuductDetails({super.key, this.product});

  @override
  State<ProuductDetails> createState() => _ProuductDetailsState();
}

class _ProuductDetailsState extends State<ProuductDetails> {
  final selectedToppings = <int>[];
  final selectedSideOptions = <int>[];
  double spicyValue = 0.5;

  ProductDetailsSuccess? lastLoadedDetails;

  @override
  void initState() {
    super.initState();
    context.read<ProductDetailsCubit>().productDetails();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
      listener: (context, state) {
        if (state is ProductDetailsSuccess) {
          // store last loaded details
          lastLoadedDetails = state;
        }

        if (state is AddToCartSuccess) {
          SnackbarHelper.showSuccess(context, state.successMessage);
        } else if (state is AddToCartFailure) {
          SnackbarHelper.showError(context, state.errMessage);
        } else if (state is ProductDetailsError) {
          SnackbarHelper.showError(
            context,
            state.errorMessage ?? 'Failed to load product details',
          );
        }
      },
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
                child: const CircularProgressIndicator(color: Colors.white),
              ),
            ),
          );
        }

        final details = lastLoadedDetails;
        if (details == null) return const SizedBox.shrink();

        final toppings = details.toppings;
        final sideOptions = details.sideoptions;

        return Scaffold(
          body: Container(
            color: AppColors.primaryColor,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
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
                        image: widget.product!.image,
                        title: widget.product!.name,
                        onSpicyChanged: (value) {
                          setState(() => spicyValue = value);
                        },
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
                        itemCount: toppings.length,
                        separatorBuilder: (_, __) => SizedBox(width: 12.w),
                        itemBuilder: (context, index) {
                          final topping = toppings[index];
                          final isSelected = selectedToppings.contains(index);

                          return ToppingCard(
                            name: topping.name,
                            image: topping.image,
                            isSelected: isSelected,
                            onAdd: () {
                              setState(() {
                                isSelected
                                    ? selectedToppings.remove(index)
                                    : selectedToppings.add(index);
                              });
                            },
                          );
                        },
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
                        itemCount: sideOptions.length,
                        separatorBuilder: (_, __) => SizedBox(width: 12.w),
                        itemBuilder: (context, index) {
                          final sideOption = sideOptions[index];
                          final isSelected = selectedSideOptions.contains(
                            index,
                          );

                          return SideOptionCard(
                            name: sideOption.name,
                            image: sideOption.image,
                            isSelected: isSelected,
                            onAdd: () {
                              setState(() {
                                isSelected
                                    ? selectedSideOptions.remove(index)
                                    : selectedSideOptions.add(index);
                              });
                            },
                          );
                        },
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
                                text: '${widget.product!.price} EGP',
                                fontSize: 22.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          const Spacer(),
                          CustomTextButton(
                            icon: (state is AddToCartLoading)
                                ? CircularProgressIndicator(color: Colors.black)
                                : Icon(
                                    Icons.shopping_cart_outlined,
                                    color: AppColors.primaryColor,
                                    size: 30.sp,
                                  ),
                            height: 60.h,
                            width: 180.w,
                            textColor: AppColors.primaryColor,
                            text: 'Add to Cart',
                            backgroundColor: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            borderRadius: 12.r,
                            onPressed: () {
                              context.read<ProductDetailsCubit>().addToCart(
                                CartModel(
                                  id: widget.product!.id,
                                  quantity: 1,
                                  spicy: spicyValue,
                                  toppings: selectedToppings,
                                  options: selectedSideOptions,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
