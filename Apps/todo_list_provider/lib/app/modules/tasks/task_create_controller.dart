import 'package:todo_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_provider/app/services/tasks/tasks_services.dart';

class TaskCreateController extends DefaultChangeNotifier {
  final TaskServices _taskServices;
  DateTime? _selectedDate;
  TaskCreateController({required TaskServices taskServices})
      : _taskServices = taskServices;

  set selectedDate(DateTime? selectedDate) {
    resetState();
    _selectedDate = selectedDate;
    notifyListeners();
  }

  DateTime? get selectedDate => _selectedDate;

  void save(String description) async {
    try {
      showLoadingAndResetState();
      //notifyListeners();
      if (_selectedDate != null) {
        await _taskServices.save(_selectedDate!, description);
        success();
      } else {
        setError('Data da task nao selecionada');
      }
    } catch (e, s) {
      setError('Erro ao cadastrar task');
      print(s);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
