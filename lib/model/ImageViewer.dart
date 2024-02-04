import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:supabase/supabase.dart';
import 'package:testpickerbd/model/ImageModel.dart';
import 'package:testpickerbd/model/SupabaseService.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class ImageViewer extends StatelessWidget {
  final String imageUrl;
ImageViewer({required this.imageUrl, required String url});
 String get url => this.url;
@override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Viewer'),
      ),
      body: FutureBuilder<File>(
        future: DefaultCacheManager().getSingleFile(imageUrl),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Image.file(
              snapshot.data!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            );
          }
        },
      ),
    );
  }
  }
