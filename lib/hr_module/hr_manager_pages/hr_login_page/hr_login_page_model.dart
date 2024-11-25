import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'hr_login_page_widget.dart' show HrLoginPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HrLoginPageModel extends FlutterFlowModel<HrLoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for InputEmail widget.
  FocusNode? inputEmailFocusNode;
  TextEditingController? inputEmailTextController;
  String? Function(BuildContext, String?)? inputEmailTextControllerValidator;
  // State field(s) for InputPassword widget.
  FocusNode? inputPasswordFocusNode;
  TextEditingController? inputPasswordTextController;
  late bool inputPasswordVisibility;
  String? Function(BuildContext, String?)? inputPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    inputPasswordVisibility = false;
  }

  @override
  void dispose() {
    inputEmailFocusNode?.dispose();
    inputEmailTextController?.dispose();

    inputPasswordFocusNode?.dispose();
    inputPasswordTextController?.dispose();
  }
}
