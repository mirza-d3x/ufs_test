import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_ufs/constants/asset_icons/asset_icons.dart';
import 'package:test_ufs/features/risk_assesment/providers/risk_assesment_provider.dart';
import 'package:test_ufs/widgets/custom_textfield.dart';
import 'package:test_ufs/widgets/risk_format_widget.dart';

class RiskAssessmentScreen extends StatelessWidget {
  RiskAssessmentScreen({super.key});

  final List<String> hazardTypes = [
    'Physical Hazard',
    'Safety Hazard',
    'Chemical Hazard',
    'Biological Hazard',
    'Ergonomics Hazard'
  ];

  final List<String> chemicalSubHazards = [
    'Cleaning Products',
    'Pesticide',
    'Asbestos'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(AppIcons.hamburger),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<RiskAssessmentModel>(
          builder: (context, model, child) {
            return ListView(
              children: [
                const Text(
                  'Risk Assessment',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                for (var hazard in hazardTypes)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ExpansionTile(
                      backgroundColor: Colors.blue[50],
                      collapsedBackgroundColor: Colors.blue[50],
                      title: Text(hazard),
                      trailing: const Icon(Icons.arrow_drop_down),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide.none,
                      ),
                      collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide.none,
                      ),
                      children: [
                        if (hazard == 'Chemical Hazard')
                          for (var subHazard in chemicalSubHazards)
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(.9),
                                    offset: const Offset(1, 0),
                                  ),
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(.9),
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: ExpansionTile(
                                title: Text(subHazard),
                                backgroundColor: Colors.white,
                                trailing: const Icon(Icons.arrow_drop_down),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: BorderSide.none,
                                ),
                                children: [
                                  RiskFormWidget(
                                    model: model,
                                  ),
                                ],
                                onExpansionChanged: (expanded) {
                                  if (expanded) {
                                    model.updateSelectedSubHazard(subHazard);
                                  }
                                },
                              ),
                            ),
                      ],
                      onExpansionChanged: (expanded) {
                        if (expanded) {
                          model.updateSelectedHazard(hazard);
                        }
                      },
                    ),
                  ),
                CustomTextField(
                  onChanged: (val) {
                    model.updateNotes(val);
                  },
                  hintText: 'Enter Notes',
                  maxLines: 4,
                ),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 56.h,
                color: const Color(0xffFFF1CD),
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 56.h,
                color: const Color(0xffE5AA17),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
