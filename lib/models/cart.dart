import 'package:flutter/material.dart';
import 'package:sneaker_shop_app/models/shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Zoom FREAK', 
      price: '300', 
      imagePath: 'lib/images/zoomfreak.png', 
      description: 'The forward-thinking design of his lates signature shoe'
      ),

      Shoe(
        name: 'Air Jordan', 
        price: '313', 
        imagePath: 'lib/images/airjordan.png', 
        description: 'You\'ve got the hops and the speed-lace up in shoes that when you are in the court'
        ),

      Shoe(
        name: 'KD Treys', 
        price: '240', 
        imagePath: 'lib/images/kdtrey.png', 
        description: 'A secure midfoot strap is suited for scoring binges and defensive'
        ),
      Shoe(
        name: 'Kyrie 6', 
        price: '285', 
        imagePath: 'lib/images/kyrie.png', 
        description: 'Bouncy cushioning is paired with soft yet supportive foam for resistance'
        ),


  ];

  // list of items in user cart
  List<Shoe> userCart = [];

  // get list of items for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart(){
    return userCart;
  }

  // add items to cart 
  void addItemToCart(Shoe shoe){
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }

}