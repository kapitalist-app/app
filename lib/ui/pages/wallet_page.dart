import 'package:flutter/material.dart';

import 'package:kapitalist/blocs/bloc_provider.dart';
import 'package:kapitalist/blocs/kapitalist_bloc.dart';
import 'package:kapitalist/blocs/wallet_bloc.dart';
import 'package:kapitalist/models/wallet_creation_request.dart';
import 'package:kapitalist/ui/pages/drawer_page.dart';
import 'package:kapitalist/ui/widgets/drop_down_form_field.dart';
import 'package:kapitalist/ui/util.dart';

class WalletPage extends StatefulWidget {
  final WalletBloc bloc;

  WalletPage({
    Key key,
    @required this.bloc,
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

  void _onSubmit(BuildContext ctx) {
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
      widget.bloc.createWallet.add(req);
      Navigator.of(ctx).pop();
    }
  }

  @override
  Widget build(BuildContext ctx) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Add new Wallet'),
      ),
      body: Form(
        key: _keyForm,
        child: ListView(
          //padding: const EdgeInsets.symmetric(horizontal: 45.0),
          padding: const EdgeInsets.all(45.0),
          children: <Widget>[
            const SizedBox(height: 40.0),
            Util.buildTextFormField(
                _keyName, 'Wallet name', Icons.monetization_on, _validateName),
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
            Util.buildTextFormField(
                _keyBalance, 'Balance', Icons.account_balance, _validateBalance,
                inputType: TextInputType.number),
            const SizedBox(height: 15.0),
            Util.buildTextFormField(
                _keyColor, 'Color', Icons.color_lens, _validateColor),
            const SizedBox(height: 40.0),
            MaterialButton(
              child: Text('Add Wallet'),
              color: Colors.green,
              minWidth: 100.0,
              onPressed: () => _onSubmit(ctx),
            )
          ],
        ),
      ),
    );
  }
}
