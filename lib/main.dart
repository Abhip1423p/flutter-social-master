import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social/app.dart';
import 'package:flutter_social/utils/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: primaryDark
  ));
 runApp(App());
  //runApp(MyApp());
}
