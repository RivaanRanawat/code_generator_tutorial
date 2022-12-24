// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

class OrderGen {
  final String name;
  final String id;
  final List<String> names;
  final double amount;
  const OrderGen({
    required this.name,
    required this.id,
    required this.names,
    required this.amount,
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'names': names,
      'amount': amount,
    };
  }

  factory OrderGen.fromMap(Map<String, dynamic> map) {
    return OrderGen(
      name: map['name'],
      id: map['id'],
      names: map['names'],
      amount: map['amount'],
    );
  }
  OrderGen copyWith({
    String? name,
    String? id,
    List<String>? names,
    double? amount,
  }) {
    return OrderGen(
      name: name ?? this.name,
      id: id ?? this.id,
      names: names ?? this.names,
      amount: amount ?? this.amount,
    );
  }
}
