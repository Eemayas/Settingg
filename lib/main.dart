import 'package:flutter/material.dart';
import 'slider/Sensitivityslider.dart';
import './switchOff_On.dart';
import "package:provider/provider.dart";
import "Provider/value.dart";
import 'slider/loadSlider.dart';
import 'slider/resolveslider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => SensitivityValue()),
      ChangeNotifierProvider(create: (_) => resolveValue()),
      ChangeNotifierProvider(create: (_) => loadValue())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        sliderTheme: SliderThemeData(
          showValueIndicator: ShowValueIndicator.always,
        ),
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
            ListTileCard(
              trailing: "",
              OnTap: () => null,
              title: "Select Theme",
            ),
            ListTileCard(
              trailing: "",
              title: "Thickness Control",
              OnTap: () => null,
            ),
            ListTileCard(
              trailing: "",
              title: "Control",
              OnTap: () => null,
            ),
            ListTileCard(
              trailing: "",
              title: "Default Window",
              OnTap: () => null,
            ),
            ListTileCard(
              trailing: "",
              title: "While opening the case",
              OnTap: () => null,
            ),
            ListTileCard(
              trailing: "${context.watch<loadValue>().lvalue}",
              title: "Max Image Load Buffer",
              OnTap: () {
                showDialog(
                    context: context,
                    builder: (context) => Center(
                          child: Material(
                            child: Container(
                              color: Colors.white,
                              height: 150.0,
                              width: 300,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Max Image Load Buffer",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                    loadSlider(
                                      min: 20,
                                      max: 100,
                                      interval: 10,
                                      step: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ));
              },
            ),
            ListTileCard(
              trailing: "${context.watch<resolveValue>().rvalue}",
              title: "Max Image Resolve Buffer",
              OnTap: () {
                showDialog(
                    context: context,
                    builder: (context) => Center(
                          child: Material(
                            child: Container(
                              color: Colors.white,
                              height: 150.0,
                              width: 300,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Max Image Resolve Buffer",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                    resolveSlider(
                                      min: 4,
                                      max: 20,
                                      interval: 2,
                                      step: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ));
              },
            ),
            ListTileCard(
              trailing: "${context.watch<SensitivityValue>().svalue}",
              title: "Default Sensitivity",
              OnTap: () {
                showDialog(
                    context: context,
                    builder: (context) => Center(
                          child: Material(
                            child: Container(
                              color: Colors.white,
                              height: 150.0,
                              width: 300,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Sensitivity ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                    SensitivitySlider(
                                      min: 0,
                                      max: 20,
                                      interval: 4,
                                      step: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileCard extends StatelessWidget {
  ListTileCard(
      {required this.title, required this.OnTap, required this.trailing});
  late String title;
  late Function() OnTap;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          trailing: Text(trailing),
          title: Text(title),
          onTap: OnTap,
        ),
        // return Container(
        //   child: Column(
        //     children: [
        //       Padding(
        //         padding: EdgeInsets.only(left: 20),
        //         child: Container(
        //             height: 50,
        //             alignment: Alignment.centerLeft,
        //             child: Text(title)),
        //       ),
        Divider(
          thickness: 2,
        ),
      ],
      // ),
    );
  }
}
