import 'dart:developer';
import 'package:crudapi/modal/modal.dart';
import 'package:dio/dio.dart';

class TodoServices {
  final baseUrl = 'https://672865dd270bd0b975553b91.mockapi.io/Description';
  final Dio dio = Dio();

  Future<List<TodoApp>> todoServicesFunction() async {
    try {
      final response = await dio.get(baseUrl);

      if (response.statusCode == 200) {
        log(response.toString());
        List<dynamic> data = response.data;
        return data.map((item) => TodoApp.fromJson(item)).toList();
      } else {
        throw Exception(
            'Data not found in response, please check the fetching process');
      }
    } catch (e) {
      log('Error during API call: $e');
      throw Exception('Failed to load data: $e');
    }
  }

  Future addtodo(TodoApp todomodals) async {
    try {
      await dio.post(baseUrl, data: todomodals.toJson());
    } catch (e) {
      throw Exception(' failed to get data from add function $e');
    }
  }

  Future updateTOdo(TodoApp todomodals, String id) async {
    try {
      await dio.put('$baseUrl/$id', data: todomodals.toJson());
    } catch (e) {
      throw Exception('failed to get data from update funcion $e');
    }
  }

  Future deleteTodo(String id) async {
    try {
      await dio.delete('$baseUrl/$id');
    } catch (e) {
      throw Exception('failed to get delet $e');
    }
  }
}
