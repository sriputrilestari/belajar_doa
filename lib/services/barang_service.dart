// file: lib/services/products_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apiflutter/models/barang_model.dart'; 

class ProductService {
  final String _baseUrl = 'https://dummyjson.com/products';

  Future<ganjil> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return ganjil.fromJson(jsonData);
      } else {
        throw Exception('Gagal memuat data produk. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Gagal terhubung ke server atau mem-parsing data: $e');
    }
  }
}