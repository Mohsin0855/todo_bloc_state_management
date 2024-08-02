import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  int taskCounter = 0;

  void _addTask() {
    context.read<TodoBloc>().add(AddToDoEvent(task: 'Task: $taskCounter'));
    taskCounter++;
  }

  void _removeTask(int index) {
    context.read<TodoBloc>().add(RemoveToDoEvent(index: index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("To-Do App Bloc Architecture")),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.toDosList.isEmpty) {
            return const Center(child: Text("No To Do is Found"));
          } else {
            return ListView.builder(
              itemCount: state.toDosList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.toDosList[index]), // Display task text
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeTask(index), // Pass index
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
