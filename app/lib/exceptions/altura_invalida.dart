class AlturaInvalidaException implements Exception {
  String error() => "Altura inválida precisa ser diferente de 0";

  @override
  String toString() {
    return "Altura inválida exception: ${error()}";
  }
}
