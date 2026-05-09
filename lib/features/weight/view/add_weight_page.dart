import 'package:flutter/material.dart';
import 'package:bodybuilding_tracking/features/weight/data/weight_persistence.dart';
import 'package:bodybuilding_tracking/features/weight/model/weight.dart';
import 'package:bodybuilding_tracking/core/widgets/custom_text_field.dart';

class AddBodyWeightEntryPage extends StatefulWidget {
  const AddBodyWeightEntryPage({super.key});

  @override
  State<AddBodyWeightEntryPage> createState() => _AddBodyWeightEntryPageState();
}

class _AddBodyWeightEntryPageState extends State<AddBodyWeightEntryPage> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  late final WeightRepository _weightRepository;
  DateTime _selectedDate = DateTime.now();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _weightRepository = WeightRepository();
  }

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final double weight = double.parse(_weightController.text);
        final WeightEntry entry = WeightEntry(date: _selectedDate, weight: weight);

        await _weightRepository.addWeight(entry, _selectedDate);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Gewichtseintrag erfolgreich hinzugefügt!'), duration: Duration(seconds: 2)),
          );
          Navigator.pop(context, true);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Fehler: $e'),
              duration: const Duration(seconds: 2),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Gewichtseintrag hinzufügen'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Gewicht TextField
                CustomTextField(
                  controller: _weightController,
                  label: 'Gewicht (kg)',
                  hint: 'kg',
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Bitte geben Sie das Gewicht ein';
                    }
                    try {
                      double.parse(value);
                      return null;
                    } catch (e) {
                      return 'Bitte geben Sie eine gültige Nummer ein';
                    }
                  },
                  prefixIcon: const Icon(Icons.scale),
                ),
                const SizedBox(height: 24),

                // Datum Selector
                GestureDetector(
                  onTap: _selectDate,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainer,
                      border: Border.all(color: theme.colorScheme.primary.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today, color: theme.colorScheme.primary),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Datum',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${_selectedDate.day.toString().padLeft(2, '0')}.${_selectedDate.month.toString().padLeft(2, '0')}.${_selectedDate.year}',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios, color: theme.colorScheme.primary.withOpacity(0.6), size: 16),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Submit Button
                ElevatedButton(
                  onPressed: _isLoading ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    disabledBackgroundColor: theme.colorScheme.primary.withOpacity(0.5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text('Hinzufügen', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 16),

                // Cancel Button
                OutlinedButton(
                  onPressed: _isLoading ? null : () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: theme.colorScheme.primary),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Abbrechen', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
