import 'package:flutter/material.dart';
import 'package:food_app/Screens/home_screen/seachItem/searchItemWidget.dart';
import 'package:food_app/config/config.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          const SearchItemWidget(),
          const SearchItemWidget(),
          const SearchItemWidget(),
          const SearchItemWidget(),
          const SearchItemWidget(),
          const SearchItemWidget(),
        ],
      ),
    );
  }
}
