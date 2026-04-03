import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class CommonView extends StatelessWidget {
  final String title;

  const CommonView({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

@Preview(name: 'CommonView Default')
Widget previewCommonView() {
  return MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: const Center(
        child: CommonView(title: 'Demo common view'),
      ),
    ),
  );
}