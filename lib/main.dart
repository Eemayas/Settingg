import 'package:flutter/material.dart';
import './switchOff_On.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class Drawerr extends StatelessWidget {
  const Drawerr({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Drawer Header'),
        ),
        ListTile(
          leading: Icon(
            Icons.home,
          ),
          title: const Text('Page 1'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.menu_book_sharp,
          ),
          trailing: SwitchScreen(),
          title: const Text('See Solutions'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.train,
          ),
          title: const Text('Page 2'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Drawerr(),
      ),
      appBar: AppBar(title: Text("Settings")),
      body: Padding(
        padding: EdgeInsets.only(top: 7),
        child: Column(
          children: [
            ListTileCard(title: "Select Theme"),
            ListTileCard(title: "Thickness Control"),
            ListTileCard(title: "Control"),
            ListTileCard(title: "Default Window"),
            ListTileCard(title: "While opening the case"),
          ],
        ),
      ),
    );
  }
}

class ListTileCard extends StatelessWidget {
  ListTileCard({required this.title, onTap});
  late String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Container(
              height: 50, alignment: Alignment.centerLeft, child: Text(title)),
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
