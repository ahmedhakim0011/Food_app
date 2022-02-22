// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Screens/home_screen/side_drawer.dart';
import 'package:food_app/Screens/home_screen/single_product.dart';
import 'package:food_app/Screens/product_overview/product_overview.dart';
import 'package:food_app/config/config.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          CircleAvatar(
            radius: 12,
            backgroundColor: primaryColor,
            child: const Icon(
              Icons.search,
              size: 17,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: primaryColor,
              child: const Icon(
                Icons.shop,
                size: 17,
                color: Colors.black,
              ),
            ),
          ),
        ],
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            Container(
              height: 160,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://img.freepik.com/free-photo/healthy-vegetables-wooden-table_1150-38014.jpg?size=626&ext=jpg')),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 130, bottom: 10),
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Vegi',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    shadows: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          offset: Offset(3, 3),
                                          color: Colors.green),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '30% Off',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[100],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: Text(
                              'on all vegetables and products',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  _buildHerbsProduct(context),
                  _buildFreshProduct(),
                  _buildFreshProduct(),
                  _buildHerbsProduct(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHerbsProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text('Herbs Seasoning'),
              const Text(
                'view all',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingleProdcut(
                onTap: () {
                  Get.to(() => const ProductOverView(
                        productName: 'Chines Herbs',
                        productimage: 'assets/chines_herbs.png',
                      ));
                },
                productImage: 'assets/chines_herbs.png',
                productName: 'Chines Herbs',
              ),
              SingleProdcut(
                onTap: () {
                  Get.to(() => const ProductOverView(
                        productName: 'Herbal Medicine',
                        productimage: 'assets/herbal_medicine.png',
                      ));
                },
                productImage: 'assets/herbal_medicine.png',
                productName: 'Herbal Medicine',
              ),
              SingleProdcut(
                onTap: () {
                  Get.to(() => const ProductOverView(
                        productName: 'Herbs and Spices',
                        productimage: 'assets/spice_herb.png',
                      ));
                },
                productImage: 'assets/spice_herb.png',
                productName: 'Herbs and Spices',
              ),
              SingleProdcut(
                onTap: () {
                  Get.to(() => const ProductOverView(
                        productName: 'Ayuveda Medicine',
                        productimage: 'assets/ayuveda_medicine.png',
                      ));
                },
                productImage: 'assets/ayuveda_medicine.png',
                productName: 'Ayuveda Medicine',
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildFreshProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Fresh Products'),
              Text(
                'view all',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingleProdcut(
                onTap: () {},
                productImage: 'assets/fresh_fruit_basket.png',
                productName: 'Fresh Fruit Basket',
              ),
              SingleProdcut(
                onTap: () {},
                productImage: 'assets/green_lemon.png',
                productName: 'Green Lemon',
              ),
              SingleProdcut(
                onTap: () {},
                productImage: 'assets/heartoffruit-.png',
                productName: 'Heart Of Fruit',
              ),
              SingleProdcut(
                onTap: () {},
                productImage: 'assets/fresh_fruit_basket.png',
                productName: 'Fresh Fruit Basket',
              ),
            ],
          ),
        )
      ],
    );
  }
}
