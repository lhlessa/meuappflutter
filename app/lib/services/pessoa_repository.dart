import 'package:app/shared/models/pessoa.dart';
import 'package:flutter/material.dart';

class PessoaRepository {
  static final List<Pessoa> _pessoas = [];

  static void adicionarPessoas(pessoa) {
    _pessoas.add(pessoa);
  }

  static List<String> obterDadosPessoas() {
    return _pessoas.map((pessoa) => pessoa.toString()).toList();
  }

  static void imprimirPessoas() {
    _pessoas.forEach((element) {
      debugPrint(element.nome);
      debugPrint(element.altura.toString());
      debugPrint(element.peso.toString());
    });
  }
}
