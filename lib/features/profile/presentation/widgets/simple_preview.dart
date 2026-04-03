import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

@Preview(name: 'Simple Text')
Widget previewSimpleText() {
  return const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Text('Hello Preview'),
      ),
    ),
  );
}