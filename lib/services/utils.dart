import 'package:flutter/material.dart';
import 'package:news_app_flutter_course/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class Utils {
  final BuildContext context;

  Utils(this.context);

  Size get getScreenSize => MediaQuery.of(context).size;

  bool get getThme => Provider.of<ThemeProvider>(context).getDarkTheme;

  Color get color => getThme ? Colors.white : Colors.black;

  //===========================Shimmer
  Color get baseShimmerColor =>
      getThme ? Colors.grey.shade500 : Colors.grey.shade200;
  Color get higLightShimmerColor =>
      getThme ? Colors.grey.shade700 : Colors.grey.shade400;
      Color get widgetShimmerColor =>
      getThme ? Colors.grey.shade600 : Colors.grey.shade100;
}
