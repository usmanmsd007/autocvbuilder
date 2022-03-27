// import 'package:auto_cv_builder/helperclasses/Firestoredb.dart';
import 'package:auto_cv_builder/models/personalinfo.dart';
import 'package:auto_cv_builder/models/qualification.dart';
// import 'package:auto_cv_builder/publicfile/publicvars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

String pPersonalInfo = 'personalInfo', pObjectives = 'objectives';

class TotalDetails {
  TotalDetails({
    required this.personalInfo,
    required this.obejctives,
    required this.acheivements,
    required this.qualifications,
  });

  PersonalInfo? personalInfo;
  String? obejctives;
  List<String?> acheivements;
  List<Qualifications?> qualifications;

  Map<String, dynamic> totalInfoToJson() {
    return {
      pPersonalInfo: personalInfo!.personalInfoToJson(),
      pObjectives: obejctives,
      pQuals: qualifications.map((i) => i!.toMap()).toList(),
      pAcheivements: acheivements,
    };
  }

  // the below methods are for fetchingg the data from firestore documents
  static totalDetailsfromDocSnap(DocumentSnapshot snap) {
    return TotalDetails(
        personalInfo: PersonalInfo.getpersonalinfofromjson(snap[pPersonalInfo]),
        obejctives: snap[pObjectives],
        qualifications: _fetchQuals(snap),
        acheivements: _fetchString(snap, pAcheivements));

    // }

    // static List<String> getAcheivements(List<String> a) {
    //   List<String> listofacheivements = [];
    //   a.forEach((element) {
    //     listofacheivements.add(element);
    //   });
    //   return listofacheivements;
    // }
  }

  static List<String> _fetchString(DocumentSnapshot snap, String property) {
    final listOfStrings = <String>[];
    // DocumentSnapshot snap =
    //     await firestore.collection(totaldata).doc(auth.currentUser.uid).get();
    final qualtemp = snap[property];
    for (String string in qualtemp) {
      print("this is from acheivements" + string);
      listOfStrings.add(string);
    }
    return listOfStrings;
  }

  static List<Qualifications> _fetchQuals(DocumentSnapshot snap) {
    final qualificationZ = <Qualifications>[];
    // DocumentSnapshot snap =
    //     await firestore.collection(totaldata).doc(auth.currentUser.uid).get();
    final qualtemp = snap[pQuals];
    for (Map<String, dynamic> q in qualtemp) {
      qualificationZ.add(Qualifications.qulaFromJson(q));
    }
    return qualificationZ;
  }
}
