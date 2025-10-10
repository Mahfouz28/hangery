import 'package:flutter/material.dart';
import 'package:hangery/core/routing/routs.dart';
import 'package:hangery/featuer/auth/view/login_view.dart';
import 'package:hangery/featuer/auth/view/sign_up_view.dart';
import 'package:hangery/featuer/cart/view/cart_page.dart';
import 'package:hangery/featuer/cheakout/view/checkou_page.dart';
import 'package:hangery/featuer/home/view/home_page.dart';
import 'package:hangery/featuer/order_history.dart/view/order_history.dart';
import 'package:hangery/featuer/prouduct_details/view/prouduct_details.dart';
import 'package:hangery/root.dart';
import 'package:hangery/splash_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routs.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case Routs.loginView:
        return MaterialPageRoute(builder: (_) => LoginView());

      case Routs.signUp:
        return MaterialPageRoute(builder: (_) => SignUpView());
      case Routs.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());

      case Routs.cart:
        return MaterialPageRoute(builder: (_) => CartPage());
      case Routs.checkout:
        return MaterialPageRoute(builder: (_) => CheckouPage());
      case Routs.orderHistory:
        return MaterialPageRoute(builder: (_) => OrderHistory());

      case Routs.productDetails:
        return MaterialPageRoute(builder: (_) => ProuductDetails());

      case Routs.root:
        return MaterialPageRoute(builder: (_) => Root());

      default:
        return MaterialPageRoute(builder: (_) => Text('Error'));
    }
  }
}
