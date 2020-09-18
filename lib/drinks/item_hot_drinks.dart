import 'package:estructura_practica_1/drinks/item_hot_drinks_details.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class ItemHotDrinks extends StatefulWidget {
  final ProductHotDrinks drink;

  ItemHotDrinks({
    Key key,
    @required this.drink,
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

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HotDrinkDetailsPage(product: widget.drink),
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
                    Text('Café'),
                    Text('${widget.drink.productTitle}'),
                    Text('\$${widget.drink.productPrice}'),
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
                        image: NetworkImage('${widget.drink.productImage}'),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: widget.drink.liked
                              ? Colors.indigoAccent
                              : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.drink.liked = !widget.drink.liked;
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
