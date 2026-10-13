import 'package:agro_finder_project/presentation/labour/service_six_reciver/widget/widget.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:agro_finder_project/theam/text_style.dart';
import 'package:flutter/material.dart';

class ServiceLoabourProvider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ServiceLabourProviderState();
  }
}

class _ServiceLabourProviderState extends State {
  AppStyle as=AppStyle();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      appBar: AppBar(
        backgroundColor: AppColors.color3,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.menu),color: AppColors.color1,)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.color3,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))
              ),
              child: Text("Agricultural Orders",style: as.textStyle10(),),
            ),
            SizedBox(
              height: 20,
            ),
            serviceprocard("assets/images/service_provider_screen/soil preperation.png", "Soil Preparation"),
            SizedBox(height: 10,),
            serviceprocard("assets/images/service_provider_screen/harvesting.png", "Harvesting"),
            SizedBox(height: 10,),
            serviceprocard("assets/images/service_provider_screen/seeds.png", "Seeds"),
            SizedBox(height: 10,),
            serviceprocard("assets/images/service_provider_screen/irrigation.png", "Irrigation"),
            SizedBox(height: 10,),
            serviceprocard("assets/images/service_provider_screen/fartizer.png", "Fertilize"),
            SizedBox(height: 10,),
            serviceprocard("assets/images/service_provider_screen/wedding.png", "Weeding"),
            SizedBox(height: 10,),
        
          ],
        ),
      ),
    );
  }
}
