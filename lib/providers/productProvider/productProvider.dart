// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/model/productModel.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> herbsProductList = [];
  List<ProductModel> freshProductList = [];
  List<ProductModel> dryFruitsProductList = [];
  List<ProductModel> winterProductList = [];

  ProductModel? productModel;

  List<ProductModel> search = [];

  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productPrice: element.get('productPrice'),
      productName: element.get('productName'),
      productImage: element.get('productImage').toString(),
    );
    search.add(productModel!);
  }

  fetchHerbsProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot herbsProductCollection =
        await FirebaseFirestore.instance.collection("HerbsProduct").get();

    // ignore: avoid_function_literals_in_foreach_calls
    herbsProductCollection.docs.forEach(
      (element) {
        productModels(element);
        newList.add(productModel!);
      },
    );
    herbsProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getHerbsProductList {
    return herbsProductList;
  }

  fetchFreshProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot freshProductCollection =
        await FirebaseFirestore.instance.collection("FreshProduct").get();

    freshProductCollection.docs.forEach(
      (element) {
        productModels(element);

        newList.add(productModel!);
      },
    );
    freshProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getfreshProductList {
    return freshProductList;
  }

  fetchDryFruitsProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot dryFruitsProductCollection =
        await FirebaseFirestore.instance.collection("DryFruits").get();

    dryFruitsProductCollection.docs.forEach(
      (element) {
        productModels(element);

        newList.add(productModel!);
      },
    );
    dryFruitsProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getDryFruitsProductList {
    return dryFruitsProductList;
  }

  fetchWinterProducts() async {
    List<ProductModel> newList = [];

    QuerySnapshot winterProductsColllection =
        await FirebaseFirestore.instance.collection('WinterProducts').get();

    winterProductsColllection.docs.forEach((element) {
      productModels(element);

      newList.add(productModel!);
    });
    winterProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getWinterProductList {
    return winterProductList;
  }

  //search return
  List<ProductModel> get getAllProductsBySearch {
    return search;
  }
}
