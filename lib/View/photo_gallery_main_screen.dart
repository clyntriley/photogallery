

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery/Model/widgets.dart';
import 'package:photo_gallery/services/cloud_storage.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( primarySwatch: Colors.green ),
      home: const MyHomePage(title: 'My Photo Gallery'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final Storage storage =Storage();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: false,
        leading: IconButton (
          icon: const Icon(Icons.share),
          onPressed: () async {
            final results = await FilePicker.platform.pickFiles(
              allowMultiple: true,
              type: FileType.custom,
              allowedExtensions: ['png','jpg']
            );

            if (results == null) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('no omage selected')),);
            return null;
            }

            final path = results.files.single.path!;
            final filename = results.files.single.name;

            storage
            .uploadFile(path, filename)
            .then((value) => const Text('Done'));


          },
        ),
      ),
      body: const Widgets()
    );


  }
}