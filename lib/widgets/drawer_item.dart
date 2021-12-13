import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final name = "Alex";
    final email = 'alex@gmail.com';
    final urlImage =
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80';
    return Drawer(
      child: Material(
        color: Colors.deepOrange,
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
            ),
            const SizedBox(
              height: 30,
            ),
            buildMenuItem(
              text: 'Home',
              icon: FontAwesomeIcons.home,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
              text: 'Explore',
              icon: Icons.explore,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
              text: 'Favourites',
              icon: Icons.favorite_border,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
              text: 'Profile',
              icon: FontAwesomeIcons.userAlt,
              onClicked: () => selectedItem(context, 3),
            ),
            const SizedBox(
              height: 24,
            ),
            Divider(
              color: Colors.white70,
            ),
            const SizedBox(
              height: 24,
            ),
            buildMenuItem(
              text: 'Settings',
              icon: Icons.settings,
              onClicked: () => selectedItem(context, 4),
            ),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
              text: 'Logout',
              icon: Icons.logout,
              onClicked: () => selectedItem(context, 5),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      onTap: onClicked,
      hoverColor: hoverColor,
    );
  }

  Widget buildHeader({
    required String name,
    required String email,
    required String urlImage,
  }) =>
      InkWell(
        child: Container(
          padding: padding.add(
            EdgeInsets.symmetric(vertical: 40),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(urlImage),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Spacer(),
              CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.black38,
                  child: Icon(
                    Icons.add_comment_outlined,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      );

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
      // navigate option
      // Navigator.of(context).pushNamed(Routes.payment);
    }
  }
}
