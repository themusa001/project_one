import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_one/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Chuks Kitchen',
          style: GoogleFonts.islandMoments(
            fontSize: 40.81,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFFF7A18),
          ),
        ),
        actions: const [
          Padding(padding: EdgeInsets.only(right: 20), child: Icon(Icons.menu)),
        ],
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final item = cart.items[index];
          return ListTile(
            leading: Image.asset(item.imagePath, width: 50),
            title: Text(item.name),
            subtitle: Text(item.price),
            trailing: IconButton(
              onPressed: () {
                cart.removeItem(item);
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
