import 'package:flutter/material.dart';
import 'package:estructura_practica_1/cart/item_cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

class Cart extends StatefulWidget {
  final List<ProductItemCart> productsList;
  Cart({
    Key key,
    @required this.productsList,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;
  @override
  void initState() {
    super.initState();
    for (var item in widget.productsList) {
      _total += (item.productPrice * item.productAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    final vh = MediaQuery.of(context).size.height / 100;
    final vw = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de compras'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: ListView.builder(
              itemCount: widget.productsList.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemCart(
                  onAmountUpdated: _priceUpdate,
                  product: widget.productsList[index],
                );
              },
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(children: [
              Text("Total: $_total MX\$"),
              SizedBox(height: 4*vh),
              RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 32 * vw),
                child: Text('PAGAR'),
                onPressed: null,
              )
            ]),
          ),
        ],
      ),
    );
  }

  void _priceUpdate(double newItemPrice) {
    setState(() {
      _total += newItemPrice;
    });
  }
}
