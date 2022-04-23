import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class GenerateWord extends StatefulWidget {
  const GenerateWord({Key? key}) : super(key: key);

  @override
  _TapState createState() => _TapState();
}

class _TapState extends State<GenerateWord> {
  late String name = "World";

  void setName() {
    setState(() {
      name = WordPair.random(maxSyllables: 10).asPascalCase;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            icon: Icon(Icons.menu_outlined),
            onPressed: null,
            tooltip: "Menu",
          ),
          title: Text(
            "My App",
            style: Theme.of(context).primaryTextTheme.headline6,
          ),
          actions: const [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: null,
              tooltip: "Rechercher",
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: Center(
                  child: Text("Hello $name "),
                ))
          ],
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            setName();
          },
          child: const FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.add),
            tooltip: "Add",
          ),
        ));
  }
}
