import 'package:flutter/material.dart';
import 'package:food_app/config/config.dart';
import 'package:food_app/widgets/singleItemWidget.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: const Text('Total amount'),
        subtitle: Text(
          '\$ 170.00',
          style: TextStyle(color: Colors.green[900]),
        ),
        trailing: SizedBox(
          width: 160,
          child: MaterialButton(
            onPressed: () {},
            child: const Text('submit'),
            color: primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Review Cart',
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          SingleItemWidget(
            onTap: () {},
            isBool: true,
            productImage: 'assets/chines_herbs.png',
            productName: 'Chines Herbs',
          ),
          SingleItemWidget(
            isBool: true,
            onTap: () {},
            productImage: 'assets/chines_herbs.png',
            productName: 'Chines Herbs',
          ),
          SingleItemWidget(
            onTap: () {},
            isBool: true,
            productImage: 'assets/herbal_medicine.png',
            productName: 'Herbal Medicine',
          ),
          SingleItemWidget(
            isBool: true,
            onTap: () {},
            productImage: 'assets/ayuveda_medicine.png',
            productName: 'Ayuveda Medicine',
          ),
        ],
      ),
    );
  }
}
