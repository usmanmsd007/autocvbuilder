import 'package:auto_cv_builder/models/personalinfo.dart';
import 'package:auto_cv_builder/models/totaldetails.dart';
import 'package:auto_cv_builder/publicvars/public.dart';
// import 'package:auto_cv_builder/src/Personal_Info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// String uid = auth.currentUser!.uid;
String totaldata = 'totalData';

class FireStoreDb {
  static addTotalDetailstoFirestore(
      {required Map<String, dynamic> totalDetails}) {
    try {
      return firestore.collection(totaldata).doc(uid).set(
        {
          pPersonalInfo: totalDetails[pPersonalInfo],
          pAcheivements: FieldValue.arrayUnion(totalDetails[pAcheivements]),
          pObjectives: totalDetails[pObjectives],
          pQuals: FieldValue.arrayUnion(
            totalDetails[pQuals],
          ),
        },
      ).then(
        (value) => print('data has been added to firestore'),
      );
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  static getTotalDetailsfromDocSnap() async {
    DocumentSnapshot docSnap;
    try {
      docSnap = await firestore.collection(totaldata).doc(uid).get();
    } catch (e) {
      return null;
    }
    if (docSnap.exists) {
      return TotalDetails.totalDetailsfromDocSnap(docSnap);
    } else {
      return null;
    }
  }
}
