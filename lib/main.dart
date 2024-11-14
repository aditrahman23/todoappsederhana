import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp
> {
  final List<Map<String, dynamic>> _todos = [];
  final _textController = TextEditingController();

  void _addTodo() {
    setState(() {
      _todos.add({
        'title': _textController.text,
        'isDone': false,
      });
      _textController.clear();
    });
  }

  void _toggleTodo(int index) {
    setState(() {
      _todos[index]['isDone'] = !_todos[index]['isDone'];
    });
  }

  void _removeTodo(
int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan Kegiatan',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 58,
                    child: ElevatedButton(
                      onPressed: _addTodo,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.black,
                        textStyle: const TextStyle(fontSize: 16),
                        padding: const EdgeInsets.all(0),
                        minimumSize: const Size(58, 58),
                        shape: const CircleBorder(), 
                      ),
                      child: const Icon(Icons.add, size: 30),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text(
                        _todos[index]['title'],
                        style: TextStyle(
                          decoration: _todos[index]['isDone']
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      leading: Checkbox(
                        value: _todos[index]['isDone'],
                        onChanged: (value) => _toggleTodo(index),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeTodo(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
