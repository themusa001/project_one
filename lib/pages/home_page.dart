import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_one/models/food.dart';
import 'package:project_one/models/special.dart';
import 'package:project_one/providers/cart_provider.dart';
import 'package:project_one/widgets/add_to_cart_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Food> popularCategory = [
    Food(name: 'Jollof Delight', imagePath: 'assets/images/jollof.png'),
    Food(name: 'Swallow & Soups', imagePath: 'assets/images/swallow.png'),
    Food(name: 'Grills & BBQ', imagePath: 'assets/images/BBQ.png'),
  ];

  List<Special> chefsSpecial = [
    Special(
      name: 'Jollof Rice & Fried Chicken',
      imagePath: 'assets/images/jollof.png',
      description:
          'Our signature Jollof rice, cooked to perfection, served with succulent fried chicken.',
      price: '₦3,500',
      id: 1,
    ),
    Special(
      name: 'Spicy Tilapia Pepper Soup',
      imagePath: 'assets/images/tilapia.png',
      description:
          'A comforting and spicy soup with tender tilapia fish, a true Nigerian delicacy.',
      price: '₦3,500',
      id: 2,
    ),
    Special(
      name: 'Semo & Soups',
      imagePath: 'assets/images/swallow.png',
      description:
          'Smooth, stretchy semo served with rich, flavorful Nigerian soup made with fresh ingredients and traditional spices.',
      price: '₦3,500',
      id: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.size.height / 1.5,
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        opacity: 0.45,
                        image: AssetImage('assets/images/food.png'),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'The Heart of Nigerian Home Cooking',
                          style: GoogleFonts.inter(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Handcrafted with passion, delivered with care.',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 23,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF7A18),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Discover what’s new',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: size.size.height / 350,
                    left: 20,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'What are you craving for today?',
                          hintStyle: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),

            // Display categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Popular Categories',
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  ...popularCategory.map((category) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                            child: Image.asset(
                              category.imagePath,
                              width: double.infinity,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            category.name,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'View All Categories',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1E88E5),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Chef\'s Special',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                ...chefsSpecial.map((special) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                            child: Image.asset(
                              special.imagePath,
                              width: double.infinity,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            special.name,
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(height: 12),

                          Text(
                            special.description,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(height: 12),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${special.price}",
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFFF7A18),
                                ),
                              ),
                              AddToCartButton(
                                onTap: () {
                                  Provider.of<CartProvider>(
                                    context,
                                    listen: false,
                                  ).addItem(special);
                                  Navigator.pushNamed(context, '/cartPage');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
            const SizedBox(height: 30),

            Align(
              alignment: Alignment.center,
              child: Text(
                'View All Categories',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF1E88E5),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      opacity: 0.45,
                      image: AssetImage('assets/images/advert.png'),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Introducing Our New Menu Additions!',
                        style: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '''Explore exciting new dishes, crafted with the freshest ingredients and authentic Nigerian flavors. Limited time offer!''',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF7A18),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, '/menuPage'),
                          child: Text(
                            'Discover what’s new',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
