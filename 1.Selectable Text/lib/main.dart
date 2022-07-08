import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Selectable Text',
      theme: ThemeData.light(),
      home: SelectText(),
    );
  }
}

class SelectText extends StatelessWidget {
  SelectText({Key? key}) : super(key: key);
  final _textEditingController = TextEditingController();
  final txt = 'This text is selectable...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: const Text('Selectable Text'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SelectableText(
                txt,
                toolbarOptions: const ToolbarOptions(
                  copy: true,
                  cut: true,
                  selectAll: true,
                  paste: true,
                ),
                style: const TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            TextField(
              controller: _textEditingController,
              maxLines: 1,
              maxLength: txt.length,
              style: const TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                      color: Colors.deepPurpleAccent, width: 3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                      color: Colors.deepPurpleAccent, width: 3),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                      color: Colors.deepPurpleAccent, width: 3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
