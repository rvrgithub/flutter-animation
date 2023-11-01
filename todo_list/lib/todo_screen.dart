import 'package:flutter/material.dart';
import 'package:part_1/todo_model.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final todoProvider = Provider.of<TodoModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.menu),
            Spacer(),
            ClipOval(
              child: Image.asset(
                "assets/dp.jpg",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Create Todo....",
                      fillColor: Colors.white70,
                    ),
                  )),
                  IconButton(
                      onPressed: () {
                        final title = titleController.text;
                        print(" my toto title  :- ${title}");
                        if (title.isNotEmpty) {
                          todoProvider.getTodoValue(title);
                        }
                      },
                      icon: Icon(Icons.add))
                ],
              ),
              SizedBox(
                height: 30,
              ),

              Expanded(
                  child: ListView.builder(
                itemCount: todoProvider.todo.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(todoProvider.todo[index].title),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        print(index);
                        todoProvider.removeTodoValue(index);
                      },
                    ),
                    leading: Checkbox(
                        value: todoProvider.todo[index].complete,
                        onChanged: (value) {
                          print("value ${value}");
                        }),
                  );
                },
              )),

              // Container(
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       style: BorderStyle.solid,
              //     ),
              //     borderRadius: BorderRadius.circular(20),
              //   ), // height: MediaQuery.of(context).size.height * .6,
              //   child: Row(
              //     children: [
              //       Expanded(
              //         flex: 2, // 30% of the total space
              //         child: Image.asset(
              //           'assets/dp.jpg',
              //           height: 90,
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //       // Right side text (70% of available space)
              //       Expanded(
              //         flex: 5, // 70% of the total space
              //         child: Container(
              //           height: 90,
              //           color: Colors.blue, // Example background color
              //           padding: EdgeInsets.all(16.0),
              //           child: Text(
              //             'Your text goes here. This container takes 70% of the available space.',
              //             style: TextStyle(color: Colors.white),
              //           ),
              //         ),
              //       ),
              //       SizedBox(width: 10),
              //       Expanded(
              //           flex: 1,
              //           child: IconButton(
              //             icon: Icon(Icons.edit),
              //             onPressed: () {},
              //           )),
              //       SizedBox(width: 10),
              //       Expanded(
              //           flex: 1,
              //           child: IconButton(
              //             icon: Icon(Icons.delete),
              //             onPressed: () {},
              //           )),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
