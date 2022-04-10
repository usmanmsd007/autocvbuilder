import 'package:auto_cv_builder/models/personalinfo.dart';
import 'package:auto_cv_builder/models/qualification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String pPersonalInfo = 'personalInfo', pObjectives = 'objectives';
String pExperience = 'experience', plangs = 'langs';

String pReference = 'reference', pSkills = 'skills';
String pProjects = 'projects';

class TotalDetails {
  TotalDetails({
    required this.experience,
    required this.langs,
    required this.projects,
    required this.skills,
    required this.references,
    required this.personalInfo,
    required this.obejctives,
    required this.acheivements,
    required this.qualifications,
  });
  List<String?> skills;
  List<String?> langs;
  String? experience;
  List<String?> projects;
  List<String?> references;
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
      pExperience: experience,
      pReference: references,
      plangs: langs,
      pSkills: skills,
      pProjects: projects,
    };
  }

  // the below methods are for fetchingg the data from firestore documents
  static totalDetailsfromDocSnap(DocumentSnapshot snap) {
    return TotalDetails(
        skills: _fetchString(snap, pSkills),
        experience: snap[pExperience],
        langs: _fetchString(snap, plangs),
        projects: _fetchString(snap, pProjects),
        references: _fetchString(snap, pReference),
        personalInfo: PersonalInfo.getpersonalinfofromjson(snap[pPersonalInfo]),
        obejctives: snap[pObjectives],
        qualifications: _fetchQuals(snap),
        acheivements: _fetchString(snap, pAcheivements));
  }

  static List<String> _fetchString(DocumentSnapshot snap, String property) {
    final listOfStrings = <String>[];
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
