// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  Future getData(String collection) async {
    final FirebaseFirestore fierbaseFierstore = FirebaseFirestore.instance;
    QuerySnapshot snapshot =
        await fierbaseFierstore.collection(collection).get();
    return snapshot.docs;
  }

  Future queryData(String queryString) async {
    return FirebaseFirestore.instance
        .collection('products')
        .where('productName', isGreaterThanOrEqualTo: queryString)
        .get();
  }
}
