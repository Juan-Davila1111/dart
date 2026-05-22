import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CampgroundPage(),
    );
  }
}

class CampgroundPage extends StatelessWidget {
  const CampgroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen superior
            Image.network(
              'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Título y rating
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Oeschinen Lake Campground',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Kandersteg, Switzerland',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '41',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Botones
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      ActionButton(
                        icon: Icons.call,
                        label: 'CALL',
                      ),
                      ActionButton(
                        icon: Icons.near_me,
                        label: 'ROUTE',
                      ),
                      ActionButton(
                        icon: Icons.share,
                        label: 'SHARE',
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Texto descripción
                  const Text(
                    'Lake Oeschinen lies at the foot of the Blüemlisalp '
                    'in the Bernese Alps. Situated 1,578 meters above sea '
                    'level, it is one of the larger Alpine Lakes. A gondola '
                    'ride from Kandersteg, followed by a half-hour walk '
                    'through pastures and pine forest, leads you to the lake, '
                    'which warms to 20 degrees Celsius in the summer. '
                    'Activities enjoyed here include rowing, and riding the '
                    'summer toboggan run.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 30,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}