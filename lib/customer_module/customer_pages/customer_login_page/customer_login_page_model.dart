import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'customer_login_page_widget.dart' show CustomerLoginPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomerLoginPageModel extends FlutterFlowModel<CustomerLoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for CustomerLoginEmail widget.
  FocusNode? customerLoginEmailFocusNode;
  TextEditingController? customerLoginEmailTextController;
  String? Function(BuildContext, String?)?
      customerLoginEmailTextControllerValidator;
  // State field(s) for CustomerLoginPassword widget.
  FocusNode? customerLoginPasswordFocusNode;
  TextEditingController? customerLoginPasswordTextController;
  late bool customerLoginPasswordVisibility;
  String? Function(BuildContext, String?)?
      customerLoginPasswordTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in LoginBtn widget.
  int? customerDetailsCount;
  // Stores action output result for [Firestore Query - Query a collection] action in LoginBtn widget.
  int? isCustomerAUser;
  // Stores action output result for [Firestore Query - Query a collection] action in LoginBtn widget.
  CustomerRecord? customerDetails;

  @override
  void initState(BuildContext context) {
    customerLoginPasswordVisibility = false;
  }

  @override
  void dispose() {
    customerLoginEmailFocusNode?.dispose();
    customerLoginEmailTextController?.dispose();

    customerLoginPasswordFocusNode?.dispose();
    customerLoginPasswordTextController?.dispose();
  }
}
