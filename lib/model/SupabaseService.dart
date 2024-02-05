import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:testpickerbd/model/ImageModel.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:testpickerbd/model/ImageViewer.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class SupabaseService {
  final SupabaseClient _supabaseClient;
  static final String databaseName = 'UserData';
  String joinPaths(List<String> paths) {
    return paths.join('/');}

  SupabaseService()
      : _supabaseClient = SupabaseClient(
          'https://hyknbwhwrzrcjgefpvhv.supabase.co',
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh5a25id2h3cnpyY2pnZWZwdmh2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY2ODQ2NzMsImV4cCI6MjAyMjI2MDY3M30.u0RENNqmz4Ab5WmHnXHc8x-pbdlhN50fxgx6Bt-mAdE',
        
        );
        String joinUrlPaths(String baseUrl, String path) {
  return Uri.parse(baseUrl).resolve(path).toString();
       
}

//final supabase=Supabase.instance.client;
  Future<List<ImageViewer>> fetchImages() async {
    final response = await _supabaseClient.from('ImagesUsers').select().execute();
    if (response.error != null) {
      throw Exception(response.error?.message);
    }
  return response.data.map((item) => ImageModel.fromJson(item)).toList();
    }
}
    



