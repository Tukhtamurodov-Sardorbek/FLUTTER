import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // * StatusBar & NavigationBar Color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.deepPurpleAccent,
      systemNavigationBarColor: Colors.deepPurpleAccent,
    ),
  );

  // * Orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Code Generator',
      theme: ThemeData.light(),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _qrData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Generator'),
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _qrData,
              style: const TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              cursorColor: Colors.deepPurpleAccent,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.deepPurpleAccent,
                    width: 3,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.deepPurpleAccent,
                    width: 3,
                  ),
                ),
              ),
              onChanged: (String txt) {
                setState(() {});
              },
            ),
            const SizedBox(height: 50.0),
            _qrData.text.isNotEmpty
                ? QrImage(
                    data: _qrData.text.trim(),
                    version: QrVersions.auto,
                    foregroundColor: Colors.deepPurpleAccent,
                    size: 200.0,
                  )
                : Container(
                    height: 200.0,
                    width: 200.0,
                    color: Colors.deepPurpleAccent,
                  ),
          ],
        ),
      ),
    );
  }
}
