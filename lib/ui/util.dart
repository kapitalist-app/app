import 'package:flutter/material.dart';

void showSnackbar(BuildContext ctx, String msg) {
  final sb = new SnackBar(
        content: new Text(msg),
      );

  Scaffold.of(ctx).showSnackBar(sb);
}