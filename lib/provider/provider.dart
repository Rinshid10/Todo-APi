import 'dart:developer';
import 'package:crudapi/modal/modal.dart';
import 'package:crudapi/sevices/todoserivices.dart';

import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<TodoApp> getallDataFromTodo = [];
  TodoServices servicesOfTodo = TodoServices();
  bool isLoading = false;

  Future<void> getDataFromProvider() async {
    isLoading = true;
    notifyListeners();
    try {
      List<TodoApp> data = await servicesOfTodo.todoServicesFunction();
      getallDataFromTodo = data;

      log(data.toString());
    } catch (e) {
      log('Error fetching data: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }












 Future<void> updateTodo(String name, String description, String id) async {
    if (name.isEmpty || description.isEmpty) {
      log('Name or Description cannot be empty');
      return;
    }

    isLoading = true;
    notifyListeners();
    try {
      await servicesOfTodo.updateTOdo(
        TodoApp(description: description, name: name),
        id,
      );
      await getDataFromProvider();
    } catch (e) {
      log('Error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }












  Future<void> addTodo() async {
    isLoading = true;
    notifyListeners();
    try {
      await servicesOfTodo.addtodo(
          TodoApp(description: descriptionController.text, name: nameController.text));
      notifyListeners();
      nameController.clear();
      descriptionController.clear();
      getDataFromProvider();
    } catch (e) {
      log('erroor ocured $e');
    }
  }

  // Future updatetodo(, String id) async {
  //   try {
  //     await servicesOfTodo.updateTOdo(
  //         TodoApp(description: descriptionController.text, name: nameController.text), id);
  //     await getDataFromProvider();
  //   } catch (e) {
  //     log('error $e');
  //   }
  // }

  Future delete(String id) async {
    try {
      await servicesOfTodo.deleteTodo(id);
      await getDataFromProvider();
      notifyListeners();
    } catch (e) {
      log('errr $e');
    }
  }
}
