import 'package:bloc_leaning_pjct/common/values/colors.dart';
import 'package:bloc_leaning_pjct/pages/home/bloc/home_page_bloc.dart';
import 'package:bloc_leaning_pjct/pages/home/widgets/home_contoller.dart';
import 'package:bloc_leaning_pjct/pages/home/widgets/home_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late HomeController _homeController;

  @override 
  void initstate(){
    super.initState();
    _homeController = HomeController(context:context);
    _homeController.init();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child:  homePageText("Hello",
                    color: AppColors.primaryThirdElementText),
                ),  
                SliverToBoxAdapter(            
                child: homePageText("Jasmin", top: 5)),
                SliverPadding(
                  padding: EdgeInsets.only(top:20.h),
                ),
                SliverToBoxAdapter(child: searchView()),
                SliverToBoxAdapter(child: slidersView(context, state)),
                SliverToBoxAdapter(child: menuView()),
                SliverPadding(padding: EdgeInsets.symmetric(
                  vertical: 18.h, horizontal: 0.w
                ),
                sliver: SliverGrid(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.6,
                  ),
                    delegate: SliverChildBuilderDelegate(
                      childCount: 4,
                      (context, index) {
                      return GestureDetector(
                        onTap: (){

                        },
                        child: courseGride(),
                      );
                    }), ),
                )
              ],
            ),
          );
      
        },
      )
    );
  }
}
