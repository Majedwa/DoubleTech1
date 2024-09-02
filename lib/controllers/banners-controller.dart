import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  RxList<Map<String, String>> banners = RxList<Map<String, String>>([]);

  @override
  void onInit() {
    super.onInit();
    fetchBannersUrls();
  }

  Future<void> fetchBannersUrls() async {
    try {
      QuerySnapshot bannersSnapshot =
          await FirebaseFirestore.instance.collection('banners').get();
      if (bannersSnapshot.docs.isNotEmpty) {
        banners.value = bannersSnapshot.docs
            .map((doc) => {'id': doc.id, 'imageUrl': doc['imageUrl'] as String})
            .toList();
      }
    } catch (e) {
      print("error:$e");
    }
  }

  Future<void> addBanner(String imageUrl) async {
    try {
      await FirebaseFirestore.instance.collection('banners').add({'imageUrl': imageUrl});
      fetchBannersUrls(); // تحديث قائمة اللافتات بعد الإضافة
    } catch (e) {
      print("error:$e");
    }
  }

  Future<void> deleteBanner(String documentId) async {
    try {
      await FirebaseFirestore.instance.collection('banners').doc(documentId).delete();
      fetchBannersUrls(); // تحديث قائمة اللافتات بعد الحذف
    } catch (e) {
      print("error:$e");
    }
  }
}
