void main() {
  // ??
  String? x;
  String otherX = 'Other x';

  // Verificar nulos
  print('Com if');
  if (x == null) {
    print(otherX);
  } else {
    print(x);
  }

  //========================================
  print('Ternario');
  print(x == null ? otherX : x);

  //========================================
  print('Or Operator');
  print(x ?? otherX);

  //========================================
  bool? y;
  bool yIsNull = y ?? true;
  print(yIsNull);

  //========================================
  // ??= Atribuição
  var imNull;
  var imNotNull = 5;

  imNull ??= 10;
  imNotNull ??= 15; // Aviso devido a nao necessidade de nova atribuição em caso de nulos

  print(imNull);
  print(imNotNull);

  //========================================
  // ? Null all wherer operator (Executa o metodo apenas se a variavel nao for nula)
  String? nullString;
  String notNullString = 'Nao nula string';

  print(notNullString.contains('Nao'));
  print(nullString?.contains('Nao'));
}
