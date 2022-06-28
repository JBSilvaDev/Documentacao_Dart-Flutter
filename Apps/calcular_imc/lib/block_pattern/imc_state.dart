class ImcState {
  final double imc;
  ImcState({
    required this.imc,
  });
}

class IMCStateLoading extends ImcState {
  IMCStateLoading() : super(imc: 0);
}
