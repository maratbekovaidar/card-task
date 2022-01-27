

import 'package:card_task/bloc/task_history_bloc.dart';
import 'package:card_task/bloc/task_history_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskHistoryBloc taskHistoryBloc = BlocProvider.of<TaskHistoryBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              taskHistoryBloc.add(TaskHistoryLoadEvent());
            },
            child: const Text("Load")
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
            onPressed: () {
              taskHistoryBloc.add(TaskHistoryClearEvent());
            },
            child: const Text("Clear")
        )
      ],
    );
  }
}
