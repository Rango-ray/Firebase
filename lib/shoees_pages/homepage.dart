// import 'package:flutter/cupertino.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       debugShowCheckedModeBanner: false,
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           middle: Text(
//             'Congratulations, you are in!',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: CupertinoColors.white,
//             ),
//           ),
//           backgroundColor: Color.fromARGB(255, 80, 82, 82),
//         ),
//         child: Center(
//           child: Text(
//             "You're Logged In",
//             style: TextStyle(fontSize: 28),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/cupertino.dart';
import '../shoees_pages/shoe_item.dart';
import '../shoees_pages/shoe_store_page.dart';
import '../shoees_pages/cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ShoeItem> shoes = [
    ShoeItem(
        name: 'Nike Air Max',
        price: 120.0,
        selectedSize: 9,
        imageUrl:
            'https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/9f684ace-3163-4227-8f85-2d2a067dd4f5/AIR+MAX+90+GTX.png'),
    ShoeItem(
        name: 'Adidas Superstar',
        price: 140.0,
        selectedSize: 7,
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSswNGBCK2ZJYRYCqUrMqHpY5_RFQD7pkwi6Q&s'),
    ShoeItem(
        name: 'Puma RS-X',
        price: 50.0,
        selectedSize: 8,
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTilR56nSA9KPNM9mTAPLe0DcyV564cd37aPQ&s'),
    ShoeItem(
        name: 'Skechers',
        price: 90.0,
        selectedSize: 6,
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYSgfmgqeH8UTiMrwNJl1CK9J9g0MRN3jIjw&s'),
    ShoeItem(
        name: 'New Balance',
        price: 130.0,
        selectedSize: 7,
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBlPr6B2URXHZm3eqpAUPS6XkvipafE-EpPg&s'),
    ShoeItem(
        name: 'Converse',
        price: 90.0,
        selectedSize: 9,
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpgME7Ms3gyt2vjqOCGi12n-RmAv3CnufK6g&s'),
    ShoeItem(
        name: 'Air Jordans',
        price: 110.0,
        selectedSize: 8,
        imageUrl:
            'https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/9909210d-48ba-459e-96f4-faab32a41ce7/WMNS+AIR+JORDAN+1+LOW.png'),
    ShoeItem(
        name: 'Gucci Shoes',
        price: 160.0,
        selectedSize: 9,
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8K5Pww_UpTACm6kojpF_yGDDK_dmBDY33JA&s'),
    ShoeItem(
        name: 'Crocks',
        price: 110.0,
        selectedSize: 7,
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ95hGOxsIjMB5-OiHWKvs5tExy56T1Wq6w-g&s'),
  ];

  List<ShoeItem> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
      ),
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Store',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.shopping_cart),
              label: 'Cart',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          if (index == 0) {
            return ShoeStorePage(
              shoes: shoes,
              onAddToCart: (ShoeItem shoe) {
                setState(() {
                  cartItems.add(shoe);
                });
              },
            );
          } else {
            return CartPage(
              cartItems: cartItems,
              onRemoveFromCart: (ShoeItem shoe) {
                setState(() {
                  cartItems.remove(shoe);
                });
              },
            );
          }
        },
      ),
    );
  }
}
