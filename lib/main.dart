import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:myapp/widgets/product_item.dart';
import 'package:myapp/widgets/shopping_list.dart';

void main() {
  runApp(MaterialApp(
    home: SafeArea(
      child: MyScaffold(),
    ),
  ));
}

class MyAppBar extends StatelessWidget {
  final Widget title;

  const MyAppBar({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      decoration: BoxDecoration(color: Colors.blue[900]),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.menu),
            tooltip: "Navigation menu",
          ),
          Expanded(child: title),
          const IconButton(
              onPressed: null, icon: Icon(Icons.search), tooltip: 'Find')
        ],
      ),
    );
  }
}

class MyScaffold extends StatefulWidget {
  List<ProductItem> listProducts = [];

  MyScaffold({Key? key}) : super(key: key);

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
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
            "My Store",
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: widget.listProducts.isNotEmpty
                    ? ShoppingList(products: widget.listProducts)
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text('No proudcts in store',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
              )
            ],
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
          /*setState(() {
              widget.listProducts.add(ProductItem(
                  name: WordPair.random(maxSyllables: 5).asPascalCase,
                  isAdd: false));
            });
            // ignore: avoid_print
            print(
                'Ajout d\'une valeur à la liste, nous sommes à ${widget.listProducts.length}');*/
          },
          child: FloatingActionButton(
            onPressed: (){
              setState(() {
                widget.listProducts.add(ProductItem(
                    name: WordPair.random(maxSyllables: 5).asPascalCase,
                    isAdd: false));
              });
            },
            child: const Icon(Icons.add),
            tooltip: "Add",
          ),
        ));
  }
}

class Tap extends StatefulWidget {
  const Tap({Key? key}) : super(key: key);

  @override
  _TapState createState() => _TapState();
}

class _TapState extends State<Tap> {
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
