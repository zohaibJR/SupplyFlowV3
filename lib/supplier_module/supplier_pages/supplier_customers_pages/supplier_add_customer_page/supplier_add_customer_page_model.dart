import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'supplier_add_customer_page_widget.dart'
    show SupplierAddCustomerPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class SupplierAddCustomerPageModel
    extends FlutterFlowModel<SupplierAddCustomerPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for InputCustomerName widget.
  FocusNode? inputCustomerNameFocusNode;
  TextEditingController? inputCustomerNameTextController;
  String? Function(BuildContext, String?)?
      inputCustomerNameTextControllerValidator;
  String? _inputCustomerNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for InputCustomerShopLocation widget.
  FocusNode? inputCustomerShopLocationFocusNode;
  TextEditingController? inputCustomerShopLocationTextController;
  String? Function(BuildContext, String?)?
      inputCustomerShopLocationTextControllerValidator;
  // State field(s) for InputCustomerContact widget.
  FocusNode? inputCustomerContactFocusNode;
  TextEditingController? inputCustomerContactTextController;
  String? Function(BuildContext, String?)?
      inputCustomerContactTextControllerValidator;
  String? _inputCustomerContactTextControllerValidator(
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

  // State field(s) for InputCustomerCnic widget.
  FocusNode? inputCustomerCnicFocusNode;
  TextEditingController? inputCustomerCnicTextController;
  final inputCustomerCnicMask = MaskTextInputFormatter(mask: '#####-#######-#');
  String? Function(BuildContext, String?)?
      inputCustomerCnicTextControllerValidator;
  String? _inputCustomerCnicTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for InputCustomerEmail widget.
  FocusNode? inputCustomerEmailFocusNode;
  TextEditingController? inputCustomerEmailTextController;
  String? Function(BuildContext, String?)?
      inputCustomerEmailTextControllerValidator;
  String? _inputCustomerEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for InputCustomerPassword widget.
  FocusNode? inputCustomerPasswordFocusNode;
  TextEditingController? inputCustomerPasswordTextController;
  late bool inputCustomerPasswordVisibility;
  String? Function(BuildContext, String?)?
      inputCustomerPasswordTextControllerValidator;
  String? _inputCustomerPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in AddCustomerBtn widget.
  bool? isDriverFormValid;

  @override
  void initState(BuildContext context) {
    inputCustomerNameTextControllerValidator =
        _inputCustomerNameTextControllerValidator;
    inputCustomerContactTextControllerValidator =
        _inputCustomerContactTextControllerValidator;
    inputCustomerCnicTextControllerValidator =
        _inputCustomerCnicTextControllerValidator;
    inputCustomerEmailTextControllerValidator =
        _inputCustomerEmailTextControllerValidator;
    inputCustomerPasswordVisibility = false;
    inputCustomerPasswordTextControllerValidator =
        _inputCustomerPasswordTextControllerValidator;
  }

  @override
  void dispose() {
    inputCustomerNameFocusNode?.dispose();
    inputCustomerNameTextController?.dispose();

    inputCustomerShopLocationFocusNode?.dispose();
    inputCustomerShopLocationTextController?.dispose();

    inputCustomerContactFocusNode?.dispose();
    inputCustomerContactTextController?.dispose();

    inputCustomerCnicFocusNode?.dispose();
    inputCustomerCnicTextController?.dispose();

    inputCustomerEmailFocusNode?.dispose();
    inputCustomerEmailTextController?.dispose();

    inputCustomerPasswordFocusNode?.dispose();
    inputCustomerPasswordTextController?.dispose();
  }
}
