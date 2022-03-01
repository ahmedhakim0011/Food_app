import 'package:flutter/material.dart';
import 'package:food_app/config/config.dart';

class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey),
              ),
              margin: const EdgeInsets.all(7),
              height: 100,
              child: Image.asset('assets/herbal_medicine.png'),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        'Product Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: textColor),
                      ),
                      const Text(
                        '50\$/50 Gram',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                            style: TextStyle(color: textColor, fontSize: 14),
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 20,
                          color: primaryColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 32),
              child: Container(
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
