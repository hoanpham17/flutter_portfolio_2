import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(ImageCarouselApp());
}

class ImageCarouselApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Carousel',
      home: ImageCarousel(),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentIndex = 0;
  final List<String> _imageUrls = [
    'assets/images/avatar1.png',
    'assets/images/avatar2.png',
    'assets/images/avatar3.png',
    'assets/images/avatar4.png',
    'assets/images/avatar5.png',
  ];

  void _previousImage() {
    setState(() {
      _currentIndex = (_currentIndex - 1) % _imageUrls.length;
      if (_currentIndex < 0) {
        _currentIndex = _imageUrls.length - 1;
      }
    });
  }

  void _nextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _imageUrls.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              _imageUrls[_currentIndex],
              fit: BoxFit.fitWidth,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 120,
                height: 70,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 3),
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFA4D8FF),
                ),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: _previousImage,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                width: 120,
                height: 70,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 3),
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFA4D8FF),
                ),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: _nextImage,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
