import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/course.dart';
import '../models/document.dart';

class ApiService {
  final String _baseUrl = 'https://tu-api.com';

  Future<List<Course>> fetchCourses() async {
    final response = await http.get(Uri.parse('$_baseUrl/courses'));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((item) => Course.fromJson(item))
          .toList();
    } else {
      throw Exception('Error al cargar cursos');
    }
  }

  // Método adicional para documentos (opcional)
  Future<List<Document>> fetchDocuments() async {
    final response = await http.get(Uri.parse('$_baseUrl/documents'));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((item) => Document.fromJson(item))
          .toList();
    } else {
      throw Exception('Error al cargar documentos');
    }
  }
}