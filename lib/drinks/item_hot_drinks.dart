import 'package:estructura_practica_1/drinks/item_hot_drinks_details.dart';
import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';

class ItemHotDrinks extends StatefulWidget {
  final ProductHotDrinks product;
  final ProductType productType;
  final ProductCart productCart;

  ItemHotDrinks({
    Key key,
    @required this.product,
    @required this.productType,
    @required this.productCart,
  }) : super(key: key);

  @override
  _ItemHotDrinksState createState() => _ItemHotDrinksState();
}

class _ItemHotDrinksState extends State<ItemHotDrinks> {
  @override
  Widget build(BuildContext context) {
    final vh = MediaQuery.of(context).size.height / 100;
    final vw = MediaQuery.of(context).size.width / 100;
    final _cardHeight = 22 * vh;

    String _productType;
    if (widget.productType == ProductType.BEBIDAS)
      _productType = 'Bebidas';
    else if (widget.productType == ProductType.GRANO)
      _productType = 'Café de grano';
    else
      _productType = 'Otros';

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HotDrinkDetailsPage(
            product: widget.product,
            productType: widget.productType,
            productCart: widget.productCart,
          ),
        ));
      },
      child: Container(
        height: _cardHeight,
        margin: EdgeInsets.symmetric(vertical: 1.5 * vh, horizontal: 12 * vw),
        child: Card(
          color: Colors.indigo[100],
          elevation: 4, // so it casts a shadow
          child: Row(children: [
            // LEFT SIDE
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$_productType'),
                    Text('${widget.product.productTitle}'),
                    Text('\$${widget.product.productPrice}'),
                  ],
                ),
              ),
            ),
            // RIGHT SIDE
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(color: Colors.black),
                    Opacity(
                      opacity: 0.75,
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage('${widget.product.productImage}'),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: widget.product.liked
                              ? Colors.indigoAccent
                              : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.product.liked = !widget.product.liked;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
