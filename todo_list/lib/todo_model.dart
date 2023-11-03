import 'package:flutter/material.dart';
import 'package:part_1/todo_fields.dart';

class TodoModel with ChangeNotifier {
  List<Todo> _todo = [];
  List<Todo> get todo => _todo;

  int _counter = 0;
  // int get counter => _counter;
  getTodoValue(String title) {
    _todo.add(Todo(id: _counter, title: title));
    notifyListeners();
  }

  removeTodoValue(int index) {
    _todo.removeAt(index);
    notifyListeners();
  }
  var editIndex = null;
  updateEditIndex(index){
    editIndex = index;
    notifyListeners();
  }
  updateTodo(int id, String newTitle){
     final todo = _todo.firstWhere((todo) => todo.id == id);
   
      todo.title = newTitle;
      notifyListeners();
    
  }
}
