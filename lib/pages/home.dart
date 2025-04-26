import 'package:flutter/material.dart';
import 'background_layout.dart';
import 'game.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundLayout(
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 20,
        childAspectRatio: 0.85,
        padding: const EdgeInsets.all(20),
        children: [
          CategoryCard(
            title: 'Rap',
            imagePath: 'assets/images/rap.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Game()),
              );             },
          ),
          CategoryCard(
            title: 'Raï',
            imagePath: 'assets/images/rai.jpg',
            onTap: () {
                        },
          ),
          CategoryCard(
            title: 'Pop',
            imagePath: 'assets/images/pop.jpg',
            onTap: () {
              // NAVIGATIOOOOOON
            },
          ),
          CategoryCard(
            title: 'R&B',
            imagePath: 'assets/images/rb.png',
            onTap: () {
              // NAVIGATIOOOOOON
            },
          ),
          CategoryCard(
            title: "2000's",
            imagePath: 'assets/images/2000.png',
            onTap: () {
              // NAVIGATIOOOOOON
            },
          ),
          CategoryCard(
            title: 'Rock',
            imagePath: 'assets/images/rock.jpg',
            onTap: () {
              // NAVIGATIOOOOOON
            },
          ),
        ]
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 8.0,
                      color: Colors.black,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
