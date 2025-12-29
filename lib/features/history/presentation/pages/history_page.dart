import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../decision/domain/entities/decision_option.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for display
    final history = [
      DecisionOption(id: '1', title: 'Burger King', weight: 8),
      DecisionOption(id: '2', title: 'Evde Otur', weight: 5),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Geçmiş Kararlar'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: history.length,
        itemBuilder: (context, index) {
          final item = history[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.secondary.withOpacity(0.2),
                child: const Icon(Icons.history, color: AppColors.secondary),
              ),
              title: Text(item.title),
              subtitle: Text('Seçilen Ağırlık: ${item.weight.toInt()}'),
              trailing: const Text('Bugün'),
            ),
          );
        },
      ),
    );
  }
}
