import 'package:crudapi/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crudapi/modal/modal.dart';

class EditPage extends StatelessWidget {
  final TodoApp todo;

  EditPage({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);

    // Initialize the controllers with current todo values

    TextEditingController name = TextEditingController(text: todo.name);
    TextEditingController clas = TextEditingController(text: todo.description);

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              key: Key('nameField'),
              controller: name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              key: Key('descriptionField'),
              controller: clas,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 20),
            Consumer<TodoProvider>(
              builder: (context, value, child) {
                return ElevatedButton(
                  onPressed: () async {
                    await value.updateTodo(
                      name.text,
                      clas.text,
                      todo.id!,
                    );
                    Navigator.pop(context); // Go back after saving
                  },
                  child: Text('Save'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
