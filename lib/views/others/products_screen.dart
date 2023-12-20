import 'package:flutter/material.dart';
import 'package:pony_collection/helper/app_images.dart';
import 'package:pony_collection/providers/products_provider.dart';
import 'package:pony_collection/widgets/grid_type_view.dart';
import 'package:pony_collection/widgets/list_type_view.dart';
import 'package:pony_collection/widgets/my_appbar.dart';
import 'package:pony_collection/widgets/padding_widget.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  final String categoryName;
  const ProductsScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * .08),
          child: MyAppBar(title: categoryName)),
      body: Consumer<ProductsProvider>(builder: (context, provider, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: screenWidth * .8,
                    color: Colors.white,
                    child: PaddingWidget(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              final RenderBox button =
                                  context.findRenderObject()! as RenderBox;
                              final RelativeRect position =
                                  RelativeRect.fromLTRB(
                                      button.localToGlobal(Offset.zero).dx,
                                      button.localToGlobal(Offset.zero).dy + 75,
                                      double.infinity,
                                      double.infinity);
                              showOrderMenu(context, position, provider);
                            },
                            child: Row(
                              children: [
                                Text(
                                  provider.orderType,
                                  style: TextStyle(fontSize: 16),
                                ),
                                Icon(Icons.keyboard_arrow_down, size: 35)
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset(AppImages.filterIcon,
                                  color: Colors.black),
                              Text(
                                "Filters",
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 2),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        provider.changeView(!provider.isListView);
                      },
                      child: Container(
                        height: 70,
                        color: Colors.white,
                        child: provider.isListView
                            ? Image.asset(AppImages.gridIcon,
                                color: Colors.black)
                            : Image.asset(AppImages.listIcon,
                                color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
            provider.isListView
                ? ListTypeView(categories: provider.categories)
                : GridTypeView(categories: provider.categories),
          ],
        );
      }),
    );
  }
}

showOrderMenu(BuildContext context, RelativeRect position,
    ProductsProvider provider) async {
  final width = MediaQuery.sizeOf(context).width;
  await showMenu(
    context: context,
    position: position,
    constraints: BoxConstraints(minWidth: width),
    items: [
      PopupMenuItem(
        child: Text("Order by Popular"),
        onTap: () {
          provider.changeOrderType("Order by Popular");
        },
      ),
      PopupMenuItem(
        child: Text("Price:Low to High"),
        onTap: () {
          provider.changeOrderType("Price:Low to High");
        },
      ),
      PopupMenuItem(
        child: Text("Price:High to Low"),
        onTap: () {
          provider.changeOrderType("Price:High to Low");
        },
      ),
      PopupMenuItem(
        child: Text("Avg:Customer Review"),
        onTap: () {
          provider.changeOrderType("Avg:Customer Review");
        },
      ),
      PopupMenuItem(
        child: Text("Newest Arrivals"),
        onTap: () {
          provider.changeOrderType("Newest Arrivals");
        },
      ),
    ],
  );
}
