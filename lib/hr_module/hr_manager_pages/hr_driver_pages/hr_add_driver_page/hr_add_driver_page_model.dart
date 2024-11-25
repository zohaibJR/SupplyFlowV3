import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/hr_module/hr_components/driver_components/driver_added_successfully_bottm_sheet/driver_added_successfully_bottm_sheet_widget.dart';
import 'hr_add_driver_page_widget.dart' show HrAddDriverPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class HrAddDriverPageModel extends FlutterFlowModel<HrAddDriverPageWidget> {
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

  // State field(s) for InputDriverExperience widget.
  FocusNode? inputDriverExperienceFocusNode;
  TextEditingController? inputDriverExperienceTextController;
  String? Function(BuildContext, String?)?
      inputDriverExperienceTextControllerValidator;
  String? _inputDriverExperienceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for InputDriverEmail widget.
  FocusNode? inputDriverEmailFocusNode;
  TextEditingController? inputDriverEmailTextController;
  String? Function(BuildContext, String?)?
      inputDriverEmailTextControllerValidator;
  String? _inputDriverEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for InputDriverPassword widget.
  FocusNode? inputDriverPasswordFocusNode;
  TextEditingController? inputDriverPasswordTextController;
  late bool inputDriverPasswordVisibility;
  String? Function(BuildContext, String?)?
      inputDriverPasswordTextControllerValidator;
  String? _inputDriverPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in AddDriverBtn widget.
  bool? isDriverFormValid;

  @override
  void initState(BuildContext context) {
    inputDriverNameTextControllerValidator =
        _inputDriverNameTextControllerValidator;
    inputDriverContactTextControllerValidator =
        _inputDriverContactTextControllerValidator;
    inputDriverCnicTextControllerValidator =
        _inputDriverCnicTextControllerValidator;
    inputDriverExperienceTextControllerValidator =
        _inputDriverExperienceTextControllerValidator;
    inputDriverEmailTextControllerValidator =
        _inputDriverEmailTextControllerValidator;
    inputDriverPasswordVisibility = false;
    inputDriverPasswordTextControllerValidator =
        _inputDriverPasswordTextControllerValidator;
  }

  @override
  void dispose() {
    inputDriverNameFocusNode?.dispose();
    inputDriverNameTextController?.dispose();

    inputDriverContactFocusNode?.dispose();
    inputDriverContactTextController?.dispose();

    inputDriverCnicFocusNode?.dispose();
    inputDriverCnicTextController?.dispose();

    inputDriverExperienceFocusNode?.dispose();
    inputDriverExperienceTextController?.dispose();

    inputDriverEmailFocusNode?.dispose();
    inputDriverEmailTextController?.dispose();

    inputDriverPasswordFocusNode?.dispose();
    inputDriverPasswordTextController?.dispose();
  }
}
