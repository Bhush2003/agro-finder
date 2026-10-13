import 'package:agro_finder_project/presentation/farmer/service_screen/controller/service_controller.dart';
import 'package:agro_finder_project/presentation/farmer/service_screen/widget/widget.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:agro_finder_project/theam/text_style.dart';
import 'package:agro_finder_project/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ServiceScreenState();
  }
}

class _ServiceScreenState extends State {
  final ServiceController controller = Get.find<ServiceController>();
  AppStyle as = AppStyle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      body: Column(
        children: [
          Container(
            height: 197,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColors.color3,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              TranslationKeys.selectOption.tr,
              style: as.textStyle10(),
            ),
          ),
          SizedBox(height: 10),
          Image.asset("assets/images/service/Group 51 (1).png"),
          SizedBox(height: 20),
          flCard(TranslationKeys.farmer.tr, controller),
          SizedBox(height: 20),
          flCard(TranslationKeys.labour.tr, controller),
        ],
      ),
    );
  }
}
