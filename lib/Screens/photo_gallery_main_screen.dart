
import 'package:flutter/material.dart';
import 'package:photo_gallery/services/cloud_storage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
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
      ),
      body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                future: storage.downloadURL('istock-602301816.jpg',),
                builder: (BuildContext context,
                    AsyncSnapshot<String> snapshot) {
                  if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                    return SizedBox(
                        width: 350,
                        height: 250,
                        child: Image.network(
                          snapshot.data!,
                          fit: BoxFit.cover,
                        ));
                  }
                  if(snapshot.connectionState == ConnectionState.waiting ||
                      !snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  return Container();
                }),
            ),
               FutureBuilder(
                   future: storage.downloadURL('overweight.jpg'),
                   builder: (BuildContext context,
                       AsyncSnapshot<String> snapshot) {
                     if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                       return SizedBox(
                           width: 350,
                           height: 250,
                           child: Image.network(
                             snapshot.data!,
                             fit: BoxFit.cover,
                           ));
                     }
                     if(snapshot.connectionState == ConnectionState.waiting ||
                         !snapshot.hasData) {
                       return const CircularProgressIndicator();
                     }
                     return Container();
                   }),

               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: FutureBuilder(
                    future: storage.downloadURL('Vitamin B.jpg'),
                    builder: (BuildContext context,
                        AsyncSnapshot<String> snapshot) {
                      if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                        return SizedBox(
                            width: 350,
                            height: 250,
                            child: Image.network(
                              snapshot.data!,
                              fit: BoxFit.cover,
                            ));
                      }
                      if(snapshot.connectionState == ConnectionState.waiting ||
                          !snapshot.hasData) {
                        return const CircularProgressIndicator();
                      }
                      return Container();
                    }),
               ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                  future: storage.downloadURL('maxresdefault.jpg'),
                  builder: (BuildContext context,
                      AsyncSnapshot<String> snapshot) {
                    if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                      return SizedBox(
                          width: 350,
                          height: 250,
                          child: Image.network(
                            snapshot.data!,
                            fit: BoxFit.cover,
                          ));
                    }
                    if(snapshot.connectionState == ConnectionState.waiting ||
                        !snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }
                    return Container();
                  }),
            ),

          ],
        ),

      ),




),

    );


  }
}