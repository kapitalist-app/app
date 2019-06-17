import 'package:flutter/material.dart';

class UiUtil {
  static Widget buildTextFormField(Key key, String labelText, FormFieldValidator<String> validator,
      {IconData icon, TextInputType inputType, bool obscure}) {
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

  static Widget emptyExpanded()
    => Expanded(child: Container());

  static void showSnackbar(BuildContext ctx, String msg) {
    final sb = new SnackBar(
      content: new Text(msg),
    );

    Scaffold.of(ctx).showSnackBar(sb);
  }

  static Decoration simpleBorder({width: 1.0}) => BoxDecoration(border: Border.all(width: width));
}
