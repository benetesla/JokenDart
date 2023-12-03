// ignore_for_file: sort_child_properties_last, deprecated_member_use

import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  String escolhaUsuario = '';
  String escolhaApp = '';
  String resultado = '';

  void escolhaUsuarioFuncao(String escolha) {
    setState(() {
      escolhaUsuario = escolha;
      escolhaApp = escolhaAppFuncao();
      resultado = calcularResultado();
    });
  }

  String escolhaAppFuncao() {
    final opcoes = ['pedra', 'papel', 'tesoura'];
    final random = Random();
    return opcoes[random.nextInt(opcoes.length)];
  }

  String calcularResultado() {
    if (escolhaUsuario == escolhaApp) {
      return 'Empate!';
    } else if ((escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhaUsuario == 'papel' && escolhaApp == 'pedra') ||
        (escolhaUsuario == 'tesoura' && escolhaApp == 'papel')) {
      return 'Você venceu!';
    } else {
      return 'Você perdeu!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Jokenpo')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do App',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                escolhaApp = escolhaAppFuncao();
                resultado = calcularResultado();
              });
            },
            child: Image.asset(
              'image/$escolhaApp.png',
              height: 95,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha uma opção abaixo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => escolhaUsuarioFuncao('pedra'),
                  child: Image.asset(
                    'image/pedra.png',
                    height: 95,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => escolhaUsuarioFuncao('papel'),
                  child: Image.asset('image/papel.png', height: 95),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => escolhaUsuarioFuncao('tesoura'),
                  child: Image.asset(
                    'image/tesoura.png',
                    height: 95,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              resultado,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
