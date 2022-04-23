import 'package:flutter/material.dart';
import 'package:myapp/class/product.dart';

class ProductItem extends StatefulWidget {
  late String name;
  late bool isAdd;
  ProductItem({required this.name, required this.isAdd, Key? key}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {

  void changeState(){
    if(widget.isAdd){
      widget.isAdd = false;
    }
    else{
      widget.isAdd = true;
    }
  }
  @override
  Widget build(BuildContext context) {
    Product product = Product(name: widget.name);
    return GestureDetector(
      onTap: (){
        setState(() {
          changeState();
        });
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: widget.isAdd ? Colors.black12 : null
        ),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(
              child: Text(
                product.name[0],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              product.name,
              style: TextStyle(color: Theme.of(context).primaryColor, decoration: widget.isAdd ? TextDecoration.lineThrough : null),
            ),
          ],
        ),
      ),
    );
  }
}
