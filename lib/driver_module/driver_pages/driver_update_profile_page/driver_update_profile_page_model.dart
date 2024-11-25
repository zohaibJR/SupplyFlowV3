import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'driver_update_profile_page_widget.dart'
    show DriverUpdateProfilePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DriverUpdateProfilePageModel
    extends FlutterFlowModel<DriverUpdateProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for UpdateDriverName widget.
  FocusNode? updateDriverNameFocusNode;
  TextEditingController? updateDriverNameTextController;
  String? Function(BuildContext, String?)?
      updateDriverNameTextControllerValidator;
  String? _updateDriverNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for UpdateDriverContact widget.
  FocusNode? updateDriverContactFocusNode;
  TextEditingController? updateDriverContactTextController;
  String? Function(BuildContext, String?)?
      updateDriverContactTextControllerValidator;
  String? _updateDriverContactTextControllerValidator(
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
    updateDriverNameTextControllerValidator =
        _updateDriverNameTextControllerValidator;
    updateDriverContactTextControllerValidator =
        _updateDriverContactTextControllerValidator;
  }

  @override
  void dispose() {
    updateDriverNameFocusNode?.dispose();
    updateDriverNameTextController?.dispose();

    updateDriverContactFocusNode?.dispose();
    updateDriverContactTextController?.dispose();
  }
}
