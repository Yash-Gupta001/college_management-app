import 'package:flutter/material.dart';
import 'package:flutter_flavors/config_flavors.dart';
import 'package:flutter_flavors/maincommon.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  AppEnvironment.setupEnv(Environment.dev);

  mainCommon();
}