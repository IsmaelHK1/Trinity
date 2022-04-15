import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class findusername extends StatelessWidget {
  late final String documentId;

  findusername(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
var pseudo;
    return FutureBuilder<DocumentSnapshot>(
      future: users.where('pseudo', isEqualTo: "test2").get().then((value) => pseudo ,),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          print("Something went wrong") ;
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          print("Document does not exist") ;
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          print(" ${data['pseudo']}") ; 
          return Text(" ${data['pseudo']}");
        }

        return Text("loading");
      },
    );
  }
}

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text(" ${data['pseudo']}");
        }

        return Text("loading");
      },
    );
  }
}

 find(String username) {
  final firestoreInstance = FirebaseFirestore.instance;

              firestoreInstance.collection("users").where('pseudo' , isEqualTo: "${username}").get().then((querySnapshot) {
                querySnapshot.docs.forEach((result) {
                 // print(result.data());
                  Map<String , dynamic> data = result.data as Map<String, dynamic> ; 
                  return data[0]; 

                });
              });
            
}