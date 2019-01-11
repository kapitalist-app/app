import 'package:flutter/material.dart';

class Util {
  static Widget buildTextFormField(Key key, String labelText, IconData icon,
      FormFieldValidator<String> validator,
      {TextInputType inputType, bool obscure}) {
    return TextFormField(
      key: key,
      keyboardType: inputType ?? TextInputType.text,
      obscureText: obscure ?? false,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 5.0), child: Icon(icon)),
      ),
    );
  }

  static void showSnackbar(BuildContext ctx, String msg) {
    final sb = new SnackBar(
      content: new Text(msg),
    );

    Scaffold.of(ctx).showSnackBar(sb);
  }
}
