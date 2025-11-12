import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/routing/routs.dart';
import 'package:hangery/core/utils/naivgators.dart';
import 'package:hangery/core/utils/pref_helpers.dart';
import 'package:hangery/core/utils/snacbar_helper.dart';
import 'package:hangery/featuer/cart/logic/cubit/cart_cubit.dart';
import 'package:hangery/featuer/cart/widgets/item_card.dart';
import 'package:hangery/featuer/cart/widgets/show_total.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String? token;
  bool isLoadingToken = true;

  @override
  void initState() {
    super.initState();
    _checkToken();
    // Trigger cart loading if user is logged in
    final cartCubit = context.read<CartCubit>();
    cartCubit.fetchCartData();
  }

  Future<void> _checkToken() async {
    final storedToken = await PrefHelpers.getToken();
    setState(() {
      token = storedToken;
      isLoadingToken = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoadingToken) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        if (state is CartLoading) {
          return const Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: Center(child: CircularProgressIndicator(color: Colors.white)),
          );
        }

        if (state is CartSuccess) {
          final cartItems = state.cartModel.data.items;
          final totalPrice = state.cartModel.data.totalPrice;

          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ===== App Bar =====
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                          ),
                          iconSize: 22.sp,
                        ),
                        Text(
                          'Your Cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    10.verticalSpace,

                    // ===== Guest Mode =====
                    if (token == null)
                      Expanded(
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(20.w),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.lock_outline,
                                  size: 60.sp,
                                  color: AppColors.primaryColor,
                                ),
                                15.verticalSpace,
                                Text(
                                  'You’re browsing as a guest',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                10.verticalSpace,
                                Text(
                                  'Login or create an account to save items in your cart and checkout.',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey.shade700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                20.verticalSpace,
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryColor,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 30.w,
                                      vertical: 12.h,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.r),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/login',
                                    ); // Navigate to Login
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    // ===== Logged-In Mode =====
                    else
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemCount: cartItems.length,
                                itemBuilder: (context, index) {
                                  final item = cartItems[index];
                                  return Dismissible(
                                    direction: DismissDirection.endToStart,
                                    key: ValueKey(item.itemId),
                                    background: Container(
                                      color: Colors.red,
                                      alignment: Alignment.centerRight,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20.w,
                                      ),
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ),

                                    confirmDismiss: (direction) async {
                                      final cartCubit = context
                                          .read<CartCubit>();
                                      if (state.isDeleting) {
                                        SnackbarHelper.showWarning(
                                          context,
                                          'Please wait until the current deletion is complete.',
                                        );
                                        return false;
                                      }
                                      cartCubit.deleteCartItem(item.itemId);
                                      return false;
                                    },

                                    child: ItemCard(
                                      image: item.image,
                                      title: item.name,
                                      description: 'Spicy: ${item.spicy}',
                                      price:
                                          '\$${item.price.toStringAsFixed(2)}',
                                      initialCount: item.quantity,
                                    ),
                                  );
                                },
                                separatorBuilder: (_, __) => 18.verticalSpace,
                              ),
                            ),
                            ShowTotal(
                              onCheckout: () {
                                context.pushNamed(
                                  Routs.checkout,
                                  arguments: totalPrice,
                                );
                              },
                              totalAmount: state.isDeleting
                                  ? SizedBox.shrink()
                                  : Text(
                                      '${totalPrice.toDouble().toStringAsFixed(2)} EGP',
                                      style: TextStyle(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),

                              text: 'Checkout',
                              isDeleting: state.isDeleting,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        }

        return const Scaffold(
          body: Center(child: Text('Something went wrong')),
        );
      },
    );
  }
}
