import 'dart:math';
import '../entities/decision_option.dart';

class WeightedRandomSelector {
  final Random _random = Random();

  /// Selects an option from the list based on their weights.
  /// Returns null if list is empty.
  DecisionOption? selectOption(List<DecisionOption> options) {
    if (options.isEmpty) return null;

    // Calculate total weight
    double totalWeight = options.fold(0, (sum, item) => sum + item.weight);
    
    // Generate a random value between 0 and totalWeight
    double randomValue = _random.nextDouble() * totalWeight;
    
    // Iterate through options to find the selected one
    double currentSum = 0;
    for (var option in options) {
      currentSum += option.weight;
      if (randomValue <= currentSum) {
        return option;
      }
    }
    
    // Fallback (should ideally not reach here if logic is correct)
    return options.last;
  }
}
