import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_ufs/screens/risk_assesment/risk_assessment_screen.dart';

void main() {
  runApp(const UfsApp());
}

class UfsApp extends StatelessWidget {
  const UfsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1188, 834),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const RiskAssessmentScreen(),
      ),
    );
  }
}
