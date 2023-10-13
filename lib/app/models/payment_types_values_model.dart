// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PaymentTypesValuesModel {
  final double coin;
  final int RP;
  PaymentTypesValuesModel({
    required this.coin,
    required this.RP,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coin': coin,
      'RP': RP,
    };
  }

  factory PaymentTypesValuesModel.fromMap(Map<String, dynamic> map) {
    return PaymentTypesValuesModel(
      coin: map['coin'] as double,
      RP: map['RP'] as int,
    );
  }

  static List<PaymentTypesValuesModel> fromArray(List<dynamic> listArray) {
    List<PaymentTypesValuesModel> result = [];
    for (var element in listArray) {
      result.add(PaymentTypesValuesModel.fromMap(element));
    }
    return result;
  }

  String toJson() => json.encode(toMap());

  factory PaymentTypesValuesModel.fromJson(String source) => PaymentTypesValuesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
