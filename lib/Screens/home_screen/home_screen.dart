// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Screens/home_screen/seachItem/search_Item.dart';
import 'package:food_app/Screens/home_screen/side_drawer.dart';
import 'package:food_app/Screens/home_screen/single_product.dart';
import 'package:food_app/Screens/product_overview/product_overview.dart';
import 'package:food_app/config/config.dart';
import 'package:food_app/providers/productProvider/productProvider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductProvider? productProvider;
  @override
  void initState() {
    ProductProvider fetchHerbsProductProvider =
        Provider.of(context, listen: false);
    fetchHerbsProductProvider.fetchHerbsProductData();
    super.initState();

    ProductProvider fetchFreshProductProvider =
        Provider.of(context, listen: false);
    fetchFreshProductProvider.fetchFreshProductData();

    super.initState();

    ProductProvider fetchDryFruitsProductData =
        Provider.of(context, listen: false);
    fetchDryFruitsProductData.fetchDryFruitsProductData();
    super.initState();

    ProductProvider fetchWinterProductsProvider =
        Provider.of(context, listen: false);
    fetchWinterProductsProvider.fetchWinterProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);

    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          CircleAvatar(
            radius: 12,
            backgroundColor: primaryColor,
            child: IconButton(
              onPressed: () {
                Get.to(() => SearchItem(search: productProvider!.search));
              },
              icon: const Icon(
                Icons.search,
                size: 17,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: primaryColor,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shop,
                  size: 17,
                  color: Colors.black,
                ),
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
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                _buildHerbsProduct(),
                _buildFreshProduct(),
                _buildDryFruitsProduct(),
                _buildWinterProduct(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHerbsProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Herbs Seasoning'),
              GestureDetector(
                onTap: () => Get.to(SearchItem(
                  search: productProvider!.getHerbsProductList,
                )),
                child: const Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider!.getHerbsProductList.map((herbsProduct) {
              return SingleProdcut(
                onTap: () {
                  Get.to(() => ProductOverView(
                        productName: herbsProduct.productName,
                        productPrice: herbsProduct.productPrice,
                        productimage: herbsProduct.productImage,
                      ));
                },
                productImage: herbsProduct.productImage.toString(),
                productName: herbsProduct.productName,
                productPrice: herbsProduct.productPrice,
              );
            }).toList(),
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
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Fresh Products'),
              GestureDetector(
                onTap: () => Get.to(SearchItem(
                  search: productProvider!.getfreshProductList,
                )),
                child: const Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider!.getfreshProductList.map((freshProducts) {
              return SingleProdcut(
                onTap: () {
                  Get.to(() => ProductOverView(
                        productName: freshProducts.productName,
                        productPrice: freshProducts.productPrice,
                        productimage: freshProducts.productImage,
                      ));
                },
                productImage: freshProducts.productImage.toString(),
                productName: freshProducts.productName,
                productPrice: freshProducts.productPrice,
              );
            }).toList(),
          ),
        )
      ],
    );
  }

  Widget _buildDryFruitsProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dry Fruits'),
              GestureDetector(
                onTap: () => Get.to(SearchItem(
                  search: productProvider!.dryFruitsProductList,
                )),
                child: const Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider!.getDryFruitsProductList
                .map((dryFruitsProduct) {
              return SingleProdcut(
                onTap: () {
                  Get.to(() => ProductOverView(
                        productName: dryFruitsProduct.productName,
                        productPrice: dryFruitsProduct.productPrice,
                        productimage: dryFruitsProduct.productImage,
                      ));
                },
                productImage: dryFruitsProduct.productImage.toString(),
                productName: dryFruitsProduct.productName,
                productPrice: dryFruitsProduct.productPrice,
              );
            }).toList(),
          ),
        )
      ],
    );
  }

  Widget _buildWinterProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Winter Products'),
              GestureDetector(
                onTap: () => Get.to(SearchItem(
                  search: productProvider!.winterProductList,
                )),
                child: const Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                productProvider!.getWinterProductList.map((winterProducts) {
              return SingleProdcut(
                onTap: () {
                  Get.to(() => ProductOverView(
                        productName: winterProducts.productName,
                        productPrice: winterProducts.productPrice,
                        productimage: winterProducts.productImage,
                      ));
                },
                productImage: winterProducts.productImage.toString(),
                productName: winterProducts.productName,
                productPrice: winterProducts.productPrice,
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
