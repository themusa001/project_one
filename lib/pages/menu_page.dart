import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_one/models/popular.dart';
import 'package:project_one/models/special.dart';
import 'package:project_one/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<Popular> menuCategories = [
    Popular(
      name: 'Jollof Rice & Fried Chicken',
      price: '₦3,500',
      imagePath: 'assets/images/p1.png',
      description:
          'Our signature Jollof rice, served with crispy fried chicken and plantain.',
      icon: Icons.add,
      id: 1,
    ),

    Popular(
      name: 'Eba & Egusi Soup (Goat Mea)',
      price: '₦3,500',
      imagePath: 'assets/images/p2.png',
      description:
          'A rich and hearty Nigerian delicacy made with smooth, stretchy semolina swallow served alongside thick flavorful egusi soup.',
      icon: Icons.add,
      id: 2,
    ),

    Popular(
      name: 'Assorted Meat Pepper Soup',
      price: '₦3,500',
      imagePath: 'assets/images/p3.png',
      description:
          'A spicy and aromatic Nigerian classic made with a rich blend of traditional pepper soup spices.',
      icon: Icons.add,
      id: 3,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'Jollof Rice & Entrees',
      'Swallow & Soups',
      'Grills & sides',
      'Beverages',
      'Desserts',
    ];

    int _selectedIndex = 0;

    final size = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
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
                          'Chuks Kitchen',
                          style: GoogleFonts.inter(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 10),
                        Text(
                          'Chuks Kitchen Nigerian Home Cooking 4.8 (1.2k)',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            Text(
              'Menu Categories',
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 54,
              color: const Color(0xFFFFE1C4),
              child: Row(
                children: [
                  Container(width: 6, color: const Color(0xFFFF7A18)),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Popular',
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final isSelected = index == _selectedIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() => _selectedIndex = index);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Text(
                      categories[index],
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Popular',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ...menuCategories.map((popular) {
              return Container(
                margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      child: Image.asset(
                        popular.imagePath,
                        height: 140,
                        width: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            popular.name,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            popular.description,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '${popular.price}',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFF7A18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),

                    IconButton(
                      onPressed: () {
                        Provider.of<CartProvider>(
                          context,
                          listen: false,
                        ).addItem(
                          Special(
                            name: popular.name,
                            price: popular.price,
                            imagePath: popular.imagePath,
                            description: popular.description,
                            id: popular.id,
                          ),
                        );
                        Navigator.pushNamed(context, '/cartPage');
                      },
                      icon: Icon(popular.icon, color: Color(0xFFFF7A18)),
                    ),
                  ],
                ),
              );
            }).toList(),

            const SizedBox(height: 10),

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
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Jollof Rice & Entrees',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
            ...menuCategories.map((popular) {
              return Container(
                margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      child: Image.asset(
                        popular.imagePath,
                        height: 140,
                        width: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            popular.name,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            popular.description,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '${popular.price}',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFF7A18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),

                    IconButton(
                      onPressed: () {
                        Provider.of<CartProvider>(
                          context,
                          listen: false,
                        ).addItem(
                          Special(
                            name: popular.name,
                            price: popular.price,
                            imagePath: popular.imagePath,
                            description: popular.description,
                            id: popular.id,
                          ),
                        );
                        Navigator.pushNamed(context, '/cartPage');
                      },
                      icon: Icon(popular.icon, color: Color(0xFFFF7A18)),
                    ),
                  ],
                ),
              );
            }).toList(),

            const SizedBox(height: 10),

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
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Swallows & soup',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
            ...menuCategories.map((popular) {
              return Container(
                margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      child: Image.asset(
                        popular.imagePath,
                        height: 140,
                        width: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            popular.name,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            popular.description,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '${popular.price}',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFF7A18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),

                    IconButton(
                      onPressed: () {
                        Provider.of<CartProvider>(
                          context,
                          listen: false,
                        ).addItem(
                          Special(
                            name: popular.name,
                            price: popular.price,
                            imagePath: popular.imagePath,
                            description: popular.description,
                            id: popular.id,
                          ),
                        );
                        Navigator.pushNamed(context, '/cartPage');
                      },
                      icon: Icon(popular.icon, color: Color(0xFFFF7A18)),
                    ),
                  ],
                ),
              );
            }).toList(),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
