// ignore_for_file: prefer_const_constructors, prefer_adjacent_string_concatenation, prefer_final_fields, unused_field, prefer_interpolation_to_compose_strings, unused_import, unused_element

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Bitcoin extends StatefulWidget {
  const Bitcoin({super.key});

  @override
  State<Bitcoin> createState() => _BitcoinState();
}

class _BitcoinState extends State<Bitcoin> {
  
  void _recuperarPreco() async{
    var url = Uri.parse("https://blockchain.info/ticker");

    http.Response response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      _preco = retorno["BRL"]["buy"].toString();
    });
  }

  String _preco = "0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset("Images/bitcoin.png"),
          SizedBox(
            height: 20,
          ),
          Text(
            "R\$ $_preco",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 76, 76, 76)),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              _recuperarPreco();
            },
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(const Color.fromARGB(255, 255, 148, 0) )),
            child: Text(
              "Atualizar",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )
        ]),
      ),
    );
  }
}
