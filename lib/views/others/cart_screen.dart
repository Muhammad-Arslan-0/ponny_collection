import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pony_collection/models/cart_model.dart';
import 'package:pony_collection/providers/cart_provider.dart';
import 'package:pony_collection/widgets/auth_button.dart';
import 'package:pony_collection/widgets/padding_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final provider = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: Icon(Icons.navigate_before, size: 40)),
        leadingWidth: 20,
        title: Text("Cart (${provider.cartItems.length})",
            style: TextStyle(color: Colors.black, fontSize: 25)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: provider.cartItems.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  CartModel cartItem = provider.cartItems[index];
                  return Stack(
                    children: [
                      Positioned(
                        right: 0,
                        child: PaddingWidget(
                          child: Container(
                            color: Colors.white,
                            width: screenWidth * .85,
                            height: screenHeight * .14,
                            padding: EdgeInsets.only(left: 70),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(cartItem.name,
                                        style: TextStyle(fontSize: 25)),
                                    Text(
                                      "Size : ${cartItem.size}",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.grey),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6.0),
                                      child: Text(
                                        cartItem.price,
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ),
                                  ],
                                ),
                                Consumer<CartProvider>(
                                    builder: (context, cartProvider, child) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: DropdownButton(
                                          underline: SizedBox(),
                                          value: cartItem.quantity,
                                          icon: Icon(Icons.keyboard_arrow_down),
                                          isDense: true,
                                          items: [
                                            for (var i = 1; i <= 100; i++) i
                                          ]
                                              .map((e) => DropdownMenuItem(
                                                  child: Text(e.toString()),
                                                  value: e.toString()))
                                              .toList(),
                                          onChanged: (v) {
                                            provider.changeQuantity(
                                                v ?? "1", cartItem);
                                          }),
                                    ),
                                  );
                                })
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                          height: screenWidth * .3,
                          child: Image.asset(cartItem.image)),
                    ],
                  );
                }),
          ),
          PaddingWidget(
            child: Container(
              width: screenWidth,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: PaddingWidget(
                child: Column(children: [
                  Text("GRAND TOTAL (INCLUDED TAX)",
                      style: TextStyle(color: Colors.grey, fontSize: 20)),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "\$1125,12",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  AuthButton(
                      text: "CHECK OUT NOW", onPressed: () {}, isLoginBtn: true)
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
