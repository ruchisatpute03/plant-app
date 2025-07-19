import 'package:flutter/material.dart';

void main() {
  runApp(PlantApp());
}

class PlantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant Store',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'name': 'Popular'},
    {'name': 'Outdoor'},
    {'name': 'Indoor'},
    {'name': 'Top Pick'},
  ];

  final List<Map<String, String>> plants = [
    {
      'name': 'Peace Lily',
      'price': '\$20',
      'image': 'assets/images/peace_lily.png'
    },
    {'name': 'Cactus', 'price': '\$25', 'image': 'assets/images/cactus.jpg'},
    {'name': 'Rose', 'price': '\$40', 'image': 'assets/images/rose.png'},
    {'name': 'Orchid', 'price': '\$30', 'image': 'assets/images/orchid.jpg'},
    {
      'name': 'Snake Plant',
      'price': '\$25',
      'image': 'assets/images/snake_plant.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting Header
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green[100],
                    child: Icon(Icons.person, color: Colors.green),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello Mia",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text("Take care of your plants!",
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 14)),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.shopping_cart_outlined, color: Colors.green),
                ],
              ),
              SizedBox(height: 20),

              // Search bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search plants",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Recently Viewed
              Text("Recently Viewed",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green[50],
                      backgroundImage: AssetImage('assets/images/orchid.jpg'),
                      radius: 20,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Orchid Cactus",
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        Text("Indoor Plant",
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 12)),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Categories
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 12),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: index == 0 ? Colors.green : Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          categories[index]['name']!,
                          style: TextStyle(
                            color: index == 0 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              // Plant Cards
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: plants.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailsScreen(plant: plants[index]),
                          ),
                        );
                      },
                      child: Container(
                        width: 160,
                        margin: EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200, blurRadius: 6),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.green[50],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Hero(
                                tag: plants[index]['image']!,
                                child: Image.asset(
                                  plants[index]['image']!,
                                  height: 100,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(plants[index]['name']!,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(plants[index]['price']!,
                                style: TextStyle(color: Colors.green)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              // Free Shipping Banner with Bike Illustration
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Free Shipping",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800]),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Above \$50",
                            style: TextStyle(
                                fontSize: 16, color: Colors.green[700]),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/bike.jpg',
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final Map<String, String> plant;
  DetailsScreen({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context)),
        actions: [
          Icon(Icons.favorite_border, color: Colors.green),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: plant['image']!,
                child: Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(plant['image']!, height: 200),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(plant['name']!,
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  Text("Indoor Plant", style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 10),
                  Text("Price: ${plant['price']!}",
                      style: TextStyle(color: Colors.green, fontSize: 20)),
                  SizedBox(height: 20),

                  // Stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(children: [
                        Icon(Icons.wb_sunny, color: Colors.orange),
                        Text("Light"),
                        Text("37%")
                      ]),
                      Column(children: [
                        Icon(Icons.water_drop, color: Colors.blue),
                        Text("Water"),
                        Text("2")
                      ]),
                      Column(children: [
                        Icon(Icons.thermostat, color: Colors.red),
                        Text("Temp"),
                        Text("25°C")
                      ]),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Description
                  Text("About ${plant['name']}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 8),
                  Text(
                      "The ${plant['name']} is known for its air-purifying abilities. It's great at breaking down and neutralizing toxins like carbon... Read More",
                      style: TextStyle(fontSize: 16)),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
