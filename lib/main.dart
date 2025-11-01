import 'package:flutter/material.dart';
import './questao.dart';
main() {
  runApp(_PerguntaApp());
}
 class _PerguntaAppState extends State<_PerguntaApp> {
   var _perguntaSelecionada = 0;
   void _responder(){
     setState(() {
        _perguntaSelecionada++;
     });
     print(_perguntaSelecionada);
   }
   @override
   Widget build(BuildContext context) {
     final perguntas = [
       'Qual é a sua cor favorita?',
       'Qual é o seu animal favorito?',
     ];
     return MaterialApp(
       home: Scaffold(
         appBar: AppBar(
           title: Text('Perguntas', style: TextStyle(color: Colors.white),) ,
           centerTitle: true,
           backgroundColor: Colors.blue,
         ),
         body: Column(
           children: <Widget>[
             Questao(perguntas[_perguntaSelecionada]),
             ElevatedButton(
                 child: Text('Resposta 1'),
                 onPressed: _responder
             ),
             ElevatedButton(
                 child: Text('Resposta 2'),
                 onPressed: null,
             ),
             ElevatedButton(
                 child: Text('Resposta 3'),
                 onPressed: _responder
             )
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