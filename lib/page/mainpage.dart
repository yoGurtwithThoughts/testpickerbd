import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:supabase/supabase.dart';
import 'package:testpickerbd/model/ImageModel.dart';
import 'package:testpickerbd/model/ImageViewer.dart';
import 'package:testpickerbd/model/SupabaseService.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
 void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url:'https://hyknbwhwrzrcjgefpvhv.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh5a25id2h3cnpyY2pnZWZwdmh2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY2ODQ2NzMsImV4cCI6MjAyMjI2MDY3M30.u0RENNqmz4Ab5WmHnXHc8x-pbdlhN50fxgx6Bt-mAdE',
  );

}
final supabase=Supabase.instance.client;
class HomePage extends StatelessWidget{
  final SupabaseService _supabaseService = SupabaseService();
  @override
Widget build (BuildContext context){
  return MaterialApp(
  home: FutureBuilder<List<ImageViewer>>(
    future: _supabaseService.fetchImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final images = snapshot.data!;
            return ImageViewer(imageUrl: images.first.url, url: 'http://example.com/image.jpg',);
          }
        },
      ),
  );
}
}