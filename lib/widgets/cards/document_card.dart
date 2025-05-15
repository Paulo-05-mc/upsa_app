import 'package:flutter/material.dart';
import '../../models/document.dart';

class DocumentCard extends StatelessWidget {
  final Document document;

  const DocumentCard({super.key, required this.document, required int index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.description),
        title: Text(document.title),
        subtitle: Text(document.courseName),
        trailing: const Icon(Icons.download),
      ),
    );
  }
}