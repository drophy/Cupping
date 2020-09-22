import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
  final ProductItemCart product;
  final List<ProductItemCart> productsList;
  final ValueChanged<double> onAmountUpdated;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.productsList,
    @required this.product,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    final vh = MediaQuery.of(context).size.height / 100;
    final vw = MediaQuery.of(context).size.width / 100;

    return Card(
      margin: EdgeInsets.all(24),
      child: Row(
        children: <Widget>[
          // PICTURE
          Expanded(
            flex: 4,
            child: Container(
              height: 200,
              child: Image.network(
                widget.product.productImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // TEXT
          Expanded(
            flex: 5,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${widget.product.productTitle}',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 2 * vh),
                Text(
                  '${widget.product.typeOfProduct.toString().split('.')[1]}',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                SizedBox(height: 2 * vh),
                Text(
                  "\$${widget.product.productPrice}",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 2 * vh),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.add_circle_outline),
                      onPressed: _addProd,
                    ),
                    Text("${widget.product.productAmount}"),
                    IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: _remProd,
                    ),
                  ],
                )
              ],
            ),
          ),
          // ICON BUTTONS
          Expanded(
            flex: 1,
            child: Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icon(Icons.favorite),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      print(widget.productsList.remove(widget.product));
                      _deleteProd();
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  // Quantity is decreased by 1
  void _remProd() {
    setState(() {
      --widget.product.productAmount;
    });
    widget.onAmountUpdated(-1 * widget.product.productPrice);
  }

  // Product is removed from list entirely
  void _deleteProd() {
    widget.onAmountUpdated(
        -1 * widget.product.productAmount * widget.product.productPrice);
  }
}
