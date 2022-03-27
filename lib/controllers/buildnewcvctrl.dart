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
// import 'package:path_provider/path_provider.dart';

class BuildNewCvCtrl extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<TextEditingController> objectiveC = TextEditingController(text: "").obs;
  Rx<TextEditingController> namec = TextEditingController(text: "").obs;
  Rx<TextEditingController> fnamec = TextEditingController(text: "").obs;
  Rx<TextEditingController> contactc = TextEditingController(text: "").obs;
  Rx<TextEditingController> addressc = TextEditingController(text: "").obs;
  Rx<TextEditingController> emailc = TextEditingController(text: "").obs;
  RxString objectiveText = ''.obs;
  Rx<TextEditingController> degreeC = TextEditingController(text: "").obs;
  Rx<TextEditingController> instituteC = TextEditingController(text: "").obs;
  Rx<TextEditingController> marksC = TextEditingController(text: "").obs;
  Rx<TextEditingController> yearC = TextEditingController(text: "").obs;

  Rx<TextEditingController> acheivementsC = TextEditingController(text: "").obs;
// this is a tab controler for the new cv
  TabController? tabController;
// this is the path for the image that has been selected.
  RxString imageFilePath = ''.obs;

  // this is an observable list from firestore as stream.
  Rxn<List<TotalDetails>> totalDL = Rxn<List<TotalDetails>>([]);
  // this is the list of qualifications. it will get update when it get data from stream.
  Rx<List<Qualifications?>> qualifications = Rx<List<Qualifications>>([]);
  Rx<List<String?>> acheivements = Rx<List<String>>([]);
  Rx<PersonalInfo> personalInfo = Rx(PersonalInfo(
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
    // totalDL.value?.add(await FireStoreDb.getTotalDetailsfromDocSnap());
    totalDL.bindStream(getTotalDetails());
    ever(totalDL, initializeControllers);
    super.onInit();
  }

  initializeControllers(dynamic val) {
    if (totalDL.value!.length > 0) {
      namec.value.text = totalDL.value!.first.personalInfo!.name;
      addressc.value.text = totalDL.value!.first.personalInfo!.address;
      fnamec.value.text = totalDL.value!.first.personalInfo!.fatherName;
      contactc.value.text = totalDL.value!.first.personalInfo!.contact;
      emailc.value.text = totalDL.value!.first.personalInfo!.email;
      objectiveC.value.text = totalDL.value!.first.obejctives!;
      qualifications.value = totalDL.value!.first.qualifications;
      acheivements.value = (totalDL.value!.first.acheivements);
      selectedDate.value = totalDL.value!.first.personalInfo!.dob;
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

  void updateTabController() {
    tabController!.animateTo(tabController!.index + 1);
    // tabController!.notifyListeners();
  }

  void setPersonalinfo(PersonalInfo info) {
    personalInfo.value = info;
  }

  void addQual() {
    qualifications.value.add(Qualifications(
        year: yearC.value.text,
        degree: degreeC.value.text,
        marks: marksC.value.text,
        board: instituteC.value.text));
    qualifications.refresh();
  }

  void deleteQual(int i) {
    qualifications.value.removeAt(i);
    qualifications.refresh();
  }

  void updateAcheivements() {
    acheivements.value.add(acheivementsC.value.text);
    acheivements.refresh();
  }

  void printAllData() {
    TotalDetails temp = TotalDetails(
      acheivements: acheivements.value,
      obejctives: objectiveText.value,
      qualifications: qualifications.value,
      personalInfo: personalInfo.value,
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
    // Tab(
    //   iconMargin: EdgeInsets.all(3),
    //   icon: Icon(Icons.computer),
    //   text: 'Skills',
    //   height: 50,
    // ),
    // Tab(
    //   iconMargin: EdgeInsets.all(3),
    //   icon: Icon(Icons.poll_outlined),
    //   text: 'Experience',
    //   height: 50,
    // ),
    Tab(
      iconMargin: EdgeInsets.all(3),
      icon: Icon(Icons.task),
      text: 'Achievements',
      height: 50,
    ),
    // Tab(
    //   iconMargin: EdgeInsets.all(3),
    //   icon: Icon(Icons.list_alt),
    //   text: 'Project',
    //   height: 50,
    // ),
    // Tab(
    //   iconMargin: EdgeInsets.all(3),
    //   icon: Icon(Icons.language),
    //   text: 'Language',
    //   height: 50,
    // ),
    // Tab(
    //   iconMargin: EdgeInsets.all(3),
    //   icon: Icon(Icons.family_restroom_sharp),
    //   text: 'Reference',
    //   height: 50,
    // )
  ];

  // RxString pdfPath = "".obs;
  // Future<File> generateCV() async {
  //   var pdfCv = p.Document();
  //   pdfCv.addPage(p.Page(build: (p.Context context) {
  //     return p.Center(
  //         child: p.Container(child: p.Text('hello this is em usman mehsud')));
  //   }));

  //   final bytes = await pdfCv.save();
  //   final dir = await getApplicationDocumentsDirectory();
  //   final file = File('${dir.path}/pdffiiles/usman.pdf');
  //   await file.writeAsBytes(bytes);
  //   String s = file.path;
  //   return file;
  // }

  Future<File> generateCenteredText(String text) async {
    final pdf = p.Document();

    pdf.addPage(p.Page(
      build: (p.Context context) => p.Center(
        child: p.Text(text, style: const p.TextStyle(fontSize: 48)),
      ),
    ));

    return saveDocument(name: 'Name: ${namec.value.text}.pdf', pdf: pdf);
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

  Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }

  chooseDate() async {
    // printInfo(info: 'thiss is the now date: ${selectedDate.toString()}');
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      // firstDate: DateTime(2000),
      firstDate: DateTime(1999),
      lastDate: DateTime(2024),
      //initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'DOB',
      fieldHintText: 'Month/Date/Year',
      // selectableDayPredicate: disableDate
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = DateFormat('dd/MM/yyyy').format(pickedDate);
      // DateFormat('dd-MM-yyyy).format(pickedDate).toString();
    }
  }
}
