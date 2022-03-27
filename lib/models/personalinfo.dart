// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

String pAddress = 'address',
    pContact = 'contacts',
    pD_o_b = 'd_o_b',
    pEmail = 'email',
    pExpeerience = 'experience',
    pFatherName = 'fathername',
    pName = 'name';
String pAcheivements = 'acheivements';
String pProjects = 'projects';
String pLangs = 'languages';
String pQuals = 'qualifications';
String pRefs = 'references';
String pSkills = 'skills';

class PersonalInfo {
  PersonalInfo({
    required this.address,
    required this.contact,
    required this.dob,
    required this.email,
    required this.fatherName,
    required this.name,
  });
  String name, fatherName, contact, email, address, dob;

  PersonalInfo getpersonalInfoFromDocumentSnapshot(DocumentSnapshot docSnap) {
    return PersonalInfo(
      address: docSnap.get(pAddress),
      name: docSnap.get(pName),
      fatherName: docSnap.get(pFatherName),
      contact: docSnap.get(pContact),
      email: docSnap.get(pEmail),
      dob: docSnap.get(pD_o_b),
    );
  }

  static PersonalInfo getpersonalinfofromjson(Map<String, dynamic> map) {
    return PersonalInfo(
      address: map[pAddress]!,
      name: map[pName]!,
      fatherName: map[pFatherName]!,
      contact: map[pContact]!,
      email: map[pEmail]!,
      dob: map[pD_o_b],
    );
  }

  Map<String, dynamic> personalInfoToJson() {
    return {
      pD_o_b: dob,
      pName: name,
      pFatherName: fatherName,
      pEmail: email,
      pAddress: address,
      pContact: contact,
    };
  }
}
