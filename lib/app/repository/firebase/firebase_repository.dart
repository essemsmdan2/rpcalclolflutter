import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rpcalclol/app/core/payment_types.dart';
import 'package:rpcalclol/app/models/payment_types_model.dart';
import 'package:rpcalclol/app/repository/firebase/firebase_repository_interface.dart';

class FirebaseRepository implements IFirebaseRepository {
  FirebaseRepository({required this.firestore}) {}
  late final FirebaseFirestore firestore;
  late final CollectionReference _firestorageCollectionPaymentTypes =
      firestore.collection('paymentTypes');
  final List<PaymentTypesModel> _arrayTiposPag = [];
  final PaymentTypesDb _paymentTypes = PaymentTypesDb();
  //a lista abaixo só é de uso em ambiente de desenvolvimento para update

  @override
  Future<void> sendUpdatePaymentTypes() async {
    for (var payment in _paymentTypes.allPaymentsArrayJson) {
      _firestorageCollectionPaymentTypes
          .add(payment)
          .then((value) => print("Added ${payment["nameType"]}"))
          .catchError(
            (error) => print("$error"),
          );
    }
  }

  @override
  Future<List<PaymentTypesModel>> getUpdatePaymentTypes() async {
    QuerySnapshot<Object?> paymentTypesFromGet =
        await _firestorageCollectionPaymentTypes.get();
    for (var payment in paymentTypesFromGet.docs) {
      _arrayTiposPag.add(
          PaymentTypesModel.fromMap(payment.data() as Map<String, dynamic>));
    }
    return _arrayTiposPag;
  }

  @override
  Future<void> removeAllData() async {
    await _firestorageCollectionPaymentTypes
        .get()
        .then((value) => {
              value.docs.forEach((snapshot) {
                snapshot.reference.delete();
              })
            })
        .then((value) => print('deleted'))
        .catchError((error) => print("Failed to remove: $error"));
  }

  @override
  Future<void> projectZeroDawn() async {
    print("running project zeroDawn ");
    await removeAllData();
    await sendUpdatePaymentTypes();
    print("project zeroDawn concluded");
  }
}
