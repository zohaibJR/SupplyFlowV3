import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'hr_add_supplier_page_widget.dart' show HrAddSupplierPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class HrAddSupplierPageModel extends FlutterFlowModel<HrAddSupplierPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for InputSupplierName widget.
  FocusNode? inputSupplierNameFocusNode;
  TextEditingController? inputSupplierNameTextController;
  String? Function(BuildContext, String?)?
      inputSupplierNameTextControllerValidator;
  String? _inputSupplierNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for InputSupplierContact widget.
  FocusNode? inputSupplierContactFocusNode;
  TextEditingController? inputSupplierContactTextController;
  String? Function(BuildContext, String?)?
      inputSupplierContactTextControllerValidator;
  String? _inputSupplierContactTextControllerValidator(
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

  // State field(s) for InputSupplierCnic widget.
  FocusNode? inputSupplierCnicFocusNode;
  TextEditingController? inputSupplierCnicTextController;
  final inputSupplierCnicMask = MaskTextInputFormatter(mask: '#####-#######-#');
  String? Function(BuildContext, String?)?
      inputSupplierCnicTextControllerValidator;
  String? _inputSupplierCnicTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for InputSupplierEmail widget.
  FocusNode? inputSupplierEmailFocusNode;
  TextEditingController? inputSupplierEmailTextController;
  String? Function(BuildContext, String?)?
      inputSupplierEmailTextControllerValidator;
  String? _inputSupplierEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for InputSupplierPassword widget.
  FocusNode? inputSupplierPasswordFocusNode;
  TextEditingController? inputSupplierPasswordTextController;
  late bool inputSupplierPasswordVisibility;
  String? Function(BuildContext, String?)?
      inputSupplierPasswordTextControllerValidator;
  String? _inputSupplierPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in AddSupplierBtn widget.
  bool? isDriverFormValid;

  @override
  void initState(BuildContext context) {
    inputSupplierNameTextControllerValidator =
        _inputSupplierNameTextControllerValidator;
    inputSupplierContactTextControllerValidator =
        _inputSupplierContactTextControllerValidator;
    inputSupplierCnicTextControllerValidator =
        _inputSupplierCnicTextControllerValidator;
    inputSupplierEmailTextControllerValidator =
        _inputSupplierEmailTextControllerValidator;
    inputSupplierPasswordVisibility = false;
    inputSupplierPasswordTextControllerValidator =
        _inputSupplierPasswordTextControllerValidator;
  }

  @override
  void dispose() {
    inputSupplierNameFocusNode?.dispose();
    inputSupplierNameTextController?.dispose();

    inputSupplierContactFocusNode?.dispose();
    inputSupplierContactTextController?.dispose();

    inputSupplierCnicFocusNode?.dispose();
    inputSupplierCnicTextController?.dispose();

    inputSupplierEmailFocusNode?.dispose();
    inputSupplierEmailTextController?.dispose();

    inputSupplierPasswordFocusNode?.dispose();
    inputSupplierPasswordTextController?.dispose();
  }
}
