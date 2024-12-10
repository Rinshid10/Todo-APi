import 'package:crudapi/provider/provider.dart';
import 'package:crudapi/view/homepage/addpage/addPage.dart';
import 'package:crudapi/view/homepage/editpage/editpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TodoProvider>(context, listen: false).getDataFromProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => AddPage()));
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<TodoProvider>(builder: (context, value, child) {
        final saveal = value.getallDataFromTodo;
        if (value.isLoading) {
          return Row(
            children: [
              Text('lodingggggg'),
              Consumer<TodoProvider>(
                builder: (context, value, child) => IconButton(
                    onPressed: () {
                      value
                          .delete(value.getallDataFromTodo.first.id.toString());
                    },
                    icon: Icon(Icons.delete)),
              )
            ],
          );
        }
        return ListView.builder(
          itemCount: value.getallDataFromTodo.length,
          itemBuilder: (context, index) {
            final save = saveal[index];
            return Row(
              children: [
                GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => EditPage(todo: save))),
                    child: Card(child: Text(save.name.toString()))),
                Consumer<TodoProvider>(builder: (context, value, child) {
                  return IconButton(
                      onPressed: () {
                        var a = value.getallDataFromTodo;
                        value.delete(a[index].id.toString());
                      },
                      icon: Icon(Icons.delete));
                })
              ],
            );
          },
        );
      }),
    );
  }
}
