import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth? auth = FirebaseAuth.instance;
final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
String uid = auth!.currentUser!.uid;
// = auth.currentUser.uid;
