import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/featuer/auth/view/profile_view.dart';
import 'package:hangery/featuer/cart/view/cart_page.dart';
import 'package:hangery/featuer/home/view/home_page.dart';
import 'package:hangery/featuer/order_history.dart/view/order_history.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _currentScreen = 0;

  final List<Widget> _screens = [
    HomePage(),
    const CartPage(),
    const OrderHistory(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() => _currentScreen = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: _currentScreen, children: _screens),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
          bottom: 40.h,
          top: 10.h,
        ),
        height: 80.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100.r),
            topRight: Radius.circular(100.r),
            bottomLeft: Radius.circular(100.r),
            bottomRight: Radius.circular(100.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100.r),
            topRight: Radius.circular(100.r),
            bottomLeft: Radius.circular(100.r),
            bottomRight: Radius.circular(100.r),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white.withOpacity(0.4),
              currentIndex: _currentScreen,
              onTap: _onItemTapped,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primaryColor,

              unselectedItemColor: Colors.white,

              selectedFontSize: 14.sp,
              unselectedFontSize: 13.sp,
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.home,
                    color: Color.fromARGB(255, 252, 252, 252),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.cart,
                    color: Color.fromARGB(255, 246, 246, 248),
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.receipt_long_outlined,
                    color: Color.fromARGB(255, 243, 243, 251),
                  ),
                  label: 'Orders',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.person_crop_circle,
                    color: Color.fromARGB(255, 248, 248, 251),
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
