import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class QuickDecisionPage extends StatefulWidget {
  const QuickDecisionPage({super.key});

  @override
  State<QuickDecisionPage> createState() => _QuickDecisionPageState();
}

class _QuickDecisionPageState extends State<QuickDecisionPage> with SingleTickerProviderStateMixin {
  final TextEditingController _option1Controller = TextEditingController();
  final TextEditingController _option2Controller = TextEditingController();
  
  String? _result;
  bool _isAnimating = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _option1Controller.dispose();
    _option2Controller.dispose();
    super.dispose();
  }

  void _decide() async {
    if (_option1Controller.text.isEmpty || _option2Controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen her iki seçeneği de girin!')),
      );
      return;
    }

    setState(() {
      _isAnimating = true;
      _result = null;
    });

    // Simulate thinking
    await _controller.forward(from: 0).then((_) => _controller.reverse());
    
    final random = Random();
    final isOption1 = random.nextBool();

    setState(() {
      _isAnimating = false;
      _result = isOption1 ? _option1Controller.text : _option2Controller.text;
    });

    if (mounted) {
      _showResultDialog();
    }
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Kazanan!'),
        content: Text(
          _result!,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
          textAlign: TextAlign.center,
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
        title: const Text('Hızlı Karar'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildTextField(_option1Controller, 'Seçenek 1', Icons.looks_one_rounded),
            const SizedBox(height: 20),
            const Text(
              'VS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary,
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField(_option2Controller, 'Seçenek 2', Icons.looks_two_rounded),
            const SizedBox(height: 48),
            
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: _isAnimating ? null : _decide,
                child: _isAnimating 
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Karar Ver!'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppColors.primary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
