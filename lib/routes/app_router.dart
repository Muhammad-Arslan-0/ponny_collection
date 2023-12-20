import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pony_collection/models/my_orders_model.dart';
import 'package:pony_collection/models/product_model.dart';
import 'package:pony_collection/views/auth/auth_screen.dart';
import 'package:pony_collection/views/others/cart_screen.dart';
import 'package:pony_collection/views/dashboard/home_screen.dart';
import 'package:pony_collection/views/others/product_view_screen.dart';
import 'package:pony_collection/views/others/products_screen.dart';
import 'package:pony_collection/views/others/search_screen.dart';
import 'package:pony_collection/views/drawer/my_orders_screen.dart';
import 'package:pony_collection/views/drawer/orders_detail_screen.dart';
import 'package:pony_collection/views/splash/landing_screen.dart';
import 'package:pony_collection/views/auth/on_boarding_screen.dart';

import '../helper/route_constants.dart';
import '../views/splash/splash_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
        path: "/",
        name: RouteConstants.splashScreen,
        builder: (context, state) {
          return SplashScreen();
        }),
    GoRoute(
        path: "/first",
        name: RouteConstants.firstScreen,
        builder: (context, state) {
          return LandingScreen();
        }),
    GoRoute(
        path: "/auth",
        name: RouteConstants.authScreen,
        builder: (context, state) {
          return AuthScreen(
            isLogin: state.extra as bool,
          );
        }),
    GoRoute(
        path: "/onBoarding",
        name: RouteConstants.onBoardingScreen,
        builder: (context, state) {
          return OnBoardingScreen();
        }),
    GoRoute(
        path: "/home",
        name: RouteConstants.homeScreen,
        builder: (context, state) {
          return HomeScreen();
        }),
    GoRoute(
        path: "/cart",
        name: RouteConstants.cartScreen,
        builder: (context, state) {
          return CartScreen();
        }),
    GoRoute(
        path: "/products",
        name: RouteConstants.categoriesScreen,
        builder: (context, state) {
          return ProductsScreen(
            categoryName: state.extra as String,
          );
        }),
    GoRoute(
        path: "/productView",
        name: RouteConstants.productScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: Offset(0.75, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.ease)),
                        ),
                        child: child),
            child: ProductViewScreen(
              productModel: state.extra as ProductModel,
            ),
          );
        }),
    GoRoute(
        path: "/myOrders",
        name: RouteConstants.myOrdersScreen,
        builder: (context, state) {
          return MyOrdersScreen();
        }),
    GoRoute(
        path: "/orderDetail",
        name: RouteConstants.orderDetailScreen,
        builder: (context, state) {
          return OrdersDetailScreen(orderModel: state.extra as MyOrdersModel);
        }),
    GoRoute(
        path: "/search",
        name: RouteConstants.searchScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: Offset(0.75, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.ease)),
                        ),
                        child: child),
            child: SearchScreen(),
          );
        }),
  ]);
}
