part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class AddToDoEvent extends TodoEvent {
  final String task;
  const AddToDoEvent({required this.task});
  @override
  List<Object> get props => [task];
}

class RemoveToDoEvent extends TodoEvent {
  final int index; // Use int for index
  const RemoveToDoEvent({required this.index});
  @override
  List<Object> get props => [index];
}
