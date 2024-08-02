import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> toDosList = [];

  TodoBloc() : super(const TodoState()) {
    on<AddToDoEvent>(_addTodoEvent);
    on<RemoveToDoEvent>(_removeTodoEvent);
  }

  void _addTodoEvent(AddToDoEvent event, Emitter<TodoState> emit) {
    toDosList.add(event.task);
    emit(state.copyWith(toDosList: List.from(toDosList)));
  }

  void _removeTodoEvent(RemoveToDoEvent event, Emitter<TodoState> emit) {
    if (event.index >= 0 && event.index < toDosList.length) {
      toDosList.removeAt(event.index);
      emit(state.copyWith(toDosList: List.from(toDosList)));
    }
  }
}
