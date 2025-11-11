import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/routing/routs.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';
import 'package:hangery/core/utils/naivgators.dart';
import 'package:hangery/core/utils/pref_helpers.dart';
import 'package:hangery/featuer/home/logic/cubit/product_cubit.dart';
import 'package:hangery/featuer/home/widgets/card_item.dart';
import 'package:hangery/featuer/home/widgets/catigory_list.dart';
import 'package:hangery/featuer/home/widgets/home_appBar.dart';
import 'package:hangery/featuer/home/widgets/search_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? token;
  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    token = await PrefHelpers.getToken();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Scaffold(
              backgroundColor: AppColors.primaryColor,
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 14.h,
                  ),
                  child: Skeletonizer(
                    child: Column(
                      children: [
                        HomeAppbar(),
                        20.verticalSpace,
                        const HomeSearchBar(),
                        20.verticalSpace,
                        const CatigoryList(),
                        25.verticalSpace,
                        if (token == null) _buildGuestHintCard(context),
                        10.verticalSpace,

                        Expanded(
                          child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: 6,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 285.h,
                                  crossAxisSpacing: 14.w,
                                  mainAxisSpacing: 8.h,
                                ),
                            itemBuilder: (_, __) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (state is ProductError) {
            return Center(
              child: Text(
                'Error: ${state.error}',
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            );
          } else if (state is ProductSuccess) {
            final products = state.products;
            final user = state.user;

            return Scaffold(
              backgroundColor: AppColors.primaryColor,
              body: SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 14.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeAppbar(image: user!.image, userName: user.name),

                      20.verticalSpace,

                      const HomeSearchBar(),

                      20.verticalSpace,

                      const CatigoryList(),

                      25.verticalSpace,
                      SizedBox(
                        height: 600.h,
                        width: double.infinity,
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 285.h,
                                crossAxisSpacing: 14.w,
                                mainAxisSpacing: 8.h,
                              ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return GestureDetector(
                              onTap: () {
                                if (token == null) {
                                  _showGuestDialog(context);
                                } else {
                                  context.pushNamed(
                                    Routs.productDetails,
                                    arguments: product,
                                  );
                                }
                              },
                              child: CardItem(
                                imagePath: product.image,
                                title: product.name,
                                subtitle: product.description,
                                rating: product.rating,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const CoustomText(
            text: 'something went Wrong',
            color: Colors.white,
            fontSize: 50,
          );
        },
      ),
    );
  }

  Widget _buildGuestHintCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.white70, size: 22.sp),
          10.horizontalSpace,
          Expanded(
            child: Text(
              'You are browsing as a guest. Login to save your cart and get personalized offers.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 13.5.sp,
                height: 1.4,
              ),
            ),
          ),
          TextButton(
            onPressed: () => context.pushNamed(Routs.loginView),
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.blueAccent.shade100,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showGuestDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF2B2B3D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          'Login Required',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          'You need to log in to view product details or make a purchase.',
          style: TextStyle(color: Colors.white70, fontSize: 14.sp),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Colors.white70)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              context.pushNamed(Routs.loginView);
            },
            child: Text('Login', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
