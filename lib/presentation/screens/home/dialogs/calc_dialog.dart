import 'package:flutter/material.dart';

import '../../../../data/source/model/currency_model.dart';

class CalcDialog extends StatefulWidget {
  final CurrencyModel data;
  const CalcDialog({super.key, required this.data});

  @override
  State<CalcDialog> createState() => _CalcDialogState();
}

class _CalcDialogState extends State<CalcDialog> {
  final TextEditingController uzsController = TextEditingController();
  final TextEditingController ccyController = TextEditingController();
  bool isUzsToCcy = true; // Determines whether input is in UZS or CCY

  @override
  void initState() {
    uzsController.addListener(_uzsConvertListener);
    ccyController.addListener(_ccyConvertListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 240,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 56,
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xFFA9A8A8),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            keyboardType: TextInputType.number,
            controller: isUzsToCcy ? uzsController : ccyController,
            decoration: InputDecoration(
              labelText: isUzsToCcy ? 'UZS' : widget.data.ccy,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            readOnly: true,
            controller: isUzsToCcy ? ccyController : uzsController,
            decoration: InputDecoration(
              labelText: !isUzsToCcy ? 'UZS' : widget.data.ccy,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          IconButton(
            onPressed: () {
              setState(() {
                isUzsToCcy = !isUzsToCcy; // Toggle between UZS and CCY
              });
            },
            icon: const Icon(Icons.change_circle, size: 40, color: Colors.deepPurple,),
          ),
        ],
      ),
    );
  }

  void _uzsConvertListener() {
    if (uzsController.text.isNotEmpty) {
      double uzs = double.tryParse(uzsController.text) ?? 1;
      double ccy = uzs / double.tryParse(widget.data.rate!)!;

      ccyController.removeListener(_ccyConvertListener);
      ccyController.text = ccy.toStringAsFixed(2);
      ccyController.addListener(_ccyConvertListener);
    } else {
      ccyController.removeListener(_ccyConvertListener);
      ccyController.clear();
      ccyController.addListener(_ccyConvertListener);
    }
  }

  void _ccyConvertListener() {
    if (ccyController.text.isNotEmpty) {
      double ccy = double.tryParse(ccyController.text) ?? 1;
      double uzs = ccy * double.tryParse(widget.data.rate!)!;

      uzsController.removeListener(_uzsConvertListener);
      uzsController.text = uzs.toStringAsFixed(2);
      uzsController.addListener(_uzsConvertListener);
    } else {
      uzsController.removeListener(_uzsConvertListener);
      uzsController.clear();
      uzsController.addListener(_uzsConvertListener);
    }
  }
}
