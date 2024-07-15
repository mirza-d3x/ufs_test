import 'package:flutter/material.dart';
import 'package:test_ufs/constants/asset_icons/asset_icons.dart';

class RiskAssessmentScreen extends StatelessWidget {
  const RiskAssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(AssetIcon.hamburger),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            ExpansionTile(title: "")
          ],
        ),
      ),
    );
  }
}
