import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
      {
        'texto':'Qual é a sua cor favorita?',
        'respostas': [
          {'text':  'Preto', 'pontuacao': 10},
          {'text':  'Vermelho', 'pontuacao': 5},
          {'text':  'Verde', 'pontuacao': 3},
          {'text':  'Branco', 'pontuacao': 1},
          ],         
      },
      {
        'texto':'Qual é o seu animal favorito?',
         'respostas': [
           {'text':'Coelho', 'pontuacao': 10},
           {'text':'Cobra', 'pontuacao': 2},
           {'text':'Elefante', 'pontuacao': 6},
           {'text':'Leoa', 'pontuacao': 4},
           ],
      },
      {
        'texto':'Qual é o seu instrutor favorito ?',
         'respostas': [
           {'text':'Maria', 'pontuacao': 10},
           {'text':'João', 'pontuacao': 4},
           {'text':'Pedro', 'pontuacao': 2},
           {'text':'Gabriel', 'pontuacao': 6},
           ],
      },
    ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }


  void _responder(int pontuacao) {

    if(temPerguntaSelecionada){
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal +=pontuacao;
    });
    }
  }
  
  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas',
          ),
        ),
        body: temPerguntaSelecionada ? 
        Questionario(perguntas: _perguntas, 
        perguntaSelecionada: _perguntaSelecionada, 
        quandoresponder: _responder)
        : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}