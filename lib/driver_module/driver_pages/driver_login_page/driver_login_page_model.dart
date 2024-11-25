import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'driver_login_page_widget.dart' show DriverLoginPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DriverLoginPageModel extends FlutterFlowModel<DriverLoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DriverLoginEmail widget.
  FocusNode? driverLoginEmailFocusNode;
  TextEditingController? driverLoginEmailTextController;
  String? Function(BuildContext, String?)?
      driverLoginEmailTextControllerValidator;
  // State field(s) for DriverLoginPassword widget.
  FocusNode? driverLoginPasswordFocusNode;
  TextEditingController? driverLoginPasswordTextController;
  late bool driverLoginPasswordVisibility;
  String? Function(BuildContext, String?)?
      driverLoginPasswordTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in LoginBtn widget.
  int? driverDetailsCount;
  // Stores action output result for [Firestore Query - Query a collection] action in LoginBtn widget.
  int? isDriverAUser;
  // Stores action output result for [Firestore Query - Query a collection] action in LoginBtn widget.
  DriverRecord? driverDetails;

  @override
  void initState(BuildContext context) {
    driverLoginPasswordVisibility = false;
  }

  @override
  void dispose() {
    driverLoginEmailFocusNode?.dispose();
    driverLoginEmailTextController?.dispose();

    driverLoginPasswordFocusNode?.dispose();
    driverLoginPasswordTextController?.dispose();
  }
}
