import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class Tasks extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy milk', isDone: false),
    Task(name: 'Buy coffee', isDone: false),
    Task(name: 'Sleep', isDone: false),
  ];

  Task getTask(int index) {
    return _tasks[index];
  }

  void addTask(String taskName) {
    _tasks.add(Task(name: taskName, isDone: false));
    notifyListeners();
  }

  void markDone(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void remove(index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  int get numTasks {
    return _tasks.length;
  }

}
