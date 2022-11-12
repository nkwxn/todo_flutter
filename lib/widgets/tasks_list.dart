import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            Task task = taskData.getTask(at: index);
            bool isChecked = task.isDone;
            return GestureDetector(
              onLongPress: () => showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView(children: [
                    ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Delete'),
                      onTap: () {
                        Provider.of<TaskData>(context, listen: false)
                            .deleteTask(index: index);
                        Navigator.pop(context);
                      },
                    ),
                  ]);
                },
              ),
              child: CheckboxListTile(
                title: Text(
                  task.name,
                  style: TextStyle(
                    decoration: isChecked
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                value: isChecked,
                activeColor: Colors.lightBlueAccent,
                onChanged: (value) {
                  Provider.of<TaskData>(context, listen: false)
                      .toggleTaskDone(index: index);
                },
              ),
            );
          },
        );
      },
    );
  }
}
