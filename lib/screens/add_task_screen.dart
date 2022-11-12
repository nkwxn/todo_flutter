import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  String todoName = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: SafeArea(
          top: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Task',
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.lightBlueAccent,
                ),
                textAlign: TextAlign.center,
              ),
              TextField(
                autofocus: true,
                onChanged: (value) => todoName = value,
              ),
              ElevatedButton(
                onPressed: () {
                  // Pass the text to callback
                  Provider.of<TaskData>(context, listen: false).addTask(taskName: todoName);
                  Navigator.pop(context);
                },
                child: const Text('ADD'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
