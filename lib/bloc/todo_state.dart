part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final List<String> toDosList;
  const TodoState({this.toDosList = const []});

  TodoState copyWith({List<String>? toDosList}) {
    return TodoState(toDosList: toDosList ?? this.toDosList);
  }

  @override
  List<Object> get props => [toDosList];
}
