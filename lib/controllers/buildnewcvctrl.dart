// import 'package:auto_cv_builder/helperclasses/firestoredb.dart';
import 'dart:io';
// import 'dart:js';

import 'package:auto_cv_builder/helperclasses/firestoredb.dart';
import 'package:auto_cv_builder/models/personalinfo.dart';
import 'package:auto_cv_builder/models/qualification.dart';
import 'package:auto_cv_builder/models/totaldetails.dart';
import 'package:auto_cv_builder/publicvars/public.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:open_file/open_file.dart';

class BuildNewCvCtrl extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<TextEditingController> objectiveC = TextEditingController(text: "").obs;
  // new

  // not new
  Rx<TextEditingController> namec = TextEditingController(text: "").obs;
  Rx<TextEditingController> fnamec = TextEditingController(text: "").obs;
  Rx<TextEditingController> contactc = TextEditingController(text: "").obs;
  Rx<TextEditingController> addressc = TextEditingController(text: "").obs;
  Rx<TextEditingController> emailc = TextEditingController(text: "").obs;
  RxString objectiveText = ''.obs;
  // new
  RxString projectText = ''.obs;
  RxString experienceText = ''.obs;
  RxString referenceText = ''.obs;

// not new
  Rx<TextEditingController> degreeC = TextEditingController(text: "").obs;
  Rx<TextEditingController> instituteC = TextEditingController(text: "").obs;
  Rx<TextEditingController> marksC = TextEditingController(text: "").obs;
  Rx<TextEditingController> yearC = TextEditingController(text: "").obs;

  Rx<TextEditingController> acheivementsC = TextEditingController(text: "").obs;
  // new
  Rx<TextEditingController> languageC = TextEditingController(text: "").obs;
  Rx<TextEditingController> referenceC = TextEditingController(text: "").obs;

  Rx<TextEditingController> experienceC = TextEditingController(text: "").obs;
  Rx<TextEditingController> projectsC = TextEditingController(text: "").obs;
  Rx<TextEditingController> skillC = TextEditingController(text: "").obs;

// this is a tab controler for the new cv
  TabController? tabController;
// this is the path for the image that has been selected.
  RxString imageFilePath = ''.obs;

  // this is an observable list from firestore as stream.
  Rxn<List<TotalDetails>> totalDetailsList = Rxn<List<TotalDetails>>([]);
  // this is the list of qualifications. it will get update when it get data from stream.
  Rx<List<Qualifications?>> qualList = Rx<List<Qualifications>>([]);
  Rx<List<String?>> acheivementsList = Rx<List<String>>([]);
  // new
  Rx<List<String?>> referenceList = Rx<List<String>>([]);

  Rx<List<String?>> languageList = Rx<List<String>>([]);
  Rx<List<String?>> projectList = Rx<List<String>>([]);
  Rx<List<String?>> skillslist = Rx<List<String>>([]);

// not new
  Rx<PersonalInfo> personalInfoObj = Rx(PersonalInfo(
      address: "",
      name: "",
      dob: 'Date of Birth',
      contact: "",
      fatherName: "",
      email: ""));

  Rx<String> selectedDate = DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;

  @override
  void onInit() async {
    tabController = TabController(length: tabs.length, vsync: this);
    totalDetailsList.bindStream(getTotalDetails());
    ever(totalDetailsList, initializeControllers);
    super.onInit();
  }

  initializeControllers(dynamic val) {
    if (totalDetailsList.value!.length > 0) {
      namec.value.text = totalDetailsList.value!.first.personalInfo!.name;
      addressc.value.text = totalDetailsList.value!.first.personalInfo!.address;
      fnamec.value.text =
          totalDetailsList.value!.first.personalInfo!.fatherName;
      contactc.value.text = totalDetailsList.value!.first.personalInfo!.contact;
      emailc.value.text = totalDetailsList.value!.first.personalInfo!.email;
      objectiveC.value.text = totalDetailsList.value!.first.obejctives!;
      qualList.value = totalDetailsList.value!.first.qualifications;
      acheivementsList.value = (totalDetailsList.value!.first.acheivements);
      selectedDate.value = totalDetailsList.value!.first.personalInfo!.dob;
      // personalInfo.value = totalDL.value!.first.personalInfo!;
      update();
      refresh();
      print('the controllers has been   initialized');
    }
  }

  Stream<List<TotalDetails>> getTotalDetails() {
    Stream<QuerySnapshot> snap = firestore
        .collection(totaldata)
        .where(FieldPath.documentId, isEqualTo: uid)
        .snapshots();
    return snap.map((event) {
      List<TotalDetails> temp = [];
      // event.docChanges.forEach((element) {
      //   temp.add(TotalDetails.totalDetailsfromDocSnap(element.doc));
      // });
      for (QueryDocumentSnapshot a in event.docs) {
        temp.add(TotalDetails.totalDetailsfromDocSnap(a));

        printInfo(info: 'this is the data from inside ${a.get(pQuals)}');
      }
      return temp;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    namec.value.dispose();
    fnamec.value.dispose();
    addressc.value.dispose();
    contactc.value.dispose();
    emailc.value.dispose();
    objectiveC.value.dispose();

    degreeC.value.dispose();
    instituteC.value.dispose();
    marksC.value.dispose();
    yearC.value.dispose();

    acheivementsC.value.dispose();
    // new
    languageC.value.dispose();
    referenceC.value.dispose();

    experienceC.value.dispose();
    projectsC.value.dispose();
    skillC.value.dispose();

    super.onClose();
  }

  imagePick() async {
    ImagePicker picker = ImagePicker();
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);
    String path = pickedImage!.path;
    imageFilePath.value = path;
    update();
  }

  void updateObjectives(String s) {
    objectiveText.value = s;
    refresh();
    // update();
  }

  void updateExperience(String s) {
    experienceText.value = s;
    refresh();
    // update();
  }

  void updateTabController() {
    tabController!.animateTo(tabController!.index + 1);
    // tabController!.notifyListeners();
  }

  void setPersonalinfo(PersonalInfo info) {
    personalInfoObj.value = info;
  }

  void addQual() {
    qualList.value.add(Qualifications(
        year: yearC.value.text,
        degree: degreeC.value.text,
        marks: marksC.value.text,
        board: instituteC.value.text));
    qualList.refresh();
  }

  void deleteQual(int i) {
    qualList.value.removeAt(i);
    qualList.refresh();
  }

  void updateAcheivements() {
    acheivementsList.value.add(acheivementsC.value.text);
    acheivementsList.refresh();
  }

  void updateLanguages() {
    languageList.value.add(languageC.value.text);
    languageList.refresh();
  }

  void updateProjects() {
    projectList.value.add(projectsC.value.text);
    projectList.refresh();
  }

  void updateSkills() {
    skillslist.value.add(skillC.value.text);
    skillslist.refresh();
  }

  void updateReference() {
    referenceList.value.add(referenceC.value.text);
    referenceList.refresh();
  }

  void printAllData() {
    TotalDetails temp = TotalDetails(
      acheivements: acheivementsList.value,
      obejctives: objectiveText.value,
      qualifications: qualList.value,
      personalInfo: personalInfoObj.value,
      skills: skillslist.value,
      references: referenceList.value,
      langs: languageList.value,
      projects: projectList.value,
      experience: experienceText.value,
    );
    firestore
        .collection(totaldata)
        .doc(auth!.currentUser!.uid)
        .set(temp.totalInfoToJson())
        .onError((error, stackTrace) => printError(info: error.toString()));
  }

  final List<Tab> tabs = const [
    Tab(
      iconMargin: EdgeInsets.all(3),
      icon: Icon(Icons.person),
      text: 'Personal Info',
      height: 50,
    ),
    Tab(
      iconMargin: EdgeInsets.all(3),
      icon: Icon(Icons.calendar_today),
      text: 'Objective',
      height: 50,
    ),
    Tab(
      iconMargin: EdgeInsets.all(3),
      icon: Icon(Icons.school),
      text: 'Qualification',
      height: 50,
    ),
    Tab(
      iconMargin: EdgeInsets.all(3),
      icon: Icon(Icons.computer),
      text: 'Skills',
      height: 50,
    ),
    Tab(
      iconMargin: EdgeInsets.all(3),
      icon: Icon(Icons.poll_outlined),
      text: 'Experience',
      height: 50,
    ),
    Tab(
      iconMargin: EdgeInsets.all(3),
      icon: Icon(Icons.task),
      text: 'Achievements',
      height: 50,
    ),
    Tab(
      iconMargin: EdgeInsets.all(3),
      icon: Icon(Icons.list_alt),
      text: 'Project',
      height: 50,
    ),
    Tab(
      iconMargin: EdgeInsets.all(3),
      icon: Icon(Icons.language),
      text: 'Language',
      height: 50,
    ),
    Tab(
      iconMargin: EdgeInsets.all(3),
      icon: Icon(Icons.family_restroom_sharp),
      text: 'Reference',
      height: 50,
    )
  ];
  Future<File> generateCenteredText(String text, String filename) async {
    final pdf = p.Document();

    pdf.addPage(p.Page(
      build: (p.Context context) => p.Container(
          child: p.Column(children: [
        imageFilePath.value.isNotEmpty ? p.Center() : p.Container(),
      ])),
    ));
    return saveDocument(name: '${filename}.pdf', pdf: pdf);
  }

  Future<File> saveDocument({
    required String name,
    required p.Document pdf,
  }) async {
    final bytes = await pdf.save();
    final dir = await getExternalStorageDirectory();
    final file = File('${dir!.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  }

  Future openFile(String n) async {
    File file = await generateCenteredText('usman', n);
    final url = file.path;

    await OpenFile.open(url);
  }

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1999),
      lastDate: DateTime(2024),
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'DOB',
      fieldHintText: 'Month/Date/Year',
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = DateFormat('dd/MM/yyyy').format(pickedDate);
    }
  }
}
