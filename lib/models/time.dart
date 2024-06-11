import 'package:flutter/material.dart';

import 'titulo.dart';

class Time {
  final String nome;
  final String brasao;
  final int pontos;
  final Color cor;
  List<Titulo> titulos = [];
  
  Time({required this.nome, required this.brasao,required this.pontos, required this.cor});

}