import 'package:bloc_leaning_pjct/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(String type){
  return AppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                color: AppColors.primarySecondaryBackground,
                //height define the thickness of the line
                height: 1.0,
              ),
            ),
            title: Center(
              child: Text(
                type,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          );
}