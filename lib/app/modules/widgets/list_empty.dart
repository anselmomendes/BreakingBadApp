import 'package:flutter/material.dart';

class ListEmpty extends StatelessWidget {
  final double height;
  final double width;
  final Future func;

  const ListEmpty({
    Key key,
    this.height,
    this.width,
    this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.7,
      width: width - 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width - 120,
            height: height * 0.2,
            child: Image.asset('assets/images/02.png'),
          ),
          SizedBox(
            height: 25,
          ),
          Text('NENHUM ITEM FOI ENCONTRADO!'),
          SizedBox(
            height: 25,
          ),
          FlatButton(
            color: Colors.green,
            onPressed: () async {
              await func;
            },
            child: Container(
              height: height * 0.05,
              width: width - 160,
              child: Center(
                child: Text(
                  'TENTAR NOVAMENTE?',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
