import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/widgets/profile_card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> title = [
      "Orders",
      'Pending reviews',
      'Faq',
      'Help',
    ];
    final List<Widget> profileList = title
        .map((e) => Container(
              margin: EdgeInsets.only(top: 5),
              width: double.infinity,
              child: (Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        e,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Icon(Icons.arrow_right_rounded, size: 25),
                    ],
                  ),
                ),
              )),
            ))
        .toList();

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
        width: double.infinity,
        height: double.infinity,
        color: AppColors.appColor['appBackground'],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'My Profile',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                ),
              ),
              ProfileCard(),
              Column(
                children: profileList,
              )
            ],
          ),
        ));
  }
}
