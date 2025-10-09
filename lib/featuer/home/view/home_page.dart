import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hangery/featuer/home/widgets/card_item.dart';
import 'package:hangery/featuer/home/widgets/catigory_list.dart';
import 'package:hangery/featuer/home/widgets/home_appBar.dart';
import 'package:hangery/featuer/home/widgets/search_bar.dart';

// ignore: must_be_immutable
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
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.0.r),
              child: Column(
                children: [
                  HomeAppbar(),
                  18.verticalSpace,
                  HomeSearchBar(),
                  20.verticalSpace,
                  CatigoryList(),

                  20.verticalSpace,
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3,
                      mainAxisExtent: 228.h,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 15,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) => CardItem(),
                    itemCount: 11,
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
