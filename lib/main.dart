import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';
main() {
  runApp(_PerguntaApp());
}
 class _PerguntaAppState extends State<_PerguntaApp> {
   var _perguntaSelecionada = 0;
   var _pontuacaoTotal = 0;
   final _perguntas = const [{
     'texto': 'Qual é a sua cor favorita?',
     'respostas': [
       {'texto': 'Preto','pontuacao':10},
       {'texto': 'Vermelho','pontuacao':5},
       {'texto': 'Verde','pontuacao':3},
       {'texto': 'Branco','pontuacao':1},
     ],
   }, {
     'texto': 'Qual é o seu animal favorito?',
     'respostas': [
       {'texto': 'Coelho','pontuacao':10},
       {'texto': 'Cobra','pontuacao': 5},
       {'texto': 'Elefante','pontuacao': 3} ,
       {'texto': 'Leão','pontuacao': 1 }
     ]
   }, {
     'texto': 'Qual é o seu instrutor favorito?',
     'respostas': [
       {'texto': 'Maria','pontuacao': 10},
       {'texto': 'Leo','pontuacao': 5},
       {'texto': 'João','pontuacao': 3},
       {'texto': 'Pedro','pontuacao': 1}
     ]
   }];
   void _responder(int pontuacao){
     if(temPerguntaSelecionada){
       // Esse metodo muda o estado da tela
       setState(() {
         _perguntaSelecionada++;
         _pontuacaoTotal += pontuacao;
       });
     }
     print(_pontuacaoTotal);
   }

   bool get temPerguntaSelecionada {
     return _perguntaSelecionada < _perguntas.length;
   }
   @override
   Widget build(BuildContext context) {
     List<Map<String, Object>> respostas = temPerguntaSelecionada ? _perguntas[_perguntaSelecionada]['respostas'] as List<Map<String, Object>> : [];
     return MaterialApp(
       home: Scaffold(
         appBar: AppBar(
           title: Text('Perguntas', style: TextStyle(color: Colors.white),) ,
           centerTitle: true,
           backgroundColor: Colors.blue,
         ),
         body: temPerguntaSelecionada ? Questionario(
           perguntas: _perguntas,
           perguntaSelecionada: _perguntaSelecionada,
           quuandoResponder: _responder,
         ): Resultado(),
       ),
     );
   }
 }class _PerguntaApp extends StatefulWidget {
  @override
   _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}