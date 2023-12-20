import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pony_collection/models/my_orders_model.dart';
import 'package:pony_collection/providers/my_orders_provider.dart';
import 'package:provider/provider.dart';

import '../../helper/app_colors.dart';
import '../../helper/route_constants.dart';
import '../../widgets/my_appbar.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.sizeOf(context).height;
    final provider = Provider.of<MyOrdersProvider>(context, listen: false);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * .08),
          child: MyAppBar(title: "My orders")),
      body: ListView.builder(
          itemCount: provider.orders.length,
          itemBuilder: (context, index) {
            MyOrdersModel myOrder = provider.orders[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).pushNamed(
                      RouteConstants.orderDetailScreen,
                      extra: myOrder);
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: "No. ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                  children: [
                                    TextSpan(
                                        text: "#${myOrder.orderNo}",
                                        style: TextStyle(
                                            color: AppColors.gradientBtn1))
                                  ]),
                            ),
                            Text("Booked on ${myOrder.bookDate}")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            Container(
                                height: 80,
                                width: 80,
                                child: Image.asset(myOrder.image,
                                    fit: BoxFit.cover)),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  myOrder.name,
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  myOrder.price,
                                  style: TextStyle(
                                      color: AppColors.gradientBtn1,
                                      fontSize: 16),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(thickness: 2),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Center(child: Text("MANAGE ORDER")),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
