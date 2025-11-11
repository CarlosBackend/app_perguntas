import 'package:flutter/material.dart';
import './resposta.dart';
import './questao.dart';
main() {
  runApp(_PerguntaApp());
}
 class _PerguntaAppState extends State<_PerguntaApp> {
   var _perguntaSelecionada = 0;
   void _responder(){
     // Esse metodo muda o estado da tela
     setState(() {
        _perguntaSelecionada++;
     });
     print(_perguntaSelecionada);
   }
   @override
   Widget build(BuildContext context) {
     final perguntas = [{
         'texto': 'Qual é a sua cor favorita?',
         'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
       }, {
         'texto': 'Qual é o seu animal favorito?',
         'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão']
       }, {
         'texto': 'Qual é o seu instrutor favorito?',
         'respostas': ['Maria', 'João', 'Leo', 'Pedro']
       }];
     List<String> respostas = perguntas[_perguntaSelecionada]['respostas'] as List<String>;
     return MaterialApp(
       home: Scaffold(
         appBar: AppBar(
           title: Text('Perguntas', style: TextStyle(color: Colors.white),) ,
           centerTitle: true,
           backgroundColor: Colors.blue,
         ),
         body: Column(
           children: <Widget>[
             Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
             ...respostas.map((t) => Resposta(t, _responder)).toList(),
           ],
         ),
       ),
     );
   }
 }
class _PerguntaApp extends StatefulWidget {
  @override
   _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}