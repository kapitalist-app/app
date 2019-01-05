import 'package:flutter/widgets.dart';

Type typeOf<B>() => B;

class Provider<B> extends InheritedWidget {
  final B bloc;

  Provider({
    Key key,
    @required this.bloc,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(Provider<B> oldWidget) {
    return bloc != oldWidget.bloc;
  }

  static B of<B>(BuildContext ctx) {
    final type = typeOf<Provider<B>>();
    final Provider<B> provider = ctx.inheritFromWidgetOfExactType(type);
    return provider.bloc;
  }
}

class BlocProvider<B> extends StatefulWidget {
  final B Function(BuildContext, B) builder;
  final void Function(BuildContext, B) onDispose;
  final Widget child;

  BlocProvider({
    Key key,
    @required this.builder,
    @required this.onDispose,
    @required this.child,
  }) : super(key: key) {
    // Builder cannot be null or the bloc cannot be created
    assert(builder != null);
  }

  @override
  State<StatefulWidget> createState() => _BlocProviderState<B>();
}

class _BlocProviderState<B> extends State<BlocProvider<B>> {
  B bloc;

  @override
  void initState() {
    super.initState();
    bloc = widget.builder(context, bloc);
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose(context, bloc);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      bloc: bloc,
      child: widget.child,
    );
  }
}
