// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Info'),
      ),
      body: SafeArea(
        child: Container(
          child: const Center(child: Text('Nguyen Quoc Khanh')),
        ),
      ),
    );
  }
}
