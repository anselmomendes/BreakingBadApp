import 'package:flutter/material.dart';

class CustonTextField extends StatelessWidget {
  final double height;
  final double width;
  final Future func;
  final TextEditingController text;

  CustonTextField({Key key, this.height, this.width, this.text, this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.1,
      width: width - 60,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          controller: text,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              color: Colors.green,
              icon: Icon(Icons.search),
              onPressed: () {
                func;
              },
            ),
            prefixIcon: Icon(
              Icons.person,
              color: Colors.green,
            ),
            labelText: "Saul Goodman",
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
