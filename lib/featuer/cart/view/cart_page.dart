import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hangery/featuer/cart/widgets/item_card.dart';
import 'package:hangery/featuer/cart/widgets/show_total.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(right: 31.0.r, left: 13.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                ListView.separated(
                  itemBuilder: (context, index) {
                    return const ItemCard();
                  },
                  separatorBuilder: (context, index) {
                    return 20.verticalSpace;
                  },
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
                30.verticalSpace,
                ShowTotal(),
                30.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
