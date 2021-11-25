import 'package:flutter/material.dart';
import 'package:places/src/viewmodels/base_view_model.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends BaseViewModel> extends StatefulWidget {
  final T model;
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Widget? child;

  const BaseWidget({Key? key, required this.model, required this.builder, this.child}) : super(key: key);

  @override
  _BaseWidgetState createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends BaseViewModel> extends State<BaseWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => widget.model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}

