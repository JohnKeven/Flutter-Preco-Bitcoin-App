// ignore_for_file: use_key_in_widget_constructors, file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  String _resultado = "0";

  void _recuperarPreco() async {
    var url = Uri.parse("https://blockchain.info/ticker");
    http.Response response;
    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      _resultado = retorno["BRL"]["buy"].toString();
    });
  }
  /*
  String  _resultado = "Resultado";
  TextEditingController _controllerCep = TextEditingController();
  _recuperarCep() async {
    var cepDigitado = _controllerCep.text;
    var url = Uri.parse("https://viacep.com.br/ws/$cepDigitado/json/");
    http.Response response;
    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];
    //print("resposta: " + response.statusCode.toString());
    setState(() {
      _resultado = "$localidade, $bairro, $logradouro, $complemento";
    });

    print(
        "Logradouro: $logradouro , Complemento: $complemento , Bairro: $bairro , Localidade: $localidade");
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Preço do Bitcoin")),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/bitcoin.png"),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  "R\$: $_resultado",
                  style: const TextStyle(
                    fontSize: 35,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.white,
                  onSurface: Colors.teal,
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                ),
                onPressed: _recuperarPreco,
                child: const Text(
                  "Atualizar",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
