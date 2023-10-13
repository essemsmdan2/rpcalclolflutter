import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:rpcalclol/app/models/payment_types_model.dart';
import 'package:rpcalclol/app/models/payment_types_values_model.dart';
import 'package:rpcalclol/app/presentation/pages/home/home_controller.dart';
import 'package:rpcalclol/app/repository/apiadivisor/apiadvisor_repository.dart';
import 'package:rpcalclol/app/repository/firebase/firebase_repository.dart';
import 'package:rpcalclol/app/services/dio_http_service.dart';
import 'package:rpcalclol/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:rpcalclol/app/viewmodels/rpcalc_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final firestore = FakeFirebaseFirestore();
  const paymentsCollections = 'paymentTypes';
  FirebaseRepository firebaseRepository = FirebaseRepository(firestore: firestore);

  PaymentTypesModel celPayment = PaymentTypesModel(nameType: 'CelularSms', arrayValues: [
    PaymentTypesValuesModel(
      RP: 500,
      coin: 120,
    )
  ]);

  HomeController controller =
      HomeController(apiAdvisorViewModel: ApiAdvisorViewModel(repository: ApiAdvisorRepository(dioHttpService: DioHttpService())), rpCalcViewModel: RpCalcViewModel(repository: firebaseRepository));
  group("Home Controller Tests", () {
    test('ApiAdvisorTests', () async {
      await controller.getTime();
      print(controller.weather?.text);
    });

    test('Test send Values FirebaseRepository', () async {
      firebaseRepository.sendUpdatePaymentTypes();
      final result = await firebaseRepository.getUpdatePaymentTypes();
      print(result.map((e) => "${e.nameType} valores: ${e.arrayValues.map((e) => e.coin)}"));
    });
  });
}
