import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class ChooseMethod extends StatelessWidget {
  final String firstOptions;
  final String secondOptions;
  final String title;
  final int ratioValue;
  final Function setSelectedValue;
  final bool _isShowIcon;
  ChooseMethod(
    this.firstOptions,
    this.secondOptions,
    this.title,
    this.ratioValue,
    this.setSelectedValue,
    this._isShowIcon,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          _isShowIcon
                              ? CustomIcon(Assets.iconCreditCard, Colors.orange)
                              : Container(),
                          Text(
                            firstOptions,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      leading: Radio(
                        value: 1,
                        groupValue: ratioValue,
                        onChanged: (val) {
                          setSelectedValue(val);
                        },
                        activeColor: Colors.deepOrange,
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Row(
                        children: [
                          _isShowIcon
                              ? CustomIcon(
                                  Assets.iconDashBank,
                                  Colors.pink[300],
                                )
                              : Container(),
                          Text(
                            secondOptions,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      leading: Radio(
                        value: 2,
                        groupValue: ratioValue,
                        onChanged: (val) {
                          setSelectedValue(val);
                        },
                        activeColor: Colors.deepOrange,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
