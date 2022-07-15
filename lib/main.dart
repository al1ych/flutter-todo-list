import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:testovoe/feature/board/api/board_service.dart';
import 'package:testovoe/feature/board/controller/board_controller.dart';
import 'package:testovoe/feature/new_task/controller/new_task_controller.dart';
import 'package:testovoe/feature/splash/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.greenAccent,
    ),
  );
  setupInjections();
  runApp(const MyApp());
}

void setupInjections() {
  Get.put(BoardService());
  Get.put(BoardController());
  Get.put(NewTaskController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
    );
  }
}
