import 'dart:convert';

import 'package:annotations/annotations.dart';

part 'order.g.dart';

@jsonGen
class Order {
  String name;
  String id;
  List<String> names;
  double amount;
  Order({
    required this.name,
    required this.id,
    required this.names,
    required this.amount,
  });
}
