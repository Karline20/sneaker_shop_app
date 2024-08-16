import 'package:flutter/material.dart';
import 'package:sneaker_shop_app/models/shoe.dart';

class ShoeTile extends StatelessWidget {
  
  final Shoe shoe;
  final void Function()? addToCart;

  const ShoeTile({
    super.key,
    required this.shoe,
    required this.addToCart,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary, 
        borderRadius: BorderRadius.circular(12)),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //shoe image
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12), 
              child: Image.asset(shoe.imagePath),
            ),
          ),
          
          //description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              shoe.description,
              style: TextStyle(color: Colors.grey[600]),
              ),
          ),

          //price + details
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  //shoe name
                  Text(shoe.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  
                  const SizedBox(height: 5),
                  //price
                  Text('\$${shoe.price}', style: const TextStyle(color: Colors.grey),)
                ],),
            
                //plus button
                GestureDetector(
                  onTap: addToCart,
                  child: Container (
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.black, 
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)
                        )
                      ),
                    child: const Icon(Icons.add, color: Colors.white,),
                  ),
                )
              ],
            ),
          )

          //button to add to cart
        ],
      ),
    );
  }
}