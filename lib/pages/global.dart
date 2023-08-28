import 'package:bloc_leaning_pjct/common/service/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Global {
  static late StorageService storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentplatform,
    );
    storageService = await StorageService().init();
  }
}