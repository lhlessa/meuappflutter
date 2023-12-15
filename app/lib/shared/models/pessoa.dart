import 'dart:math';

class Pessoa {
  String? _nome;
  double? _peso;
  double? _altura;
  String? _resultadoIMC;

  Pessoa(this._nome, this._peso, this._altura);

  String? get nome => _nome;

  double? get peso => _peso;

  double? get altura => _altura;

  set nome(String? value) => _nome = value;

  set peso(double? value) => _peso = value;

  set altura(double? value) => _altura = value;

  @override
  String toString() {
    return 'Nome: $_nome\nPeso: $_peso\nAltura: $_altura\nResultado IMC: $_resultadoIMC';
  }

  double _calculaIMC(double peso, double altura) {
    double resultado = peso / pow(altura, 2);
    return resultado;
  }

  String? resultadoIMC(double peso, double altura) {
    double resultado = _calculaIMC(peso, altura);

    if (resultado < 16) {
      _resultadoIMC = "Magreza Grave";
    } else if (resultado > 16 && resultado < 17) {
      _resultadoIMC = "Magreza Moderada";
    } else if (resultado > 17 && resultado < 18.5) {
      _resultadoIMC = "Magreza Leve";
    } else if (resultado > 18.5 && resultado < 25) {
      _resultadoIMC = "Saudável";
    } else if (resultado > 25 && resultado < 30) {
      _resultadoIMC = "Sobrepeso";
    } else if (resultado > 30 && resultado < 35) {
      _resultadoIMC = "Obesidade Grau I";
    } else if (resultado > 35 && resultado < 40) {
      _resultadoIMC = "Obesidade Grau II (severa)";
    } else {
      _resultadoIMC ="Obesidade Grau III (mórbida)";
    }

    return _resultadoIMC;
  }
}
