import 'package:flutter/material.dart';
import 'package:food_app/Screens/home_screen/side_drawer.dart';
import 'package:food_app/config/config.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: Text(
          'My Profile',
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      ),
      drawer: SideDrawer(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: primaryColor,
              ),
              Container(
                height: 592,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: scaffoldBackgroundColor,
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.circular(50))),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 80,
                          width: 250,
                          padding: const EdgeInsets.only(right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ahmed Hakim Ali',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: textColor,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('ahmdahmed25@gmail.com')
                                ],
                              ),
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor: primaryColor,
                                  child: CircleAvatar(
                                      radius: 12,
                                      backgroundColor: scaffoldBackgroundColor,
                                      child: Icon(
                                        Icons.edit,
                                        color: primaryColor,
                                      ))),
                            ],
                          ),
                        ),
                      ],
                    ),
                    lisTile(
                      icon: Icons.shop_outlined,
                      title: 'My Orders',
                    ),
                    lisTile(
                      icon: Icons.location_on_outlined,
                      title: 'My Delivery Address',
                    ),
                    lisTile(
                      icon: Icons.person_outlined,
                      title: 'Refer a Friend',
                    ),
                    lisTile(
                      icon: Icons.file_copy_outlined,
                      title: 'Terms & Conditions',
                    ),
                    lisTile(
                      icon: Icons.policy_outlined,
                      title: 'Privacy Policy',
                    ),
                    lisTile(
                      icon: Icons.addchart_outlined,
                      title: 'About',
                    ),
                    lisTile(
                      icon: Icons.exit_to_app_outlined,
                      title: 'Log Out',
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: scaffoldBackgroundColor,
              child: CircleAvatar(
                backgroundImage: const NetworkImage(
                    "https://scontent.fkhi11-1.fna.fbcdn.net/v/t1.6435-9/91488272_212582280059244_8653493102889140224_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeF566dOt5lI33z3Wg5foCKDDuhEupUnXaIO6ES6lSddogH5KQN2vkDFMLfEWrymgujy6JMNjE0lbJw3CSkf8eUk&_nc_ohc=Wc1lT6_UgecAX-gD2Tf&_nc_ht=scontent.fkhi11-1.fna&oh=00_AT-mu0lwpux3gi3EsI-RoCCSRsOP-uqD8fBeQ-hQiqt3xA&oe=62385D14"),
                backgroundColor: primaryColor,
                radius: 45,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget lisTile({
    VoidCallback? onTap,
    IconData? icon,
    String? title,
    Color? color,
  }) {
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title!),
          trailing: const Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }
}
