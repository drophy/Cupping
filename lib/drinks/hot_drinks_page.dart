import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/drinks/item_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class HotDrinksPage extends StatelessWidget {
  final ProductCart productCart;
  final ProductType productType;
  HotDrinksPage({
    Key key,
    @required this.productCart,
    @required this.productType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> productsList;
    String _appBarText;

    if(productType == ProductType.BEBIDAS) {
      productsList = productCart.drinks;
      _appBarText = 'Bebidas';
    }
    else if (productType == ProductType.GRANO) {
      productsList = productCart.grains;
      _appBarText = 'Café de grano';
    }
    else {
      productsList = [];
      _appBarText = 'Otros';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('$_appBarText'),
      ),
      body: ListView.builder(
        itemCount: productsList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemHotDrinks(
            product: productsList[index],
            productType: productType,
          );
        },
      ),
    );
  }
}
