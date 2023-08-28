import 'package:bloc_leaning_pjct/common/routes/names.dart';
import 'package:bloc_leaning_pjct/common/values/constant.dart';
import 'package:bloc_leaning_pjct/pages/application/bloc/app_bloc.dart';
import 'package:bloc_leaning_pjct/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../global.dart';
import 'widgets/settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  void removeUserData (){
    context.read<AppBloc>().add(TriggerAppEvent(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);               
    Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);               
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SETTINGS, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc,SettingsState>(
          builder: (context, State) {
            return Container(
              child: Column(
                children: [
                 settingsButton(context,removeUserData)
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}