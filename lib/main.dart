// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'questionario.dart';
import 'resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppStates extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual comando no linux para criar diretorios ?',
      'respostas': [
        {'texto': 'mkdir', 'pontuação': 1},
        {'texto': 'msdir', 'pontuação': 0},
        {'texto': 'ls', 'pontuação': 0},
        {'texto': 'ls -l', 'pontuação': 0}
      ],
    },
    {
      'texto': 'Qual o comando no linux usa para navegar no diretorio ?',
      'respostas': [
        {'texto': '.navegar', 'pontuação': 0},
        {'texto': 'ls -la', 'pontuação': 0},
        {'texto': 'cd', 'pontuação': 1},
        {'texto': 'dir', 'pontuação': 0}
      ],
    },
    {
      'texto':
          'Que comando no Linux usa para excluir um arquivo do diretorio ?',
      'respostas': [
        {'texto': 'excl/diretorio_origem/Arquivo', 'pontuação': 0},
        {'texto': 'mv/diretorio_origem/Arquivo', 'pontuação': 0},
        {'texto': 'rm/diretorio_origem/Arquivo', 'pontuação': 1},
        {'texto': 'del/diretorio_origem/Arquivo', 'pontuação': 0}
      ],
    },
    {
      'texto':
          'Que comando no linux usa para visualizar, página a página este arquivo ?',
      'respostas': [
        {'texto': 'cat/<diretorio>/<arquivo>', 'pontuação': 0},
        {'texto': 'less/<diretorio>/<arquivo>', 'pontuação': 1},
        {'texto': 'edt/<diretorio>/<arquivo>', 'pontuação': 0},
        {'texto': 'lst/<diretorio>/<arquivo>', 'pontuação': 0}
      ],
    },
    {
      'texto':
          'Que comando do linux usar para vizualisar conteúdo de arquivo ?',
      'respostas': [
        {'texto': 'lts/<diretorio>/<arquivo>', 'pontuação': 0},
        {'texto': 'cat/<diretorio>/<arquivo>', 'pontuação': 1},
        {'texto': 'edt/<diretorio>/<arquivo>', 'pontuação': 0},
        {'texto': 'txtpad/<diretorio>/<arquivo>', 'pontuação': 0}
      ],
    },
    {
      'texto':
          'Qual comando no linux usar para ver o caminho completo do diretorio corrente ?',
      'respostas': [
        {'texto': 'mkdir', 'pontuação': 0},
        {'texto': 'pwd', 'pontuação': 1},
        {'texto': 'ls', 'pontuação': 0},
        {'texto': 'cd', 'pontuação': 0}
      ],
    },
    {
      'texto':
          'Que comando no Linux para copiar um arquivo de um diretorio para outro ?',
      'respostas': [
        {
          'texto': 'copy/diretorio_origem/arquivo/diretorio_destiono/arquivo',
          'pontuação': 0
        },
        {
          'texto': 'move/diretorio_origem/arquivo/diretorio_destiono/arquivo',
          'pontuação': 0
        },
        {
          'texto': 'mv/diretorio_origem/arquivo/diretorio_destiono/arquivo',
          'pontuação': 0
        },
        {
          'texto': 'cp/diretorio_origem/arquivo/diretorio_destiono/arquivo',
          'pontuação': 1
        }
      ],
    },
    {
      'texto':
          'Qual comando no linux para mover permanentemente um arquivo de um diretorio para outro diretorio ?',
      'respostas': [
        {
          'texto': 'copy/diretorio_origem/arquivo/diretorio_destiono/arquivo',
          'pontuação': 0
        },
        {
          'texto': 'move/diretorio_origem/arquivo/diretorio_destiono/arquivo',
          'pontuação': 0
        },
        {
          'texto': 'mv/diretorio_origem/arquivo/diretorio_destiono/arquivo',
          'pontuação': 1
        },
        {
          'texto': 'cp/diretorio_origem/arquivo/diretorio_destiono/arquivo',
          'pontuação': 0
        }
      ],
    },
    {
      'texto': 'Qual comando no linux para remover diretorios vazios ?',
      'respostas': [
        {'texto': 'rm', 'pontuação': 0},
        {'texto': 'rmdir', 'pontuação': 1},
        {'texto': '.remove', 'pontuação': 0},
        {'texto': 'del', 'pontuação': 0}
      ],
    },
    {
      'texto':
          'Qual comando no linux para fornecer uma listagem completa de arquivos de um diretorio ?',
      'respostas': [
        {'texto': 'ls', 'pontuação': 0},
        {'texto': 'ls -l', 'pontuação': 1},
        {'texto': 'la -la', 'pontuação': 0},
        {'texto': 'ls -la', 'pontuação': 0},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Peguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  _PerguntaAppStates createState() {
    return _PerguntaAppStates();
  }
}
