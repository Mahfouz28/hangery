import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangery/app.dart';
import 'package:hangery/core/network/api_services.dart';
import 'package:hangery/core/utils/auth_manger.dart';
import 'package:hangery/featuer/auth/data/auth_repo.dart';
import 'package:hangery/featuer/auth/logic/auth_cubit.dart';
import 'package:hangery/featuer/cart/logic/cubit/cart_cubit.dart';
import 'package:hangery/featuer/home/logic/cubit/product_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthManager.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CartCubit()..fetchCartData(),
        ), // initialize cart
        BlocProvider(create: (_) => AuthCubit(AuthRepo(ApiServices()))),
        BlocProvider(create: (_) => ProductCubit()..getAllProduct()),
      ],
      child: const MyApp(),
    ),
  );
}
