import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/newsfeed_controller.dart';

class NewsfeedView extends GetView<NewsfeedController> {
  const NewsfeedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        title: Text(
          'ai_tab_title'.tr,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: const Center(
        child: Text(
          'NewsfeedView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
