import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _TmpPageState createState() => _TmpPageState();
}

class _TmpPageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void initState() {
    super.initState();

    _permission();
    _logout();
    _auth();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // 제거해도 되는 부분이나, 추후 권한 설정과 관련된 포스팅 예정
  _permission() async {
    // Map<Permission, PermissionStatus> statuses = await [
    //     Permission.storage,
    // ].request();
    //logger.i(statuses[Permission.storage]);
  }

  _auth() {
    // 사용자 인증정보 확인. 딜레이를 두어 확인
    Future.delayed(const Duration(milliseconds: 100), () {
      // if(FirebaseAuth.instance.currentUser == null){
      //   Get.off(() => const LoginPage());
      // } else {
      //   Get.off(() => const MarketPage());
      // }
    });
  }

  _logout() async {
    //await FirebaseAuth.instance.signOut();
  }
}