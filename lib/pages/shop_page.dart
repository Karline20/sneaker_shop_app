import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop_app/components/shoe_tile.dart';
import 'package:sneaker_shop_app/models/cart.dart';
import 'package:sneaker_shop_app/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  // add shoe to cart

  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert the user, shoe successfully added
    showDialog(
      context: (context), 
      builder: (context) => const AlertDialog(
        title: Text('Successfully added!'),
        content: Text('Check your cart!'),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) => 
    Column(
      children: [
        // search bar
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary, 
            borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text('Search', style: TextStyle(color: Theme.of(context).colorScheme.tertiary),),
              Icon(Icons.search, color: Theme.of(context).colorScheme.tertiary,),
            ],
          ),
        ),

        // message
        Padding (
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Text(
            'Everyone flies.. some flies longer than others', 
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary
              ),),
        ),

        //hot picks
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Hot Picks 🔥', style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 24,
                color: Theme.of(context).colorScheme.tertiary
                ),),
              Text('See all', style: TextStyle(
                fontWeight: FontWeight.bold, 
                color: Theme.of(context).colorScheme.tertiary),),
            ],
          ),
        ),

        const SizedBox(height: 10,),
        
        // list of shoes for sale
        Expanded(
          child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            //get a shoe from shop list 
            Shoe shoe = value.getShoeList()[index];
            return ShoeTile(
              shoe: shoe,
              addToCart: () => addShoeToCart(shoe),
            );
          }
        ,)
        ),

      Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
          child: Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
        )
      ],  
    ),
    );
  }
}