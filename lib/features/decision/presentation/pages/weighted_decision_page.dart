import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/decision_option.dart';
import '../../domain/logic/weighted_random_selector.dart';

class WeightedDecisionPage extends StatefulWidget {
  const WeightedDecisionPage({super.key});

  @override
  State<WeightedDecisionPage> createState() => _WeightedDecisionPageState();
}

class _WeightedDecisionPageState extends State<WeightedDecisionPage> with SingleTickerProviderStateMixin {
  final List<DecisionOption> _options = [];
  final TextEditingController _textController = TextEditingController();
  final WeightedRandomSelector _selector = WeightedRandomSelector();
  
  double _currentWeight = 5.0;
  bool _isAnimating = false;
  
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _addOption() {
    if (_textController.text.isEmpty) return;

    setState(() {
      _options.add(DecisionOption(
        id: DateTime.now().toString(),
        title: _textController.text,
        weight: _currentWeight,
      ));
      _textController.clear();
      _currentWeight = 5.0; // Reset to default
    });
  }

  void _removeOption(int index) {
    setState(() {
      _options.removeAt(index);
    });
  }

  void _decide() async {
    if (_options.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen en az bir seçenek ekleyin!')),
      );
      return;
    }

    setState(() {
      _isAnimating = true;
    });

    // Simulate complex calculation wait
    await Future.delayed(const Duration(seconds: 1));
    await _controller.forward(from: 0).then((_) => _controller.reverse());

    final result = _selector.selectOption(_options);

    setState(() {
      _isAnimating = false;
    });

    if (mounted && result != null) {
      _showResultDialog(result);
    }
  }

  void _showResultDialog(DecisionOption option) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Seçim Yapıldı!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle_outline, size: 60, color: AppColors.success),
            const SizedBox(height: 16),
            Text(
              option.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Ağırlık Puanı: ${option.weight.toStringAsFixed(0)}',
              style: const TextStyle(color: AppColors.textSecondary),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ağırlıklı Seçim'),
      ),
      body: Column(
        children: [
          // Input Area
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: 'Seçenek Ekle',
                    filled: true,
                    fillColor: AppColors.background,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.add_circle, color: AppColors.primary, size: 32),
                      onPressed: _addOption,
                    ),
                  ),
                  onSubmitted: (_) => _addOption(),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('Olasılık Puanı:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Slider(
                        value: _currentWeight,
                        min: 1,
                        max: 10,
                        divisions: 9,
                        label: _currentWeight.round().toString(),
                        activeColor: AppColors.secondary,
                        onChanged: (val) {
                          setState(() {
                            _currentWeight = val;
                          });
                        },
                      ),
                    ),
                    Text(
                      _currentWeight.toStringAsFixed(0),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // List Area
          Expanded(
            child: _options.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.list_alt_rounded, size: 64, color: Colors.grey[300]),
                        const SizedBox(height: 16),
                        Text(
                          'Henüz seçenek eklemediniz',
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _options.length,
                    itemBuilder: (context, index) {
                      final option = _options[index];
                      return Dismissible(
                        key: Key(option.id),
                        onDismissed: (_) => _removeOption(index),
                        background: Container(
                          color: Colors.red[100],
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 16),
                          child: const Icon(Icons.delete, color: Colors.red),
                        ),
                        child: Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: ListTile(
                            title: Text(option.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                            trailing: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.secondary.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'Puan: ${option.weight.toInt()}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: _options.length > 1
          ? FloatingActionButton.extended(
              onPressed: _isAnimating ? null : _decide,
              backgroundColor: AppColors.primary,
              icon: _isAnimating 
                  ? const SizedBox(
                      width: 24, 
                      height: 24, 
                      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                    )
                  : const Icon(Icons.casino),
              label: Text(_isAnimating ? 'Seçiliyor...' : 'KARAR VER'),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
