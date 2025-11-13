import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/network/api_services.dart';
import 'package:hangery/core/routing/routs.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';
import 'package:hangery/core/utils/naivgators.dart';
import 'package:hangery/core/utils/snacbar_helper.dart';
import 'package:hangery/featuer/auth/data/auth_model.dart';
import 'package:hangery/featuer/auth/data/auth_repo.dart';
import 'package:hangery/featuer/cart/data/cart_model.dart';
import 'package:hangery/featuer/cheakout/logic/cubit/checkout_cubit.dart';
import 'package:hangery/featuer/cheakout/widgets/order_summry.dart';
import 'package:hangery/featuer/cheakout/widgets/pay.dart';
import 'package:hangery/featuer/cheakout/widgets/payment_methodes.dart';

class CheckouPage extends StatefulWidget {
  final double totalPrice;
  final GetCartResponseModel cartModel;

  const CheckouPage({
    super.key,
    required this.totalPrice,
    required this.cartModel,
  });

  @override
  State<CheckouPage> createState() => _CheckouPageState();
}

class _CheckouPageState extends State<CheckouPage> {
  final isLoading = true;
  final AuthRepo authRepo = AuthRepo(ApiServices());
  UserModel? userModel;
  Future<UserModel> fetchUserData() async {
    try {
      final userData = await authRepo.getProfilrData();
      setState(() {
        userModel = userData;
      });
      return userData;
    } catch (e) {
      throw Exception('Failed to load user data: $e');
      //
    }
  }

  @override
  void initState() {
    fetchUserData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutSuccess) {
          SnackbarHelper.showSuccess(context, state.message);
        } else if (state is CheckoutFailure) {
          SnackbarHelper.showError(context, state.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 28.sp,
                      color: Colors.white,
                    ),
                  ),
                  20.verticalSpace,
                  OrderSummry(
                    totalPrice: widget.totalPrice,
                    deliveryFee: 20,
                    taxes: 15,
                    total: widget.totalPrice + 20 + 15,
                  ),
                  70.verticalSpace,
                  CoustomText(
                    color: Colors.white,
                    text: 'Payment methods',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  20.verticalSpace,
                  userModel == null
                      ? Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : userModel?.visa == null
                      ? Center(
                          child: CoustomText(
                            text: 'No visa card available',
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        )
                      : PaymentMethodes(
                          visa: userModel?.visa ?? '**** **** **** 1234',
                        ),

                  Spacer(),
                ],
              ),
            ),
          ),
          bottomSheet: Container(
            height: 140.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 8,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.h),
              child: state is CheckoutLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 2,
                      ),
                    )
                  : state is CheckoutSuccess
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Order Placed Successfully!',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                          ),
                          10.verticalSpace,
                          ElevatedButton(
                            onPressed: () {
                              context.pushNamedAndRemoveUntil(Routs.root);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            child: Text(
                              'Back to Home',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Pay(
                      totalPayPrice: widget.totalPrice + 20 + 15,
                      onPayButtonPressed: () {
                        final cartItems = widget.cartModel.data.items.map((
                          item,
                        ) {
                          return CartModel(
                            id: item.productId,
                            quantity: item.quantity,
                            spicy: item.spicy,
                            toppings: item.toppings.map((t) => t.id).toList(),
                            options: item.sideOptions.map((s) => s.id).toList(),
                          );
                        }).toList();
                        if (userModel == null) {
                          SnackbarHelper.showWarning(
                            context,
                            'Please wait until the user data is loaded.',
                          );
                          return;
                        }

                        if (state is CheckoutLoading) {
                          SnackbarHelper.showWarning(
                            context,
                            'Checkout is already in progress. Please wait...',
                          );
                          return;
                        }

                        // Now safe to trigger checkout
                        context.read<CheckoutCubit>().saveOrder(cartItems);
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}
