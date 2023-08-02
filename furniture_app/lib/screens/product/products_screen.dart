import 'package:flutter/material.dart';

import '../../constants.dart';
import '../info_screen.dart';
import 'components/body.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(context),
      body: const Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: const Text('Dashboard'),
      centerTitle: false,
      actions: [
        IconButton(
          icon: Image.asset('assets/images/me.jpg', height: 40),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const InfoScreen()));
          },
        ),
      ],
    );
  }
}
