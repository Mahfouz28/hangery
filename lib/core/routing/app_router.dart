import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangery/core/routing/routs.dart';
import 'package:hangery/featuer/auth/logic/auth_cubit.dart';
import 'package:hangery/featuer/auth/data/auth_repo.dart';
import 'package:hangery/featuer/auth/view/login_view.dart';
import 'package:hangery/featuer/auth/view/sign_up_view.dart';
import 'package:hangery/featuer/cart/data/cart_model.dart';
import 'package:hangery/featuer/cart/logic/cubit/cart_cubit.dart';
import 'package:hangery/featuer/cart/view/cart_page.dart';
import 'package:hangery/featuer/cheakout/logic/cubit/checkout_cubit.dart';
import 'package:hangery/featuer/cheakout/view/checkou_page.dart';
import 'package:hangery/featuer/home/data/product_model.dart';
import 'package:hangery/featuer/home/logic/cubit/product_cubit.dart';
import 'package:hangery/featuer/home/view/home_page.dart';
import 'package:hangery/featuer/order_history.dart/view/order_history.dart';
import 'package:hangery/featuer/prouduct_details/logic/cubit/product_details_cubit.dart';
import 'package:hangery/featuer/prouduct_details/view/prouduct_details.dart';
import 'package:hangery/core/network/api_services.dart';
import 'package:hangery/root.dart';
import 'package:hangery/splash_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routs.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case Routs.loginView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(AuthRepo(ApiServices())),
            child: LoginView(),
          ),
        );

      case Routs.signUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(AuthRepo(ApiServices())),
            child: SignUpView(),
          ),
        );
      case Routs.homePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProductCubit()..getAllProduct(),
            child: HomePage(),
          ),
        );

      case Routs.cart:
        final cartCubit = settings.arguments as CartCubit?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: cartCubit ?? CartCubit(),
            child: CartPage(),
          ),
        );

      case Routs.checkout:
        final args = settings.arguments as Map<String, dynamic>;

        final totalPrice = args['totalPrice'] as double;
        final cartModel = args['cartModel'] as GetCartResponseModel;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => CheckoutCubit(),
            child: CheckouPage(totalPrice: totalPrice, cartModel: cartModel),
          ),
        );

      case Routs.orderHistory:
        return MaterialPageRoute(builder: (_) => OrderHistory());

      case Routs.productDetails:
        final product = settings.arguments as ProductModel;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProductDetailsCubit()..productDetails(),
            child: ProuductDetails(product: product),
          ),
        );

      case Routs.root:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProductCubit()..getAllProduct(),
            child: Root(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(body: Center(child: Text('No route defined'))),
        );
    }
  }
}
