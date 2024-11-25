// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future jobsBatchUpdate(
  String conditionLabel1,
  DocumentReference? conditionValue1,
  String conditionLabel2,
  bool conditionValue2,
  String changeLabel,
  bool changeValue,
  String collectionName,
) async {
  // collectionRef is variable name that can be changed
  // updateCollection is a parameter - set as a 'specific value' with the name of the collection
  // you want to update (e.g. where the documents are)
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection(collectionName);

  //WriteBatch creates a temporary 'wrapper' for your querys + actions on them
  //batch is a variable name you can change (the first one only)
  WriteBatch batch = FirebaseFirestore.instance.batch();

  //this runs a query on your firestore collection to get the documents you want to update
  collectionRef

      //.where is a search filter - you can add more filters here like a normal query in flutterflow
      //set updateField and currentValue as parameters to configure this for your query
      .where(conditionLabel1, isEqualTo: conditionValue1)
      .where(conditionLabel2, isEqualTo: conditionValue2)

      //.get is used to retrieves those documents
      .get()

      //.then allows you to run action/actions on the results from your query
      //querySnapshot is a variable name you can change
      .then((querySnapshot) {
    //docs.forEach runs your action as a loop on each result
    //document is a variable name you can change
    querySnapshot.docs.forEach((document) {
      //set newValue parameter in action with value you want your documents to be updated to
      batch.update(document.reference, {changeLabel: changeValue});
    });

    //this ends your firestore batch as one single 'action' on the database all at the same time
    return batch.commit();
  });
}
