import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _info = "Informe seus dados";

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {      
      _info = "Informe seus dados";
      _formKey = GlobalKey<FormState>();
    });
  }

  void calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;

      var imc = weight / (height * height);

      if (imc < 18.6) {
        _info = "Abaixo do Peso - (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _info = "Peso Ideal - (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _info = "Levemente Acima do Peso - (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _info = "Obesidade Grau I - (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _info = "Obesidade Grau II - (${imc.toStringAsPrecision(4)})";
      } else if (imc > 40) {
        _info = "Obesidade Grau III - (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculado de IMC"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(
                  Icons.person_outline,
                  size: 150,
                  color: Colors.green,
                ),
                TextFormField(
                  controller: weightController,
                  validator: (value) {
                    if (value.isEmpty) return "Insira seu Peso!";
                    else return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso (Kg)",
                      labelStyle: TextStyle(color: Colors.green)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25),
                ),
                TextFormField(
                  controller: heightController,
                  validator: (value) {
                    if (value.isEmpty) return "Insira sua Altura!";
                    else return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Altura (cm)",
                      labelStyle: TextStyle(color: Colors.green)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Container(
                    height: 50,
                    child: RaisedButton(
                      child: Text(
                        "CALCULAR",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        if (_formKey.currentState.validate()) calculate();
                      },
                    ),
                  ),
                ),
                Text(
                  _info,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25),
                )
              ],
            ),
          ),
        ));
  }
}
