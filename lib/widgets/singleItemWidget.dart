import 'package:flutter/material.dart';
import 'package:food_app/config/config.dart';
import 'package:get/get.dart';

class SingleItemWidget extends StatelessWidget {
  bool? isBool = false;
  String? productImage;
  String? productName;
  int? productPrice;
  VoidCallback? onTap;

  SingleItemWidget({
    Key? key,
    this.isBool,
    this.productImage,
    this.productName,
    this.productPrice,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    margin: const EdgeInsets.all(7),
                    height: 100,
                    child: Image.network(productImage!),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            productName!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: textColor),
                          ),
                          Text(
                            '$productPrice\$',
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      isBool == false
                          ? Container(
                              margin: const EdgeInsets.only(right: 15),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: textColor),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '50 Gram',
                                      style: TextStyle(
                                          color: textColor, fontSize: 14),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    size: 20,
                                    color: primaryColor,
                                  )
                                ],
                              ),
                            )
                          : Text(
                              '50 Gram',
                              style: TextStyle(color: textColor, fontSize: 14),
                            ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  padding: isBool == false
                      ? const EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : const EdgeInsets.only(left: 15, right: 15),
                  child: isBool == false
                      ? Container(
                          height: 25,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: textColor),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 20,
                                color: primaryColor,
                              ),
                              Text(
                                'ADD',
                                style: TextStyle(color: primaryColor),
                              ),
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            const Icon(
                              Icons.delete,
                              size: 30,
                              color: Colors.black54,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 25,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: textColor),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 20,
                                    color: primaryColor,
                                  ),
                                  Text(
                                    'ADD',
                                    style: TextStyle(color: primaryColor),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
        isBool == false
            ? Container()
            : const Divider(
                height: 1,
                color: Colors.black54,
              )
      ],
    );
  }
}
