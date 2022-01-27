
import 'package:card_task/models/task_history_model.dart';
import 'package:card_task/services/task_history_api_provider.dart';

class TaskHistoryRepository {
  final TaskHistoryProvider _taskHistoryProvider = TaskHistoryProvider();
  Future<List<TaskHistoryModel>> getTaskHistory() => _taskHistoryProvider.getTaskHistory();
}