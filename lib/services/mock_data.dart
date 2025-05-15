import 'package:upsa_app/models/course.dart';
import 'package:upsa_app/models/document.dart';

class MockData {
  static List<Course> getMyCourses() {
    return [
      Course(id: '1', name: 'Investigacion Operativa 2', code: 'MI325', docCount: 3),
      Course(id: '2', name: 'Programacion Aplicada', code: 'SI220', docCount: 7),
    ];
  }

  static List<Course> getPopularCourses() {
    return [
      Course(id: '3', name: 'Laboratorio de Redes', code: 'MI375', docCount: 23),
    ];
  }

  static List<Document> getRecentDocuments() {
    return [
      Document(
        id: '1',
        title: 'Guia de Algoritmos de Ordenamiento',
        courseName: 'Investigacion Operativa 2',
        fileUrl: '',
      ),
    ];
  }
}