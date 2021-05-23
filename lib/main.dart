import 'package:flutter/material.dart';
import './questao.dart';
import 'resposta.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      {
        'texto':'Qual é a sua cor favorita?',
        'respostas': ['Preto','Vermelho','Verde','Branco'],         
      },
      {
        'texto':'Qual é o seu animal favorito?',
         'respostas': ['Coelho','Cobra','Elefante','Leão'],
      },
      {
        'texto':'Qual é o seu instrutor favorito ?',
         'respostas': ['Maria','João','Pedro','Gabriel'],
      },
    ];

    
      List<Widget> respostas = [];
      for(String textoResp in perguntas[_perguntaSelecionada]['respostas']){
        respostas.add(Resposta(textoResp, _responder));
      }

    

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto']),
            ...respostas,
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}