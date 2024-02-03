import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class SupabaseService {
  final SupabaseClient _supabaseClient;

  SupabaseService()
      : _supabaseClient = SupabaseClient(
          'your-supabase-url',
          'your-supabase-anon-key',
        );

  Future<List<ImageModel>> fetchImages() async {
    final response = await _supabaseClient.from('images').select().execute();
    if (response.error != null) {
      throw Exception(response.error.message);
    }
    return response.data.map((item) => ImageModel.fromJson(item)).toList();
  }
}
class ImageModel {
  final String id;
  final String url;

  ImageModel({required this.id, required this.url});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      url: json['url'],
    );
  }
}
