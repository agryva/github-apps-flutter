

import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class PaginateEventBus {
  final int index;

  PaginateEventBus(this.index);
}

class RefreshEventBus {
  final int index;

  RefreshEventBus(this.index);
}