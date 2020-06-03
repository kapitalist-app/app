import 'package:flutter/material.dart';

import 'package:business/business.dart';

import 'package:kapitalist/ui/util.dart';

typedef WalletCreationCallback = void Function(WalletCreationRequest);

class WalletPage extends StatefulWidget {
  final WalletCreationCallback onSubmit;

  WalletPage({
    Key key,
    @required this.onSubmit,
  }) : super(key: key ?? null);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  // Keys
  final _keyForm = new GlobalKey<FormState>();
  final _keyName = new GlobalKey<FormFieldState<String>>();
  final _keyType = new GlobalKey<FormFieldState<String>>();
  final _keyBalance = new GlobalKey<FormFieldState<String>>();
  final _keyColor = new GlobalKey<FormFieldState<String>>();

  String _walletType;

  // XXX: Extract this
  // Validators
  String _validateName(String name) =>
      name.isEmpty ? 'Wallet name cannot be empty' : null;

  String _validateType(String type) =>
      type.isEmpty ? 'Wallet type must be set' : null;

  String _validateBalance(String balance) =>
      int.tryParse(balance) == null ? 'Balance must be an integer' : null;

  String _validateColor(String color) => int.tryParse(color, radix: 16) == null
      ? 'Color must be given in hexadecimal'
      : null;

  void _handleSubmit(BuildContext ctx) {
    final form = _keyForm.currentState;

    if (form.validate()) {
      final name = _keyName.currentState.value;
      final type = _keyType.currentState.value;
      final balance = int.parse(_keyBalance.currentState.value);
      final color = _keyColor.currentState.value;

      final req = WalletCreationRequest((b) => b
        ..name = name
        ..walletType = type
        ..balance = balance
        ..color = color);
      this.widget.onSubmit(req);
      Navigator.of(ctx).pop();
    }
  }

  @override
  Widget build(BuildContext ctx) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Add/Edit Wallet'),
      ),
      body: Form(
        key: _keyForm,
        child: ListView(
          //padding: const EdgeInsets.symmetric(horizontal: 45.0),
          padding: const EdgeInsets.all(45.0),
          children: <Widget>[
            const SizedBox(height: 40.0),
            UiUtil.buildTextFormField(
              _keyName,
              'Wallet name',
              _validateName,
              icon: Icons.monetization_on,
            ),
            const SizedBox(height: 15.0),
            DropdownButtonFormField(
                key: _keyType,
                value: _walletType,
                items: ['Cash', 'Checking', 'Credit Card'].map((v) {
                  return DropdownMenuItem(value: v, child: Text(v));
                }).toList(),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.account_balance_wallet),
                ),
                onChanged: (val) => setState(() => _walletType = val),
                validator: _validateType),
            const SizedBox(height: 15.0),
            UiUtil.buildTextFormField(
              _keyBalance,
              'Balance',
              _validateBalance,
              icon: Icons.account_balance,
              inputType:
                  TextInputType.numberWithOptions(signed: true, decimal: false),
            ),
            const SizedBox(height: 15.0),
            UiUtil.buildTextFormField(
              _keyColor,
              'Color',
              _validateColor,
              icon: Icons.color_lens,
            ),
            const SizedBox(height: 40.0),
            MaterialButton(
              child: Text('Add Wallet'),
              color: Colors.green,
              minWidth: 100.0,
              onPressed: () => _handleSubmit(ctx),
            )
          ],
        ),
      ),
    );
  }
}
