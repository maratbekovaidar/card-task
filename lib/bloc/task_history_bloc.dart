import 'package:card_task/bloc/task_history_event.dart';
import 'package:card_task/bloc/task_history_state.dart';
import 'package:card_task/models/task_history_model.dart';
import 'package:card_task/repository/task_history_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskHistoryBloc extends Bloc<TaskHistoryEvent, TaskHistoryState> {
  final TaskHistoryRepository taskHistoryRepository;

  TaskHistoryBloc({required this.taskHistoryRepository})
      : super(TaskHistoryEmptyState()) {
    on<TaskHistoryEvent>(
      (event, emit) async {
        if (event is TaskHistoryLoadEvent) {
          emit(TaskHistoryLoadingState());
          try {
            final List<TaskHistoryModel> _loadedTaskHistory =
                await taskHistoryRepository.getTaskHistory();
            print("Aidar Loaded success");
            return emit(TaskHistoryLoadedState(loadedTaskHistory: _loadedTaskHistory));
          } catch (_) {
            print("Aidar Loaded failed");
            return emit(TaskHistoryErrorState());
          }
        } else if (event is TaskHistoryClearEvent) {
          print("Aidar Clear");
          return emit(TaskHistoryEmptyState());
        }
      },
    );
  }

}
