import 'package:flutter/material.dart';
import 'package:sneaker_shop_app/components/bottom_nav_bar.dart';
import 'package:sneaker_shop_app/pages/cart_page.dart';
import 'package:sneaker_shop_app/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //this selected index is to control the bottom nav bar

  int _selectedIndex = 0;

  //this method will update our selected index
  // when the user taps on the bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  // pages to display 
  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          }, 
          icon: const Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Icon(
              Icons.menu,
              color: Colors.black,),
          ),
          ),
        )
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                 //logo
            DrawerHeader(
              child: Image.asset(
                'lib/images/nikelogo.png',
                color: Colors.white,
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(
                color: Colors.grey[800],
                ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                  ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white
                  ),
                  ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.shopping_cart_checkout_rounded,
                  color: Colors.white,
                  ),
                title: Text(
                  'Cart',
                  style: TextStyle(
                    color: Colors.white
                  ),
                  ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.info_outline_rounded,
                  color: Colors.white,
                  ),
                title: Text(
                  'About',
                  style: TextStyle(
                    color: Colors.white
                  ),
                  ),
              ),
            ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.login_rounded,
                  color: Colors.white,
                  ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white
                  ),
                  ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}