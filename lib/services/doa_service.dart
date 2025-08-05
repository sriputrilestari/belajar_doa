import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apiflutter/models/doa_model.dart';

class DoaService {
  static const String apiUrl = 'https://doa-doa-api-ahmadramadhan.fly.dev/api';

  static Future<List<Doa>> fetchDoa() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Doa.fromJson(item)).toList();
    } else {
      throw Exception('Gagal load data doa');
    }
  }
}
