import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pony_collection/providers/search_provider.dart';
import 'package:pony_collection/widgets/padding_widget.dart';
import 'package:provider/provider.dart';
import '../../helper/app_images.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * .08),
        child: AppBar(
          leading: GestureDetector(
              onTap: () {
                GoRouter.of(context).pop();
                searchProvider.searchList.clear();
              },
              child: Icon(
                Icons.navigate_before,
                size: 45,
                color: Colors.grey,
              )),
          leadingWidth: 30,
          title: Row(
            children: [
              Expanded(
                  child: TextFormField(
                autofocus: true,
                controller: _controller,
                onChanged: (text) {
                  searchProvider.onChangeText(text);
                },
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search..",
                    hintStyle: TextStyle(fontSize: 20)),
              ))
            ],
          ),
          actions: [
            PaddingWidget(
              child: GestureDetector(
                onTap: () {
                  _controller.clear();
                  searchProvider.clearData();
                },
                child: Icon(Icons.clear, size: 38, color: Colors.grey),
              ),
            )
          ],
        ),
      ),
      body: Consumer<SearchProvider>(builder: (context, provider, child) {
        return provider.searchList.isEmpty
            ? Center(child: Image.asset(AppImages.noResult))
            : ListView.builder(
                itemCount: provider.searchList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  String item = provider.searchList[index];
                  return InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        ListTile(
                          leading: SizedBox(),
                          tileColor: Colors.white,
                          title: Text(
                            item,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Divider(height: 0)
                      ],
                    ),
                  );
                });
      }),
    );
  }
}
