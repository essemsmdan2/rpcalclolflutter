import 'package:rpcalclol/app/models/payment_types_model.dart';

abstract class IFirebaseRepository {
  void sendUpdatePaymentTypes();
  Future<List<PaymentTypesModel>> getUpdatePaymentTypes();
  Future<void> removeAllData();
  Future<void> projectZeroDawn();
}
