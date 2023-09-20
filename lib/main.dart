import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rafi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Aplikasi Rafi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  late List<Widget> _pages;

  final List<String> _imageUrls = [
    'lib/assets/Rafi-1.png',
    'lib/assets/Rafi-2.png',
    'lib/assets/Rafi-3.png',
  ];

  final List<String> _rekomendasiImageUrls = [
    'lib/assets/image/hero-1.jpeg',
    'lib/assets/image/hero-3.jpeg',
    'lib/assets/image/hero-2.jpeg',
    'lib/assets/image/hero-6.jpeg',
    'lib/assets/image/hero-4.jpeg',
    'lib/assets/image/hero-5.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    _pages = [HomeContent(_imageUrls), FavoritesContent(), ProfileContent()];
  }

  void _incrementCounter() {
    setState(() {
      _currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final List<String> imageUrls;

  HomeContent(this.imageUrls);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            autoPlayCurve: Curves.fastOutSlowIn,
            aspectRatio: 16 / 9,
            enlargeCenterPage: true,
          ),
          items: imageUrls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Image.asset(
                    url,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
        ),
        // Widget lainnya di bawah carousel
        // ...
      ],
    );
  }
}



class FavoritesContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favorites Page Content'),
    );
  }
}

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Page Content'),
    );
  }
}
