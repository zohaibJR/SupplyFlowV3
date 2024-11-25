import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'supplier_login_page_widget.dart' show SupplierLoginPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SupplierLoginPageModel extends FlutterFlowModel<SupplierLoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for SupplierLoginEmail widget.
  FocusNode? supplierLoginEmailFocusNode;
  TextEditingController? supplierLoginEmailTextController;
  String? Function(BuildContext, String?)?
      supplierLoginEmailTextControllerValidator;
  // State field(s) for SupplierLoginPassword widget.
  FocusNode? supplierLoginPasswordFocusNode;
  TextEditingController? supplierLoginPasswordTextController;
  late bool supplierLoginPasswordVisibility;
  String? Function(BuildContext, String?)?
      supplierLoginPasswordTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in LoginBtn widget.
  int? supplierDetailsCount;
  // Stores action output result for [Firestore Query - Query a collection] action in LoginBtn widget.
  int? isSupplierAUser;
  // Stores action output result for [Firestore Query - Query a collection] action in LoginBtn widget.
  SuppliersRecord? supplierDetails;

  @override
  void initState(BuildContext context) {
    supplierLoginPasswordVisibility = false;
  }

  @override
  void dispose() {
    supplierLoginEmailFocusNode?.dispose();
    supplierLoginEmailTextController?.dispose();

    supplierLoginPasswordFocusNode?.dispose();
    supplierLoginPasswordTextController?.dispose();
  }
}
