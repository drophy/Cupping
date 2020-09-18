import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class HotDrinkDetailsPage extends StatefulWidget {
  final ProductHotDrinks product;
  HotDrinkDetailsPage({Key key, @required this.product}) : super(key: key);

  @override
  _HotDrinkDetailsPageState createState() => _HotDrinkDetailsPageState();
}

class _HotDrinkDetailsPageState extends State<HotDrinkDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final vh = MediaQuery.of(context).size.height / 100;
    final vw = MediaQuery.of(context).size.width / 100;
    double _imageMarin = 10;

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.product.productTitle}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10 * vw, // since the image takes 80*vw
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMAGE
              Container(
                width: 80 * vw,
                height: 40 * vh,
                margin: EdgeInsets.symmetric(vertical: 6 * vh),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.deepOrange[400], Colors.yellow[300]],
                  ),
                ),
                child: Stack(children: [
                  Positioned(
                    top: _imageMarin,
                    bottom: _imageMarin,
                    left: _imageMarin,
                    right: _imageMarin,
                    child: Opacity(
                      opacity: 0.75,
                      child: Image(
                        image: NetworkImage('${widget.product.productImage}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: _imageMarin,
                    right: _imageMarin,
                    // TODO: Turn into an actual button, maybe
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                    ),
                  )
                ]),
              ),
              // DESCRIPTION
              Text('${widget.product.productTitle}'),
              SizedBox(height: 3 * vh),
              Text('${widget.product.productDescription}'),
              SizedBox(height: 3 * vh),
              // LABELS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('TAMAÑOS DISPONIBLES'),
                  Text('PRECIO'),
                ],
              ),
              // SIZES AND PRICE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    GestureDetector(
                      child: Chip(
                        label: Text('Chico'),
                        backgroundColor:
                            widget.product.productSize == ProductSize.CH
                                ? Colors.deepPurple[100]
                                : Colors.grey[300],
                      ),
                      onTap: () {
                        setState(() {
                          widget.product.productSize = ProductSize.CH;
                          widget.product.productPrice =
                              widget.product.productPriceCalculator();
                        });
                      },
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      child: Chip(
                        label: Text('Mediano'),
                        backgroundColor:
                            widget.product.productSize == ProductSize.M
                                ? Colors.deepPurple[100]
                                : Colors.grey[300],
                      ),
                      onTap: () {
                        setState(() {
                          widget.product.productSize = ProductSize.M;
                          widget.product.productPrice =
                              widget.product.productPriceCalculator();
                        });
                      },
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      child: Chip(
                        label: Text('Grande'),
                        backgroundColor:
                            widget.product.productSize == ProductSize.G
                                ? Colors.deepPurple[100]
                                : Colors.grey[300],
                      ),
                      onTap: () {
                        setState(() {
                          widget.product.productSize = ProductSize.G;
                          widget.product.productPrice =
                              widget.product.productPriceCalculator();
                        });
                      },
                    ),
                  ]),
                  Text('\$${widget.product.productPrice}')
                ],
              ),
              SizedBox(height: 2 * vh),
              // BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    child: Text('AGREGAR AL CARRITO'),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Cart(productsList: [
                            ProductItemCart(
                              productAmount: 1,
                              productTitle: widget.product.productTitle,
                              productPrice: widget.product.productPrice,
                              typeOfProduct: ProductType.BEBIDAS
                            )
                          ]),
                        ),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text('COMPRAR'),
                    onPressed: null,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
