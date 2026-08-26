import 'package:e_commerce_app/providers/product_provider.dart';
import 'package:e_commerce_app/services/assets_manager.dart';
import 'package:e_commerce_app/widgests/products/product_widget.dart';
import 'package:e_commerce_app/widgests/title_text.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_height_list_view/dynamic_height_view.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTextController;

  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductProvider>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetsManager.shoppingCart),
          ),
          title: TitleTextWidget(label: "Search Products", fontSize: 20),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 15),
              TextField(
                controller: searchTextController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // setState(() {
                      FocusScope.of(context).unfocus();
                      searchTextController.clear();
                      // });
                    },
                    child: Icon(Icons.clear, color: Colors.red),
                  ),
                ),
                onChanged: (value) {
                  // log("message");
                },
                onSubmitted: (value) {
                  // log(searchTextController.text);
                },
              ),
              SizedBox(height: 15),
              Expanded(
                child: DynamicHeightGridView(
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  itemCount: productsProvider.getProducts.length,
                  crossAxisCount: 2,
                  builder: ((context, index) {
                    return ProductWidget(
                      productID:
                          productsProvider.getProducts[index].productID,
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
