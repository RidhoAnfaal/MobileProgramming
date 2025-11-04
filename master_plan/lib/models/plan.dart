import 'package:flutter/foundation.dart';
import 'task.dart';

@immutable
class Plan {
  final String name;
  final List<Task> tasks;

  const Plan({
    this.name = '',
    this.tasks = const [],
  });
}