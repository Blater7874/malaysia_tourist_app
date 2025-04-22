import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  final TextEditingController _amountController = TextEditingController();
  String _fromCurrency = 'USD';
  String _toCurrency = 'MYR';
  double? _result;
  bool _isLoading = false;
  String? _error;

  final List<String> _currencies = ['USD', 'EUR', 'MYR', 'JPY', 'GBP', 'CAD', 'AUD', 'CHF'];

  Future<void> convertCurrency() async {
    if (_amountController.text.isEmpty) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    final apiKey = '7c58b795b748a066a45c3718';
    final url = Uri.parse(
      'https://v6.exchangerate-api.com/v6/$apiKey/pair/$_fromCurrency/$_toCurrency',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['result'] == 'success') {
          double rate = data['conversion_rate'];
          setState(() {
            _result = double.parse(_amountController.text) * rate;
          });
        } else {
          setState(() {
            _error = 'Failed to fetch rate: ${data['error-type']}';
          });
        }
      } else {
        setState(() {
          _error = 'Network error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Something went wrong: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Currency converter card
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextField(
                        controller: _amountController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          labelText: 'Enter amount',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0x1A2196F3), // Hex with alpha (10% blue)
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildCurrencyDropdown(true),
                            const Icon(Icons.swap_horiz, size: 32, color: Colors.blue),
                            _buildCurrencyDropdown(false),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _isLoading ? null : convertCurrency,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          textStyle: const TextStyle(fontSize: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text('Convert'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              if (_error != null)
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xCCFF0000), // Hex with alpha (80% red)
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _error!,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                )
              else if (_result != null)
                Card(
                  margin: const EdgeInsets.only(top: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 8,
                  color: const Color(0xCC4CAF50), // Hex with alpha (80% green)
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      '${_amountController.text} $_fromCurrency = ${_result!.toStringAsFixed(2)} $_toCurrency',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrencyDropdown(bool isFrom) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButton<String>(
        value: isFrom ? _fromCurrency : _toCurrency,
        items: _currencies.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          if (newValue == null) return;
          setState(() {
            if (isFrom) {
              _fromCurrency = newValue;
            } else {
              _toCurrency = newValue;
            }
          });
        },
        underline: Container(), // Remove the default underline
        icon: const Icon(Icons.arrow_drop_down, color: Colors.blue),
      ),
    );
  }
}
