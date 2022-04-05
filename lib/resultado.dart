import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 5) {
      return 'Que bela bosta sua nota foi menor que 5';
    } else if (pontuacao < 7) {
      return 'Do caralho mermão sua nota foi maior que 5 e menor que 7';
    } else if (pontuacao < 9) {
      return 'Eita porra bixo sua nota foi maior que 7 e menor que 9';
    } else {
      return 'O cara é uma MAQUINA!! tu tiro 10 caraio';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          child: const Text(
            'Reiniciar ?',
            style: const TextStyle(fontSize: 23),
          ),
          textColor: Colors.blue,
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}
