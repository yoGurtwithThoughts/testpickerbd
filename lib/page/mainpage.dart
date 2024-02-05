import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:supabase/supabase.dart';
import 'package:testpickerbd/model/ImageModel.dart';
import 'package:testpickerbd/model/ImageViewer.dart';
import 'package:testpickerbd/model/SupabaseService.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
 void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url:'https://hyknbwhwrzrcjgefpvhv.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh5a25id2h3cnpyY2pnZWZwdmh2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY2ODQ2NzMsImV4cCI6MjAyMjI2MDY3M30.u0RENNqmz4Ab5WmHnXHc8x-pbdlhN50fxgx6Bt-mAdE',
  );
WidgetsFlutterBinding.ensureInitialized();
  final database = await openDatabase('UserData');
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageDisplay(),
    );
  }
}
class ImageDisplay extends StatefulWidget {
  @override
  _ImageDisplayState createState() => _ImageDisplayState();
}

class _ImageDisplayState extends State<ImageDisplay> {
  
   String imageUrl='https://hyknbwhwrzrcjgefpvhv.supabase.co/storage/v1/object/public/ImagesUsers/s1_Onboarding%201.png';
  final SupabaseService _supabaseService = SupabaseService();
  @override
void initState() {
    super.initState();
}
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Image from Supabase'),
      ),
      body: imageUrl != null
          ? Image.network(
            imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
            )
          : Center(child: CircularProgressIndicator()),
          
    );
  }




// Widget build (BuildContext context){
//   return MaterialApp(
//     debugShowCheckedModeBanner: false,
//   home: FutureBuilder<List<ImageViewer>>(
//     future: _supabaseService.fetchImages(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             final images = snapshot.data!;
//             return ImageViewer(imageUrl: images.first.url, url: 'http://example.com/image.jpg',);
//           }
//         },
//       ),
//   );
// }
}