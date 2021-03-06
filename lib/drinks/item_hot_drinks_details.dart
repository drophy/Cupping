import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class HotDrinkDetailsPage extends StatefulWidget {
  final ProductHotDrinks product;
  final ProductType productType;
  final ProductCart productCart;
  HotDrinkDetailsPage({
    Key key,
    @required this.product,
    @required this.productType,
    @required this.productCart,
  }) : super(key: key);

  @override
  _HotDrinkDetailsPageState createState() => _HotDrinkDetailsPageState();
}

class _HotDrinkDetailsPageState extends State<HotDrinkDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final vh = MediaQuery.of(context).size.height / 100;
    final vw = MediaQuery.of(context).size.width / 100;
    double _imageMarin = 10;

    List<String> chipLabels;
    if (widget.productType == ProductType.BEBIDAS)
      chipLabels = ['Chico', 'Mediano', 'Grande'];
    else if (widget.productType == ProductType.GRANO)
      chipLabels = ['250 G', '1K'];

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
                        color: widget.product.liked? Colors.indigoAccent : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.product.liked = !widget.product.liked;
                        });
                      },
                    ),
                  )
                ]),
              ),
              // DESCRIPTION
              Text('${widget.product.productTitle}', style: Theme.of(context).textTheme.headline5),
              SizedBox(height: 3 * vh),
              Text('${widget.product.productDescription}', style: Theme.of(context).textTheme.bodyText1),
              SizedBox(height: 3 * vh),
              // LABELS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('TAMAÑOS DISPONIBLES', style: Theme.of(context).textTheme.subtitle2),
                  Text('PRECIO', style: Theme.of(context).textTheme.subtitle2),
                ],
              ),
              // SIZES AND PRICE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    GestureDetector(
                      child: Chip(
                        label: Text('${chipLabels[0]}'),
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
                        label: Text('${chipLabels[1]}'),
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
                    if (widget.productType == ProductType.BEBIDAS)
                      SizedBox(width: 10),
                    if (widget.productType == ProductType.BEBIDAS)
                      GestureDetector(
                        child: Chip(
                          label: Text('${chipLabels[2]}'),
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
                    onPressed: _addToCart,
                  ),
                  RaisedButton(
                    child: Text('COMPRAR'),
                    onPressed: () {
                      _addToCart();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Cart(
                              productsList: widget.productCart.itemCartList),
                        ),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _addToCart() {
    widget.productCart.itemCartList.add(ProductItemCart(
      productAmount: 1,
      productPrice: widget.product.productPrice,
      productTitle: widget.product.productTitle,
      typeOfProduct: ProductType.BEBIDAS,
      productImage: widget.product.productImage
    ));
  }
}
