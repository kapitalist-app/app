import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:kapitalist/models/api/transaction_creation_request.dart';
import 'package:kapitalist/models/wallet.dart';
import 'package:kapitalist/redux/state.dart';
import 'package:kapitalist/redux/transaction/actions.dart';
import 'package:kapitalist/ui/util.dart';

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() {
    return new _TransactionPageState();
  }
}

class _TransactionPageState extends State<TransactionPage> {
  // Keys
  final _keyForm = new GlobalKey<FormState>();
  final _keyWallet = new GlobalKey<FormFieldState<Wallet>>();
  final _keyCategory = new GlobalKey<FormFieldState<int>>();
  final _keyName = new GlobalKey<FormFieldState<String>>();
  final _keyAmount = new GlobalKey<FormFieldState<String>>();
  final _keyTimestamp = new GlobalKey<FormFieldState<String>>();

  Wallet _wallet;
  int _category;

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
      final timestamp = DateTime.tryParse(_keyTimestamp.currentState?.value)?.toUtc();

      final req = TransactionCreationRequest((b) => b
        ..walletId = wallet.id
        ..categoryId = category
        ..name = name
        ..amount = amount
        ..timestamp = timestamp);
      final store = StoreProvider.of<AppState>(context);
      store.dispatch(CreateTransactionAction(request: req));
      // XXX: This should only happen after the event was confirmed?
      Navigator.of(ctx).pop();
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
            StoreConnector<AppState, List<Wallet>>(
              converter: (store) => store.state.walletState.wallets,
              builder: (_, wallets) {
                return DropdownButtonFormField(
                    key: _keyWallet,
                    value: _wallet,
                    items: wallets.map<DropdownMenuItem<Wallet>>((w) {
                      return DropdownMenuItem(value: w, child: Text(w.name));
                    }).toList(),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_balance_wallet),
                    ),
                    onChanged: (val) => setState(() => _wallet = val),
                    validator: (val) =>
                        val == null ? 'Wallet cannot be empty' : null);
              },
            ),
            DropdownButtonFormField(
                key: _keyCategory,
                value: _category,
                items: [
                  for (var i = 1; i <= 5; i++)
                    DropdownMenuItem(value: i, child: Text('Category $i'))
                ],
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
