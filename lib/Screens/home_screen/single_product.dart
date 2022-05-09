import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_app/config/config.dart';

class SingleProdcut extends StatefulWidget {
  final String? productImage;
  final String? productName;
  final int? productPrice;

  final VoidCallback onTap;

  SingleProdcut(
      {Key? key,
      this.productImage,
      this.productName,
      required this.onTap,
      this.productPrice});

  @override
  State<SingleProdcut> createState() => _SingleProdcutState();
}

class _SingleProdcutState extends State<SingleProdcut> {
  String dropdownvalue = '50 Gram';

  // List of items in our dropdown menu
  var items = [
    '50 Gram',
    '100 Gram',
    '250 Gram',
    '500 Gram',
    '1000 Gram',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 230,
            width: 180,
            decoration: BoxDecoration(
                color: const Color(0xffd9dad9),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    height: 150,
                    padding: const EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(
                      widget.productImage.toString(),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;

                        return const Center(child: Text('Loading...'));
                        // You can use LinearProgressIndicator or CircularProgressIndicator instead
                      },
                    ),

                    // Image.network(
                    //   productImage.toString()),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productName.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${widget.productPrice}\$/50 Gram',
                            style: const TextStyle(color: Colors.grey),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.only(left: 5),
                                  height: 30,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Expanded(
                                    child: Center(
                                      child: DropdownButton(
                                        // Initial Value
                                        value: dropdownvalue,

                                        // Down Arrow Icon
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: primaryColor,
                                          size: 12,
                                        ),

                                        // Array list of items
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(
                                              items,
                                              style:
                                                  const TextStyle(fontSize: 12),
                                            ),
                                          );
                                        }).toList(),
                                        // After selecting the desired option,it will
                                        // change button value to selected value
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownvalue = newValue!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Container(
                                  height: 30,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Icon(
                                        Icons.remove,
                                        size: 10,
                                        color: Color(0xffd0b84c),
                                      ),
                                      Text(
                                        '1',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffd0b84c)),
                                      ),
                                      Icon(
                                        Icons.add,
                                        size: 10,
                                        color: Color(0xffd0b84c),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
