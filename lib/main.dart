import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url:'https://hyknbwhwrzrcjgefpvhv.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh5a25id2h3cnpyY2pnZWZwdmh2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY2ODQ2NzMsImV4cCI6MjAyMjI2MDY3M30.u0RENNqmz4Ab5WmHnXHc8x-pbdlhN50fxgx6Bt-mAdE',
  );
   runApp(const MyApp());
}
final supabase=Supabase.instance.client;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
    home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
 @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
 late final SupabaseClient supabase;
late String _imageURL;

 
  List<Map<String, dynamic>> _imagesMeta = [];
void initState() {
    super.initState();
   _imageURL = supabase.storage.from('UserData').getPublicUrl('ImagesUsers')! as String;
      _fetchImagesMeta('UserData');
     }
      @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Просмотр изображения из Supabase Storage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imageURL.isNotEmpty
                ? Image.network(_imageURL)
                : Text('Изображение не найдено'),
          ],
        ),
      ),
    );
  }
  
 Future<void> _fetchImagesMeta(String UserData) async {
     final response = await supabase.from('UserData').select().execute();
//final storageResponse = await supabase.storage.from('ImagesUsers').upload('s5_cookedUp.png', localImageFile.Read(), cacheControl: '3600');
    if (response.error != null) {
      print('Ошибка при получении метаинформации: ${response.error!.message}');
    } else {
      setState(() {
        _imagesMeta = response.data as List<Map<String, dynamic>>;
      });
    }
 }
  void _openImage(String _imageURL) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            child: CachedNetworkImage(
              imageUrl: _imageURL,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        );
      },
    );
  }
}