import '../../domain/entities/decision_option.dart';
import '../../domain/repositories/decision_repository.dart';

class MockDecisionRepository implements DecisionRepository {
  final List<DecisionOption> _history = [];

  @override
  Future<List<DecisionOption>> getSavedTemplates() async {
    await Future.delayed(const Duration(milliseconds: 800)); // Simulate network
    return [
      DecisionOption(id: '1', title: 'Pizza', weight: 8),
      DecisionOption(id: '2', title: 'Hamburger', weight: 5),
      DecisionOption(id: '3', title: 'Salata', weight: 2),
    ];
  }

  @override
  Future<void> saveDecisionHistory(DecisionOption selectedOption) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _history.add(selectedOption);
    // In a real app, this would push to Firestore
  }
  
  // Extra method for local history display
  List<DecisionOption> getLocalHistory() {
    return List.unmodifiable(_history);
  }
}
