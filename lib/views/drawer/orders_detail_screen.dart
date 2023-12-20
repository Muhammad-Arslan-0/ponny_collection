import 'package:flutter/material.dart';
import 'package:pony_collection/helper/app_colors.dart';
import 'package:pony_collection/models/my_orders_model.dart';
import 'package:pony_collection/widgets/my_appbar.dart';
import 'package:pony_collection/widgets/order_detail_tile.dart';

import '../../helper/app_images.dart';

class OrdersDetailScreen extends StatelessWidget {
  final MyOrdersModel orderModel;
  const OrdersDetailScreen({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * .08),
          child: MyAppBar(title: "Order detail")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(30),
                decoration:
                    BoxDecoration(color: Colors.blueGrey.shade50, boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 8,
                    color: Colors.grey,
                    spreadRadius: 2,
                  ),
                ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text("No. ${orderModel.orderNo}",
                            style: TextStyle(
                                fontSize: 35, color: AppColors.gradientBtn1)),
                        Text("${orderModel.bookDate}",
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(AppImages.orderDetailLogo,
                            fit: BoxFit.cover)),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Container(
                width: screenWidth,
                color: Colors.white,
                child: Column(children: [
                  OrderDetailTile(
                      leading: "1", title: "Nike shoes", trailing: "\$1200.00"),
                  OrderDetailTile(
                      leading: "2",
                      title: "Nike T-Shirt",
                      trailing: "\$840.00"),
                  OrderDetailTile(
                      leading: "1", title: "L&V Jean", trailing: "\$4200.00"),
                  OrderDetailTile(
                      leading: "1",
                      title: "Thuong dinh shoes",
                      trailing: "\$110.00"),
                  OrderDetailTile(
                      leading: "1", title: "Goi mi tom", trailing: "\$1.00"),
                  OrderDetailTile(
                      leading: "1",
                      title: "Comdom package",
                      trailing: "\$12.00"),
                  OrderDetailTile(
                      leading: "1",
                      title: "Apple smart watch",
                      trailing: "\$1200.00"),
                  ListTile(
                    dense: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("FEE", style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    trailing: Text("\$20.00", style: TextStyle(fontSize: 15)),
                  ),
                  ListTile(
                    dense: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "VAT TAX",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    trailing: Text("\$450.00", style: TextStyle(fontSize: 15)),
                  ),
                  Divider(thickness: 2),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text("Grand Total", style: TextStyle(fontSize: 18)),
                        Text("\$4572.00",
                            style: TextStyle(
                                fontSize: 35, color: AppColors.gradientBtn1)),
                      ],
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
