import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_ufs/features/risk_assesment/providers/risk_assesment_provider.dart';
import 'package:test_ufs/widgets/custom_drop_down_button.dart';
import 'package:test_ufs/widgets/custom_textfield.dart';

class RiskFormWidget extends StatelessWidget {
  const RiskFormWidget({
    super.key,
    required this.model,
  });

  final RiskAssessmentModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  onChanged: (val) {
                    model.updateRiskDescription(val);
                  },
                  hintText: 'Risk Description',
                ),
              ),
              SizedBox(width: 24.w),
              Expanded(
                child: CustomTextField(
                  onChanged: (val) {
                    model.updateInitialScore(val);
                  },
                  hintText: 'Initial Score',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  onChanged: (val) {
                    model.updateGo(val);
                  },
                  hintText: 'Go',
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: CustomTextField(
                  onChanged: (val) {
                    model.updateMitigationMeasure(val);
                  },
                  hintText: 'Mitigation Measure',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  onChanged: (val) {
                    model.updateFinalScore(val);
                  },
                  hintText: 'Final Score',
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: CustomTextField(
                  onChanged: (val) {
                    model.updateNoGo(val);
                  },
                  hintText: 'No Go',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomDropDownButton(
            items: const [
              "Equipment 1",
              "Equipment 2",
              "Equipment 3",
            ],
            value: model.selectedEquipment,
            onChanged: (value) {
              model.updateSelectedEquipment(value);
            },
          ),
        ],
      ),
    );
  }
}
