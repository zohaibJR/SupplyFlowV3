import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/driver_module/driver_components/front_drawer_driver/front_drawer_driver_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'driver_home_page_widget.dart' show DriverHomePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DriverHomePageModel extends FlutterFlowModel<DriverHomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for FrontDrawerDriver component.
  late FrontDrawerDriverModel frontDrawerDriverModel;

  @override
  void initState(BuildContext context) {
    frontDrawerDriverModel =
        createModel(context, () => FrontDrawerDriverModel());
  }

  @override
  void dispose() {
    frontDrawerDriverModel.dispose();
  }
}
