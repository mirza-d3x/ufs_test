import 'package:flutter/material.dart';

class RiskAssessmentModel extends ChangeNotifier {
  String? selectedHazard;
  String? selectedSubHazard;
  String selectedEquipment = 'Equipment 1';
  String riskDescription = '';
  String initialScore = '';
  String go = '';
  String mitigationMeasure = '';
  String finalScore = '';
  String noGo = '';
  String notes = '';

  void updateSelectedHazard(String? hazard) {
    selectedHazard = hazard;
    notifyListeners();
  }

  void updateSelectedSubHazard(String? subHazard) {
    selectedSubHazard = subHazard;
    notifyListeners();
  }

  void updateSelectedEquipment(String? equipment) {
    selectedEquipment = equipment!;
    notifyListeners();
  }

  void updateRiskDescription(String description) {
    riskDescription = description;
    notifyListeners();
  }

  void updateInitialScore(String score) {
    initialScore = score;
    notifyListeners();
  }

  void updateGo(String value) {
    go = value;
    notifyListeners();
  }

  void updateMitigationMeasure(String measure) {
    mitigationMeasure = measure;
    notifyListeners();
  }

  void updateFinalScore(String score) {
    finalScore = score;
    notifyListeners();
  }

  void updateNoGo(String value) {
    noGo = value;
    notifyListeners();
  }

  void updateNotes(String value) {
    notes = value;
    notifyListeners();
  }
}
