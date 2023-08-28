import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_leaning_pjct/common/values/colors.dart';
import 'package:bloc_leaning_pjct/pages/home/bloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../../common/widgets/base_text_widgets.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/person.png"))),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 24.sp),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
          width: 280.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(color: AppColors.primaryFourthElementText),
          ),
          child: Row(children: [
            Container(
                margin: EdgeInsets.only(left: 17.w),
                width: 16.w,
                height: 16.w,
                child: Image.asset("assets/icons/search.png")),
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    hintText: "search your course",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent))),
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp),
                autofocus: false,
                obscureText: false,
              ),
            )
          ])),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(Radius.circular(13.w)),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}

Widget slidersView(BuildContext context, HomePageState state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomePageBloc>().add(HomePageDots(value));
          },
          children: [
            _sliderContainer(path: "assets/icons/Art.png"),
            _sliderContainer(path: "assets/icons/Image(1).png"),
            _sliderContainer(path: "assets/icons/image(4).png")
          ],
        ),
      ),
      Container(
          child: DotsIndicator(
        dotsCount: 3,
        position: state.index,
        decorator: DotsDecorator(
            color: AppColors.primaryThirdElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(17.0, 5.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0))),
      ))
    ],
  );
}

Widget _sliderContainer({String path = "assets/icons/Art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.h)),
        image: DecorationImage(fit: BoxFit.fill, image: AssetImage(path))),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            resusableText("Choose your course"),
            GestureDetector(
              child: resusableText("See all",
                  color: AppColors.primaryThirdElementText, fontSize: 10),
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.w),
        child: Row(
          children: [
            _resusableMenuText("All"),
            _resusableMenuText("Popular", textColor: AppColors.primaryThirdElementText,backgroundColor: Colors.white),
            _resusableMenuText("Newest", textColor: AppColors.primaryThirdElementText,backgroundColor: Colors.white),
          ],
        ),
      )
    ],
  );
}


//for the menu button reusable text

Widget _resusableMenuText(String menuText, {Color textColor = AppColors.primaryElementText, Color backgroundColor = AppColors.primaryElement}){
  return Container(
            margin: EdgeInsets.only(right: 20.w),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(13.w)),
                border: Border.all(color: AppColors.primaryElement),
              ),
              padding: EdgeInsets.only(
                  left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
              child: resusableText(menuText,
                  color: textColor,
                  fontWeight: FontWeight.normal),
            );

}

//for course gride view ui

Widget courseGride(){
  return Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.w),
                            image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/icons/Image(2).png"))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Best Course for IT and Engineering",
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.left,
                              softWrap: false,
                              style: TextStyle(
                                color: AppColors.primaryElementText,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp
                              ),),
                              SizedBox(height: 5.h,),
                               Text("Flutter is best courses",
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.left,
                              softWrap: false,
                              style: TextStyle(
                                color: AppColors.primaryFourthElementText,
                                fontWeight: FontWeight.normal,
                                fontSize: 8.sp
                              ),)
                            ],
                          ),
                        );
}