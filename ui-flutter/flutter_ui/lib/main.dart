import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Colors.white,

        body: Center(
          child: Container(
            width: 900,
            height: 500,
            padding: EdgeInsets.all(10),
            

            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),

            child: Row(
              children: [
                Expanded(
                  flex: 1,

                  child: Container(
                    color: const Color(0xffE5E7EB),
                    padding: const EdgeInsets.all(20),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          color: Colors.white70,

                          child: const Text(
                            "Salchipapas",
                            textAlign: TextAlign.center,

                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        const Text(
                          "Comida callejera por excelencia hecha de papas doraditas crujientes y salchicha picada, acompañada de un sin fin de salsas que le dan ese toque especial. Ideal para cuando estamos en la casa sin querer cocinar y queremos algo rico y rápido.",

                          textAlign: TextAlign.center,

                          style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                          ),
                        ),

                        const SizedBox(height: 15),

                        // REVIEWS
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),

                          color: Colors.white70,

                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,

                            children: [
                              Row(
                                children: List.generate(
                                  5,
                                  (index) => const Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 20,
                                  ),
                                ),
                              ),

                              const Text(
                                "5 Estrellas",

                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 15),

                        // INFO INFERIOR
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 18),

                          color: Colors.white70,

                          child: const Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,

                            children: [
                              InfoItem(
                                icon: Icons.fastfood,
                                title: "PREPARACIÓN:",
                                value: "15 min",
                              ),

                              InfoItem(
                                icon: Icons.local_fire_department,
                                title: "COCCIÓN:",
                                value: "20 min",
                              ),

                              InfoItem(
                                icon: Icons.people,
                                title: "PERSONAS:",
                                value: "1 - *",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // IMAGEN DERECHA
                Expanded(
                  flex: 2,

                  child: Image.asset(
                    "assets/images/salchipapas.jpg",

                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const InfoItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        Icon(
          icon,
          color: Colors.green,
          size: 28,
        ),

        const SizedBox(height: 8),

        Text(
          title,

          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),

        const SizedBox(height: 5),

        Text(
          value,

          style: const TextStyle(
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}