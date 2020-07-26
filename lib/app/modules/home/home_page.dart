import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Breaking Bad"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[700],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 50),
            Image.asset(
              'assets/images/01.png',
              fit: BoxFit.fitHeight,
              height: 60,
            ),
          ],
        ),
      ),
      body: Container(
        color: Color.fromRGBO(218, 162, 42, 1),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            GestureDetector(
              child: Column(
                children: [
                  Container(
                    width: screenWidth * 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.teal[800],
                    ),
                    child: Center(
                      child: Text('Lista de personagens',
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    height: screenWidth * 0.35,
                    width: screenWidth * 40,
                    padding: const EdgeInsets.all(8),
                    child:
                        Image.asset('assets/images/02.jpg', fit: BoxFit.cover),
                    color: Colors.teal[200],
                  ),
                ],
              ),
              onTap: () {
                Modular.to.pushNamed('/characters');
              },
            ),
            GestureDetector(
              child: Column(
                children: [
                  Container(
                    width: screenWidth * 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.teal[800],
                    ),
                    child: Center(
                      child: Text('Frases Antagônicas',
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    height: screenWidth * 0.35,
                    width: screenWidth * 40,
                    padding: const EdgeInsets.all(8),
                    child:
                        Image.asset('assets/images/03.jpg', fit: BoxFit.cover),
                    color: Colors.teal[200],
                  ),
                ],
              ),
              onTap: () {
                Modular.to.pushNamed('/quotes');
              },
            ),
            GestureDetector(
              child: Column(
                children: [
                  Container(
                    width: screenWidth * 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.teal[800],
                    ),
                    child: Center(
                      child: Text('Lista de Episodios',
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    height: screenWidth * 0.35,
                    width: screenWidth * 40,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset('assets/images/04.jpg',
                        fit: BoxFit.fitWidth),
                    color: Colors.teal[200],
                  ),
                ],
              ),
              onTap: () {
                Modular.to.pushNamed('/episodes');
              },
            ),
            GestureDetector(
              child: Column(
                children: [
                  Container(
                    width: screenWidth * 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.teal[800],
                    ),
                    child: Center(
                      child: Text('Mortes',
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    height: screenWidth * 0.35,
                    width: screenWidth * 40,
                    padding: const EdgeInsets.all(8),
                    child:
                        Image.asset('assets/images/05.jpg', fit: BoxFit.cover),
                    color: Colors.teal[200],
                  ),
                ],
              ),
              onTap: () {
                Modular.to.pushNamed('/deaths');
              },
            ),
            Column(
              children: [
                Container(
                  width: screenWidth * 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.teal[800],
                  ),
                  child: Center(
                    child: Text('Avaliação',
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  height: screenWidth * 0.35,
                  width: screenWidth * 40,
                  padding: const EdgeInsets.all(8),
                  child: Image.asset('assets/images/06.png', fit: BoxFit.cover),
                  color: Colors.teal[200],
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: screenWidth * 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.teal[800],
                  ),
                  child: Center(
                    child: Text('Sobre',
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  height: screenWidth * 0.35,
                  width: screenWidth * 40,
                  padding: const EdgeInsets.all(8),
                  child: Image.asset('assets/images/07.jpg', fit: BoxFit.cover),
                  color: Colors.teal[200],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
