import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _cont = 0;
  var _desc = "Pode Entrar!";

  void calcular(int number) {
    setState(() {
      _cont += number;
      _desc = setDescription(_cont);
    });
  }  

  String setDescription(int number){
    if(number >= 10)
      return "Lotado!";
    else if (number < 10 && number >= 0)
      return "Pode Entrar!";
    else 
      return "Mundo Invertido ?!?";
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: " + _cont.toString(),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    onPressed: () { calcular(-1); },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    onPressed: () { calcular(1); },
                  ),
                ),
              ],
            ),
            Text(
              _desc,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30),
            ),
          ],
        ),
      ],
    );
  }
}