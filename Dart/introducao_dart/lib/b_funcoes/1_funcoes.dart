void main() {
  var nome = recuperarPrimeiroNome('juliano batista silva');
  funcaoSemretorno();
  print(nome);
  var nomeSemTipo = recuperarNomeSemTipo('Juliano batista silva');
  print(nomeSemTipo);
}

void funcaoSemretorno() {
  print('Funcao sem retorno');
}

String recuperarPrimeiroNome(String nomeCompleto) {
  var primeiroNome = nomeCompleto.split(' ');
  print(primeiroNome);
  return primeiroNome[0];
}

recuperarNomeSemTipo(nomeCompleto) {
  var primeiroNome = nomeCompleto.split(' ');
  print(primeiroNome);
  return primeiroNome.first;
}
