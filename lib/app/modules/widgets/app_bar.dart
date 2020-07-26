import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustonAppBar extends StatelessWidget {
  final String title;
  final double height;
  final double width;

  const CustonAppBar({
    Key key,
    this.title,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.2,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 30.0),
                onPressed: () {
                  Modular.to.pop();
                }),
          ]),
          Text(
            title.toUpperCase(),
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
