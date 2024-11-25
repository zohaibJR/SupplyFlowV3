import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'hr_update_supplier_profile_page_widget.dart'
    show HrUpdateSupplierProfilePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class HrUpdateSupplierProfilePageModel
    extends FlutterFlowModel<HrUpdateSupplierProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for InputDriverName widget.
  FocusNode? inputDriverNameFocusNode;
  TextEditingController? inputDriverNameTextController;
  String? Function(BuildContext, String?)?
      inputDriverNameTextControllerValidator;
  String? _inputDriverNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for InputDriverContact widget.
  FocusNode? inputDriverContactFocusNode;
  TextEditingController? inputDriverContactTextController;
  String? Function(BuildContext, String?)?
      inputDriverContactTextControllerValidator;
  String? _inputDriverContactTextControllerValidator(
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

  // State field(s) for InputDriverCnic widget.
  FocusNode? inputDriverCnicFocusNode;
  TextEditingController? inputDriverCnicTextController;
  final inputDriverCnicMask = MaskTextInputFormatter(mask: '#####-#######-#');
  String? Function(BuildContext, String?)?
      inputDriverCnicTextControllerValidator;
  String? _inputDriverCnicTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in UpdateDriverBtn widget.
  bool? isDriverFormValid;

  @override
  void initState(BuildContext context) {
    inputDriverNameTextControllerValidator =
        _inputDriverNameTextControllerValidator;
    inputDriverContactTextControllerValidator =
        _inputDriverContactTextControllerValidator;
    inputDriverCnicTextControllerValidator =
        _inputDriverCnicTextControllerValidator;
  }

  @override
  void dispose() {
    inputDriverNameFocusNode?.dispose();
    inputDriverNameTextController?.dispose();

    inputDriverContactFocusNode?.dispose();
    inputDriverContactTextController?.dispose();

    inputDriverCnicFocusNode?.dispose();
    inputDriverCnicTextController?.dispose();
  }
}
