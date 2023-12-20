import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pony_collection/providers/products_provider.dart';
import 'package:pony_collection/providers/home_provider.dart';
import 'package:pony_collection/providers/my_orders_provider.dart';
import 'package:pony_collection/providers/on_board_provider.dart';
import 'package:pony_collection/providers/search_provider.dart';
import 'package:pony_collection/routes/app_router.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnBoardProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ProductsProvider()),
        ChangeNotifierProvider(create: (context) => MyOrdersProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: false,
            fontFamily: "Roboto",
            scaffoldBackgroundColor: Colors.blueGrey.shade50,
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ))),
        title: 'Pony Collection',
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
      ),
    );
  }
}
