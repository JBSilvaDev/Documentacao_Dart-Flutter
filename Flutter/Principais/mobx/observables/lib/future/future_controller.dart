import 'package:mobx/mobx.dart';
part 'future_controller.g.dart';

class FutureController = FutureControllerBase with _$FutureController;

abstract class FutureControllerBase with Store {
  @observable
  var nomeFuture = ObservableFuture.value('');

  Future<void> buscarNome() async {
    final buscaNomeFuture =
        Future.delayed(Duration(seconds: 2), () => 'JB Silva');

    nomeFuture = buscaNomeFuture.asObservable();

    // return 'Jb Silva';
  }
}
