import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rpcalclol/app/repository/firebase/firebase_repository.dart';
import 'package:rpcalclol/app/viewmodels/rpcalc_viewmodel.dart';

void main() {
  final firestore = FakeFirebaseFirestore();
  FirebaseRepository firebaseRepository =
      FirebaseRepository(firestore: firestore);

  test('rpcalc viewmodel ...', () async {
    final rpCalcViewModel = RpCalcViewModel(repository: firebaseRepository);
    await rpCalcViewModel.repository.projectZeroDawn();

    await rpCalcViewModel.getResults(inputRp: 640);
  });
}
