void main() {
  final pessoas = ["Juliano|30", "Graci|35", "Dylan|5"];

  print('=' * 50);
  print('Remova os pacientes duplicados e apresente a nova lista');
  //! Tranformando em set remove as duplicidades pois set nao aceita valores repetidos
  final newPessoa = pessoas.toSet().toList();

  final n = newPessoa.map((e) => e.split("|")).toList();

  print(n);
  n.sort(
    (a, b) {
      final idadePacienteA = int.tryParse(a[1]) ?? 0;
      final idadePacienteB = int.tryParse(b[1]) ?? 0;
      print(idadePacienteB);

      return idadePacienteA.compareTo(idadePacienteB);
    },
  );
  print(n);
}
