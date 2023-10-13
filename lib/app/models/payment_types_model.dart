// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:rpcalclol/app/models/payment_types_values_model.dart';

class PaymentTypesModel {
  String nameType;
  List<PaymentTypesValuesModel> arrayValues;
  PaymentTypesModel({
    required this.nameType,
    required this.arrayValues,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nameType': nameType,
      'arrayValues': arrayValues
          .map(
            (e) => e.toMap(),
          )
          .toList,
    };
  }

  factory PaymentTypesModel.fromMap(Map<String, dynamic> map) {
    return PaymentTypesModel(
      nameType: map['nameType'] as String,
      arrayValues: PaymentTypesValuesModel.fromArray(map['arrayValues']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentTypesModel.fromJson(String source) {
    print('JSON source: $source');
    return PaymentTypesModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }
}
