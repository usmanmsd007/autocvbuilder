// ignore_for_file: unused_import

import 'package:auto_cv_builder/controllers/buildnewcvctrl.dart';
import 'package:auto_cv_builder/helperclasses/firestoredb.dart';
import 'package:auto_cv_builder/homepage/pages/Personal_Info.dart';
import 'package:auto_cv_builder/homepage/pages/Qualification_Page.dart';
import 'package:auto_cv_builder/models/totaldetails.dart';
import 'package:auto_cv_builder/publicvars/public.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'pages/Achievement_Page.dart';
import 'pages/Experience_Page.dart';
import 'pages/Languages_Page.dart';
import 'pages/Objective_Page.dart';

class NewCV extends StatelessWidget {
  NewCV({Key? key}) : super(key: key);
  BuildNewCvCtrl ctrl = Get.find<BuildNewCvCtrl>();
  //
  //
  //  Get.put(BuildNewCvCtrl());
  // StreamBuilder<QuerySnapshot>(
//   stream: Firestore.instance.collection('books').snapshots(),
//   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//     if (!snapshot.hasData) return new Text('Loading...');
//     return new ListView(
//       children: snapshot.data.documents.map((DocumentSnapshot document) {
//         return new ListTile(
//           title: new Text(document['title']),
//           subtitle: new Text(document['author']),
//         );
//       }).toList(),
//     );
//   },
// );

  @override
  Widget build(BuildContext context) {
    // return GetX<BuildNewCvCtrl>(
    //   init: ,
    //   builder: (controller) {
    // return DefaultTabController(
    //   length: 9,
    // child:
    return Scaffold(
      appBar: AppBar(
        title: const Text('Build New CV'),
        elevation: 0,
        titleSpacing: 0,
        toolbarHeight: 45,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                Color(0xfffbb448),
                Color(0xffe46b10),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.remove_red_eye,
              size: 35,
            ),
            onPressed: () => {},
          ),
        ],
        bottom: TabBar(
          padding: const EdgeInsets.only(top: 12),
          isScrollable: true,
          indicatorColor: Colors.black,
          indicatorWeight: 2,
          tabs: ctrl.tabs,
          controller: ctrl.tabController,
        ),
      ),
      body: TabBarView(
        controller: ctrl.tabController,
        children: <Widget>[
          PersonalData(),
          MyObjective(),
          MyQualifications(),

          // MySkills(),

          // MyExperience(),
          MyAchievements(),
          // MyProjets(),
          // MyLanguages(),
          // MyReference(),
        ],
      ),
    );
    // );
    //   },
    // );
  }
  // List<Widgets> myTabs=[]
}

class DocumentSnapShot {}
