import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/tasks.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Tasks>(
      builder: (context, tasks, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: tasks.getTask(index).name,
              isChecked: tasks.getTask(index).isDone,
              onChanged: () => tasks.markDone(index),
              onLongPress: () => tasks.remove(index),
            );
          },
          itemCount: tasks.numTasks,
        );
      },
    );
  }
}
