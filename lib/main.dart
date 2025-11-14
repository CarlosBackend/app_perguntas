import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';
main() {
  runApp(_PerguntaApp());
}
 class _PerguntaAppState extends State<_PerguntaApp> {
   var _perguntaSelecionada = 0;
   final _perguntas = const [{
     'texto': 'Qual é a sua cor favorita?',
     'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
   }, {
     'texto': 'Qual é o seu animal favorito?',
     'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão']
   }, {
     'texto': 'Qual é o seu instrutor favorito?',
     'respostas': ['Maria', 'João', 'Leo', 'Pedro']
   }];
   void _responder(){
     if(temPerguntaSelecionada){
       // Esse metodo muda o estado da tela
       setState(() {
         _perguntaSelecionada++;
       });
     }
   }

   bool get temPerguntaSelecionada {
     return _perguntaSelecionada < _perguntas.length;
   }
   @override
   Widget build(BuildContext context) {
     List<String> respostas = temPerguntaSelecionada ? _perguntas[_perguntaSelecionada]['respostas'] as List<String> : [];
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