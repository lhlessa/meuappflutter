class PesoInvalidoException implements Exception {
  String error() => "Peso inválido precisa ser diferente de 0";

  @override
  String toString() {
    return "Peso inválido exception: ${error()}";
  }
}
