import 'package:flutter/material.dart';
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
      body: Consumer<RiskAssessmentModel>(
        builder: (context, model, child) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                const Text(
                  'Risk Assessment',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                for (var i = 0; i < hazardTypes.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ExpansionTile(
                      key: UniqueKey(),
                      backgroundColor: Colors.blue[50],
                      collapsedBackgroundColor: Colors.blue[50],
                      title: Text(hazardTypes[i]),
                      trailing: const Icon(Icons.arrow_drop_down),
                      initiallyExpanded: model.openHazardIndex == i,
                      onExpansionChanged: (expanded) {
                        if (expanded) {
                          model.toggleHazardExpansion(i);
                        } else {
                          model.toggleHazardExpansion(-1);
                        }
                      },
                      children: [
                        if (hazardTypes[i] == 'Chemical Hazard')
                          for (var j = 0; j < chemicalSubHazards.length; j++)
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
                                key: UniqueKey(),
                                title: Text(chemicalSubHazards[j]),
                                backgroundColor: Colors.white,
                                trailing: const Icon(Icons.arrow_drop_down),
                                initiallyExpanded:
                                    model.openSubHazardIndex == j,
                                onExpansionChanged: (expanded) {
                                  if (expanded) {
                                    model.toggleSubHazardExpansion(j);
                                  } else {
                                    model.toggleSubHazardExpansion(-1);
                                  }
                                },
                                children: [
                                  RiskFormWidget(
                                    model: model,
                                  ),
                                ],
                              ),
                            ),
                      ],
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
            ),
          );
        },
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 56,
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
                height: 56,
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
