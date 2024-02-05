import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:supabase/supabase.dart';
import 'package:testpickerbd/model/ImageModel.dart';
import 'package:testpickerbd/model/SupabaseService.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:testpickerbd/page/mainpage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:cached_network_image/cached_network_image.dart';


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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
    home:  ImageDisplay(),
    );
  }
}

