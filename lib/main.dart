import 'package:flutter/material.dart';

import 'HorizontalBookCollection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audible Clone',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange,
        brightness: Brightness.dark,

        textTheme: const TextTheme(
          headline2: TextStyle(color: Colors.white, fontSize: 25),
          headline3: TextStyle(
            color: Colors.orangeAccent,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Audible'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //bool _isListening = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: const [
          Padding(
            child: Icon(Icons.search, color: Colors.white),
            padding: EdgeInsets.only(right: 20),
          )
        ],
      ),
      bottomSheet: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 70,
        ),
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                "https://m.media-amazon.com/images/I/61y9Jijcz9L._SL500_.jpg",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Harry Potter à l'école des sorciers",
                  ),
                  Text(
                    "Temps restant : 4h36",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              Icon(Icons.restore),
              Icon(Icons.play_circle_filled),
            ],
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset(
                "lake.jpg",
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
              Positioned(
                child: Text(
                  'Il vous reste 3 crédits audios.',
                  style: Theme.of(context).textTheme.headline3,
                  softWrap: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          const HorizontalBookCollection(
            collectionName: "Votre liste d'envie",
            books: 15,
          ),
          const HorizontalBookCollection(
            collectionName: 'Recommandations selon votre bibliothèque',
            books: 15,
          ),
          const HorizontalBookCollection(
            collectionName: 'Top ventes',
            books: 15,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Bibliothèque',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: 'Parcourir',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.orangeAccent,
      ),
    );
  }
}