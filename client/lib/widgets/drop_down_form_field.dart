import 'package:flutter/material.dart';

class DropdownFormField<T> extends StatefulWidget {
  final Key formKey;
  final List<DropdownMenuItem> items;
  final T initalValue;

  final ValueChanged<T> onChanged;
  final FormFieldSetter<T> onSaved;
  final FormFieldValidator<T> validator;

  final InputDecoration decoration;
  final Widget hint;

  DropdownFormField({
    @required this.formKey,
    @required this.items,
    this.initalValue,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.decoration,
    this.hint,
  });

  @override
  _DropdownFormFieldState createState() => _DropdownFormFieldState();
}

class _DropdownFormFieldState<T> extends State<DropdownFormField<T>> {
  T _value;

  @override
  DropdownFormField<T> get widget => super.widget;

  @override
  void initState() {
    super.initState();
    _value = widget.initalValue ?? widget.items.first.value;
  }

  @override
  Widget build(BuildContext ctx) {
    return DropdownButtonFormField(
      key: widget.formKey,
      value: _value,
      items: widget.items,
      decoration: widget.decoration,
      hint: widget.hint,
      // XXX: Check whether the function can be passed directly somehow
      onChanged: (val) => onChanged(val),
      onSaved: (val) => widget.onSaved(val),
      validator: (val) => widget.validator(val),
    );
  }

  void onChanged(T value) {
    setState(() {
      _value = value;
    });
    if (widget.onChanged != null) {
      widget.onChanged(value);
    }
  }
}
