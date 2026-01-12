import 'package:flutter/material.dart'; 
import 'package:dio/dio.dart';
import 'dart:math'; 
 
void main() { 
  runApp(MyApp()); 
} 
 
class MyApp extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: 'Imagens Aleatórias', 
      home: ImageScreen(),
      debugShowCheckedModeBanner: false,
    ); 
  } 
}

class ImageModel {
  final String imageUrl;

  ImageModel({required this.imageUrl});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel (
        imageUrl: "https://picsum.photos/id/${json['id']}/500/300",
      );
  }
}
 
class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override 
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  final Dio _dio = Dio();
  final String _apiUrl = 'https://picsum.photos/v2/list?page=1&limit10';
  List<ImageModel> _images = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    setState(() => _isLoading = true);
    int randomPage = Random().nextInt(100) + 1; // Gera um número de página aleatória entre 1 e 100

    try {
      final response = await _dio.get('https://picsum.photos/v2/list?page=$randomPage&limit=8');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        setState(() {
          _images = data.map((json) => ImageModel.fromJson(json)).toList();
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() => _isLoading = false);
      print("Erro ao carregar imagens: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Imagens Aleatórias")),
      body: _isLoading
      ? const Center(child: CircularProgressIndicator())
      : GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _images.length,
        itemBuilder:(context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child : Image.network(
              _images[index].imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: Icon(Icons.error, size: 50));
              }
            )
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadImages,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}