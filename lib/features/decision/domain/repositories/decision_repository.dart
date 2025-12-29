import '../entities/decision_option.dart';

abstract class DecisionRepository {
  Future<void> saveDecisionHistory(DecisionOption selectedOption);
  Future<List<DecisionOption>> getSavedTemplates();
}
