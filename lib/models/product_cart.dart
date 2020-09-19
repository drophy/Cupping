import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
// import 'package:estructura_practica_1/models/product_grains.dart';

class ProductCart {
  List<ProductHotDrinks> drinks;
  List<ProductHotDrinks> grains;
  List<ProductItemCart> itemCartList = [];

  ProductCart({
    this.drinks,
    this.grains,
  });

  // List<ProductItemCart> generateItemCartList() {
  //   List<ProductItemCart> list = [];

  //   this.drinks.forEach((product) {
  //     if (product.productAmount > 0) {
  //       list.add(ProductItemCart(
  //         productAmount: product.productAmount,
  //         productPrice: product.productPrice,
  //         productTitle: product.productTitle,
  //         typeOfProduct: ProductType.BEBIDAS,
  //       ));
  //     }
  //   });
  //   this.grains.forEach((product) {
  //     if (product.productAmount > 0) {
  //       list.add(ProductItemCart(
  //         productAmount: product.productAmount,
  //         productPrice: product.productPrice,
  //         productTitle: product.productTitle,
  //         typeOfProduct: ProductType.BEBIDAS,
  //       ));
  //     }
  //   });

  //   return list;
  // }
}
