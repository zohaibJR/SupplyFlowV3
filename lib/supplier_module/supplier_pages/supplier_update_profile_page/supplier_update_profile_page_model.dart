import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'supplier_update_profile_page_widget.dart'
    show SupplierUpdateProfilePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SupplierUpdateProfilePageModel
    extends FlutterFlowModel<SupplierUpdateProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for UpdateSupplierName widget.
  FocusNode? updateSupplierNameFocusNode;
  TextEditingController? updateSupplierNameTextController;
  String? Function(BuildContext, String?)?
      updateSupplierNameTextControllerValidator;
  String? _updateSupplierNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for UpdateSupplierContact widget.
  FocusNode? updateSupplierContactFocusNode;
  TextEditingController? updateSupplierContactTextController;
  String? Function(BuildContext, String?)?
      updateSupplierContactTextControllerValidator;
  String? _updateSupplierContactTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 11) {
      return 'Requires at least 11 characters.';
    }
    if (val.length > 13) {
      return 'Maximum 13 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in UpdateBtn widget.
  bool? isFormValid;

  @override
  void initState(BuildContext context) {
    updateSupplierNameTextControllerValidator =
        _updateSupplierNameTextControllerValidator;
    updateSupplierContactTextControllerValidator =
        _updateSupplierContactTextControllerValidator;
  }

  @override
  void dispose() {
    updateSupplierNameFocusNode?.dispose();
    updateSupplierNameTextController?.dispose();

    updateSupplierContactFocusNode?.dispose();
    updateSupplierContactTextController?.dispose();
  }
}
