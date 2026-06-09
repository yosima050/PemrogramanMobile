import 'package:flutter/material.dart';
import '../models/data_layer.dart';

class PlanProvider extends InheritedNotifier<ValueNotifier<List<Plan>>> {
  const PlanProvider({
    required ValueNotifier<List<Plan>> notifier,
    required super.child,
    super.key,
  }) : super(notifier: notifier);

  static ValueNotifier<List<Plan>> of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PlanProvider>()!.notifier!;
  }
}
