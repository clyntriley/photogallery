



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery/services/cloud_storage.dart';

class Widgets extends StatefulWidget {
  const Widgets({Key? key,}) : super(key: key);



  @override
  State<Widgets> createState() => _WidgetsState();
}

class _WidgetsState extends State<Widgets> {
  final Storage storage =Storage();

  @override
  Widget build(BuildContext context) {

   return Scaffold(
     body: Center(
       child: SingleChildScrollView(
         child: Column(
           children: <Widget>[
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: FutureBuilder(
                   future: storage.downloadURL('istock-602301816.jpg'),
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
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: FutureBuilder(
                   future: storage.downloadURL('IMG_20211228_141359.jpg'),
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


