import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/Screens/toDoScreen.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => TodoBloc())],
      child: const MaterialApp(
        home: ToDoScreen(),
      ),
    );
  }
}
