import 'package:flutter/material.dart';
import 'package:kapitalist/models/api/api.dart';

import 'package:business/business.dart';

import 'package:kapitalist/ui/util.dart';

typedef TransactionCreationCallback = void Function(TransactionCreationRequest);

class TransactionPage extends StatefulWidget {
  final List<Wallet> wallets;
  final List<Category> categories;
  final TransactionCreationCallback onSubmit;

  const TransactionPage(
      {Key key,
      @required this.wallets,
      @required this.categories,
      @required this.onSubmit})
      : super(key: key);

  @override
  _TransactionPageState createState() {
    return new _TransactionPageState();
  }
}

class _TransactionPageState extends State<TransactionPage> {
  // Keys
  final _keyForm = new GlobalKey<FormState>();
  final _keyWallet = new GlobalKey<FormFieldState<Wallet>>();
  final _keyCategory = new GlobalKey<FormFieldState<Category>>();
  final _keyName = new GlobalKey<FormFieldState<String>>();
  final _keyAmount = new GlobalKey<FormFieldState<String>>();
  final _keyTimestamp = new GlobalKey<FormFieldState<String>>();

  Wallet _wallet;
  Category _category;

  // XXX: Extract this
  // Validators
  String _validateAmount(String amount) =>
      int.tryParse(amount) == null ? 'Amount must be an integer' : null;

  void _onSubmit(BuildContext ctx) {
    final form = _keyForm.currentState;

    if (form.validate()) {
      final wallet = _keyWallet.currentState.value;
      final category = _keyCategory.currentState.value;
      final name = _keyName.currentState.value;
      final amount = int.parse(_keyAmount.currentState.value);
      final timestamp =
          DateTime.tryParse(_keyTimestamp.currentState?.value)?.toUtc();

      final req = TransactionCreationRequest((b) => b
        ..walletId = wallet.id
        ..categoryId = category.id
        ..name = name
        ..amount = amount
        ..timestamp = timestamp);
      this.widget.onSubmit(req);
    }
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add/Edit Transaction'),
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
              'Name',
              (val) => val == null ? 'Name cannot be empty' : null,
              icon: Icons.assignment,
              inputType: TextInputType.text,
            ),
            DropdownButtonFormField(
                key: _keyWallet,
                value: _wallet,
                items: this.widget.wallets.map<DropdownMenuItem<Wallet>>((w) {
                  return DropdownMenuItem(value: w, child: Text(w.name));
                }).toList(),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.account_balance_wallet),
                ),
                onChanged: (val) => setState(() => _wallet = val),
                validator: (val) =>
                    val == null ? 'Wallet cannot be empty' : null),
            DropdownButtonFormField(
                key: _keyCategory,
                value: _category,
                items: this.widget.categories.map<DropdownMenuItem<Category>>((c) {
                  return DropdownMenuItem(value: c, child: Text(c.name));
                }).toList(),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.adjust),
                ),
                onChanged: (val) => setState(() => _category = val),
                validator: (val) =>
                    val == null ? 'Category cannot be empty' : null),
            const SizedBox(height: 15.0),
            UiUtil.buildTextFormField(
              _keyAmount,
              'Amount',
              _validateAmount,
              icon: Icons.account_balance,
              inputType:
                  TextInputType.numberWithOptions(signed: true, decimal: false),
            ),
            const SizedBox(height: 15.0),
            UiUtil.buildTextFormField(
              _keyTimestamp,
              'Timestamp',
              (_) => null,
              icon: Icons.access_time,
              inputType: TextInputType.datetime,
            ),
            const SizedBox(height: 40.0),
            MaterialButton(
              child: Text('Add Transaction'),
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
