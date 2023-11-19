// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khawuleza/pages/home.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
//Import firestore database
import 'package:cloud_firestore/cloud_firestore.dart';

class GetCommuter extends StatefulWidget {
  const GetCommuter({super.key});

  @override
  State<GetCommuter> createState() => _GetCommuterState();
}

class _GetCommuterState extends State<GetCommuter> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


// class _GetCommuter extends State<_GetCommuter> {
//   //final String documentId;

//   //_GetCommuter(this.documentId);

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference commuter = FirebaseFirestore.instance.collection('commuter');

//     return FutureBuilder<DocumentSnapshot>(
//       //Fetching data from the documentId specified of the student
//       future: commuter.doc(documentId).get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        

//         //Error Handling conditions
//         if (snapshot.hasError) {
//           return const Text("Something went wrong");
//         }

//         if (snapshot.hasData && !snapshot.data!.exists) {
//           return const Text("Document does not exist");
//         }

//         //Data is output to the user
//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
//           return Text("Full Name: ${data['name']} ${data['surename']}");
//         }

//         return const Text("loading");
//       },
//     );
//   }
// }