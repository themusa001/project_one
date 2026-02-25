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
          return Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    item.imagePath,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0xFFBDBDBD),
                            ),
                            child: Icon(Icons.add),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '1',
                            style: GoogleFonts.inter(
                              fontSize: 20.74,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0xFFBDBDBD),
                            ),
                            child: Icon(Icons.remove),
                          ),
                        ],
                      ),

                      SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.price,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFF7A18),
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              cart.removeItem(item);
                            },
                            icon: Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
