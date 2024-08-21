import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop_app/models/cart.dart';
import 'package:sneaker_shop_app/models/shoe.dart';

class CartItem extends StatefulWidget {

  final Shoe shoe;

  const CartItem({
    super.key,
    required this.shoe,
    });


  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  //remove item from cart

  void removeItemFromCart(){
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(bottom: 10),

      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              widget.shoe.imagePath,
              width: 80,
            ),
          ),
        ),
        title: Text(
          widget.shoe.name,
          style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
          ),
        subtitle: Text(
          widget.shoe.price,
          style: TextStyle(color: Theme.of(context).colorScheme.tertiary)
          ),
        trailing: IconButton(
          onPressed: removeItemFromCart, 
          icon: Icon(
            Icons.delete,
            color: Theme.of(context).colorScheme.error,
            )
          ),
      ),
    );
  }
}