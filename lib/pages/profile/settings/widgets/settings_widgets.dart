import 'package:bloc_leaning_pjct/common/values/colors.dart';
import 'package:bloc_leaning_pjct/common/widgets/base_text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(){
  return AppBar(
    title: Container(
      child: Container(
        child: resusableText("Settings")
      ),
    ),
  );
}

Widget settingsButton(BuildContext context, void Function()? func){
  return GestureDetector(
                  onTap: () {
                    showDialog(context: context, builder:((context) {
                      return  AlertDialog(title: const Text("Confirm Logout"),
                      content: const Text("You want to Logout,Confirm Logout"),
                      actions: [
                        TextButton(onPressed:(){
                          Navigator.of(context).pop();
                        },
                         child: const Text("Cancel")),
                          TextButton(
                          onPressed: func,
                           child: const Text("Confirm"))
                      ],);
                    }));
                  },
                   child: Container(
                    height: 100.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage("assets/icons/Logout.png"))
                    ),
                   ),
                 );
}