import 'package:flutter/material.dart';

import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Buy Coffee'),
    Task(name: 'Buy Lunch'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  Task getTask({required int at}) {
    return _tasks[at];
  }

  void addTask({required String taskName}) {
    _tasks.add(Task(name: taskName));
    notifyListeners();
  }

  void deleteTask({required int index}) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void toggleTaskDone({required int index}) {
    _tasks[index].toggleDone();
    notifyListeners();
  }
}
