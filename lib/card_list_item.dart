import 'package:flutter/material.dart';

import 'constants.dart';

class CardListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function press;

  const CardListItem({
    Key key,
    this.title,
    this.subtitle,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(38.5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 10,
            color: Color(0xFFD3D3D3).withOpacity(.6),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          RichText(

            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title\n",
                  style: TextStyle(
                    fontSize: 16,
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: subtitle,
                  style: TextStyle(color: lightBlackColor, fontSize: 16),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
            onPressed: press,
          )
        ],
      ),
    );
  }
}
