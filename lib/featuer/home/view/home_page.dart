import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/routing/routs.dart';
import 'package:hangery/core/utils/naivgators.dart';
import 'package:hangery/featuer/home/widgets/card_item.dart';
import 'package:hangery/featuer/home/widgets/catigory_list.dart';
import 'package:hangery/featuer/home/widgets/home_appBar.dart';
import 'package:hangery/featuer/home/widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeAppbar(),

                  20.verticalSpace,

                  const HomeSearchBar(),

                  20.verticalSpace,

                  const CatigoryList(),

                  20.verticalSpace,

                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 230.h,
                      crossAxisSpacing: 14.w,
                      mainAxisSpacing: 18.h,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => context.pushNamed(Routs.productDetails),
                      child: const CardItem(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
