import 'package:flutter/material.dart';

class SeeAllSection extends StatelessWidget {
  SeeAllSection(
      {Key? key, required this.seetitleText, required this.seeAllText})
      : super(key: key);
  String seetitleText, seeAllText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${seetitleText}",
            style: TextStyle(
                fontSize: 18.0,
                backgroundColor: Color.fromARGB(255, 176, 211, 111),
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic),
          ),
          Text(
            "${seeAllText}",
            style: TextStyle(
                fontSize: 16.0,
                decoration: TextDecoration.underline,
                color: Color.fromARGB(255, 31, 30, 30),
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
