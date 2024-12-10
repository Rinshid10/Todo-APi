import 'package:crudapi/modal/modal.dart';
import 'package:crudapi/provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final getcont = Provider.of<TodoProvider>(context);

    return Scaffold(
      body: Consumer<TodoProvider>(
        builder: (context, value, child) => Column(
          children: [
            TextField(controller: getcont.nameController),
            TextField(
              controller: getcont.descriptionController,
            ),
            ElevatedButton(
                onPressed: () {
                  getcont.addTodo();
                  Navigator.pop(context);
                },
                child: Text('addd'))
          ],
        ),
      ),
    );
  }
}
