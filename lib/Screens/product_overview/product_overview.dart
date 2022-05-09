import 'package:flutter/material.dart';
import 'package:food_app/config/config.dart';

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class ProductOverView extends StatefulWidget {
  final String? productName;
  final String? productimage;
  final int? productPrice;

  const ProductOverView(
      {this.productName, this.productimage, this.productPrice});

  @override
  State<ProductOverView> createState() => _ProductOverViewState();
}

class _ProductOverViewState extends State<ProductOverView> {
  BestTutorSite _site = BestTutorSite.javatpoint;

  Widget bottomNavigationBar({
    Color? iconColor,
    Color? backGroundColor,
    Color? color,
    String? title,
    IconData? iconData,
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: backGroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 17,
                color: iconColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                title.toString(),
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigationBar(
              onTap: () => {},
              backGroundColor: textColor,
              color: Colors.white70,
              iconColor: Colors.grey,
              title: 'Add to WishList',
              iconData: Icons.favorite_outline),
          const SizedBox(
            width: 5,
          ),
          bottomNavigationBar(
            onTap: () => {},
            backGroundColor: primaryColor,
            color: textColor,
            iconColor: textColor,
            title: 'Add to Cart',
            iconData: Icons.shop_2_outlined,
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Product Overview',
          style: TextStyle(color: textColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      widget.productName.toString(),
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '\$${widget.productPrice}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: primaryColor,
                    ),
                    height: 250,
                    padding: const EdgeInsets.all(40),
                    child: Image.network(widget.productimage.toString()),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    width: double.infinity,
                    child: const Text(
                      'Availbale Options ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green[700],
                            ),
                            Radio(
                              activeColor: Colors.green[700],
                              value: BestTutorSite.javatpoint,
                              groupValue: _site,
                              onChanged: (BestTutorSite? value) {
                                setState(() {
                                  _site = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        Text('\$${widget.productPrice}'),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 17,
                                color: primaryColor,
                              ),
                              Text(
                                'ADD',
                                style: TextStyle(color: primaryColor),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30)),
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
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'About this Product',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'In marketing, a product is an object, or system, or service made available for consumer use as of the consumer demand; it is anything that can be offered to a market to satisfy the desire or need of a',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
