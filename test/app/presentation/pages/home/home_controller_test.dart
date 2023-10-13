import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:rpcalclol/app/presentation/pages/home/home_controller.dart';
import 'package:rpcalclol/app/repository/apiadivisor/apiadvisor_repository.dart';
import 'package:rpcalclol/app/repository/firebase/firebase_repository.dart';
import 'package:rpcalclol/app/services/dio_http_service.dart';
import 'package:rpcalclol/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:rpcalclol/app/viewmodels/rpcalc_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final firestore = FakeFirebaseFirestore();
  FirebaseRepository firebaseRepository =
      FirebaseRepository(firestore: firestore);

  HomeController controller = HomeController(
      apiAdvisorViewModel: ApiAdvisorViewModel(
          repository: ApiAdvisorRepository(dioHttpService: DioHttpService())),
      rpCalcViewModel: RpCalcViewModel(repository: firebaseRepository));
  group(
    "Home Controller Tests",
    () {
      test('ApiAdvisorTests', () async {
        await controller.getTime();
        print(controller.weather?.text);
      });

      test('Test send Values FirebaseRepository', () async {
        controller.rpCalcViewModel.repository.sendUpdatePaymentTypes();
        final _result =
            await controller.rpCalcViewModel.repository.getUpdatePaymentTypes();
        print(_result.map((e) =>
            "${e.nameType} valores: ${e.arrayValues.map((e) => e.coin)}"));
      });
      test('- Test RpCalcViewModel', () async {
        controller.rpCalcViewModel.repository.sendUpdatePaymentTypes();
        final result = await controller.getResults(inputRp: 130);
        print(result.map(
            (e) => "${e.nameType} valores:${e.arrayValues.map((e) => e.RP)}"));
      });
    },
  );
}
