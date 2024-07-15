import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_ufs/features/risk_assesment/providers/risk_assesment_provider.dart';
import 'package:test_ufs/features/risk_assesment/ui/risk_assessment_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RiskAssessmentModel()),
      ],
      child: const UfsApp(),
    ),
  );
}

class UfsApp extends StatelessWidget {
  const UfsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1188, 834),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: RiskAssessmentScreen(),
      ),
    );
  }
}
