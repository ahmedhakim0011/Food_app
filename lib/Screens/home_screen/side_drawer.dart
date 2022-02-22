import 'package:flutter/material.dart';
import 'package:food_app/config/config.dart';

class SideDrawer extends StatelessWidget {
  Widget listTile({
    IconData? icon,
    String? title,
    Color? color,
  }) {
    return ListTile(
      onTap: () {},
      iconColor: color,
      textColor: color,
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 100,
        color: primaryColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 43,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://scontent.fkhi11-1.fna.fbcdn.net/v/t1.6435-9/91488272_212582280059244_8653493102889140224_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeF566dOt5lI33z3Wg5foCKDDuhEupUnXaIO6ES6lSddogH5KQN2vkDFMLfEWrymgujy6JMNjE0lbJw3CSkf8eUk&_nc_ohc=Wc1lT6_UgecAX-gD2Tf&_nc_ht=scontent.fkhi11-1.fna&oh=00_AT-mu0lwpux3gi3EsI-RoCCSRsOP-uqD8fBeQ-hQiqt3xA&oe=62385D14"),
                      radius: 40,
                      backgroundColor: Colors.yellow,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Welcome Guest',
                          style: TextStyle(color: Colors.black)),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        height: 30,
                        child: OutlineButton(
                          onPressed: () {},
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.black),
                          ),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            listTile(
              icon: Icons.home,
              title: 'Home',
              color: Colors.black,
            ),
            listTile(
              icon: Icons.shop_outlined,
              title: 'Review Cart',
              color: Colors.black,
            ),
            listTile(
              icon: Icons.person_outline,
              title: 'My Profile',
              color: Colors.black,
            ),
            listTile(
              icon: Icons.notifications_outlined,
              title: 'Notification',
              color: Colors.black,
            ),
            listTile(
              icon: Icons.star_outline,
              title: 'Rating & Review',
              color: Colors.black,
            ),
            listTile(
              icon: Icons.favorite_outline,
              title: 'WishList',
              color: Colors.black,
            ),
            listTile(
              icon: Icons.copy_outlined,
              title: 'Raise a Complaint',
              color: Colors.black,
            ),
            listTile(
              icon: Icons.format_quote_outlined,
              title: 'FAQs',
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Contact Support',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: const [
                        Text(
                          'Call us:',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '+94999598595',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: const [
                        Text(
                          'Mail us:',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'ahmdahmed29@gmail.com',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
