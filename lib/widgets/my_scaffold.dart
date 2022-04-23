import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'shopping/product_item.dart';
import 'shopping/shopping_list.dart';

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
          elevation: 0,
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
