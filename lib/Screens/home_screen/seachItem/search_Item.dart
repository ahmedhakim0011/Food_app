import 'package:flutter/material.dart';
import 'package:food_app/model/productModel.dart';
import 'package:food_app/widgets/singleItemWidget.dart';
import 'package:food_app/config/config.dart';

class SearchItem extends StatefulWidget {
  final List<ProductModel>? search;
  SearchItem({this.search});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  String query = "";
  searchItem(String query) {
    List<ProductModel> searchFood = widget.search!.where((element) {
      return element.productName!.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel>? _searchItem = searchItem(query);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Search Item',
          style: TextStyle(color: textColor),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.menu_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text(
              'Items',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Container(
            height: 52,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                print(value);
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: const Color(0xffc2c2c2),
                  filled: true,
                  suffixIcon: const Icon(
                    Icons.search,
                  ),
                  hintText: 'Seach an Item'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: _searchItem!.map((data) {
              return SingleItemWidget(
                isBool: false,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
