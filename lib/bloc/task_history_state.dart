
import 'package:card_task/models/task_history_model.dart';
import 'package:flutter/cupertino.dart';

abstract class TaskHistoryState {

}

class TaskHistoryEmptyState extends TaskHistoryState {

}

class TaskHistoryLoadingState extends TaskHistoryState {

}

class TaskHistoryLoadedState extends TaskHistoryState {
  List<TaskHistoryModel> loadedTaskHistory;

  TaskHistoryLoadedState(
      {
        required this.loadedTaskHistory
      });

}

class TaskHistoryErrorState extends TaskHistoryState {

}


