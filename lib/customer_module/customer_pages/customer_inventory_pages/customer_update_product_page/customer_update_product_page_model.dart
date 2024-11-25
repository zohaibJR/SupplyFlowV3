import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'customer_update_product_page_widget.dart'
    show CustomerUpdateProductPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomerUpdateProductPageModel
    extends FlutterFlowModel<CustomerUpdateProductPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for InputProductName widget.
  FocusNode? inputProductNameFocusNode;
  TextEditingController? inputProductNameTextController;
  String? Function(BuildContext, String?)?
      inputProductNameTextControllerValidator;
  String? _inputProductNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for InputMaxLimit widget.
  FocusNode? inputMaxLimitFocusNode;
  TextEditingController? inputMaxLimitTextController;
  String? Function(BuildContext, String?)? inputMaxLimitTextControllerValidator;
  String? _inputMaxLimitTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for InputMinLimit widget.
  FocusNode? inputMinLimitFocusNode;
  TextEditingController? inputMinLimitTextController;
  String? Function(BuildContext, String?)? inputMinLimitTextControllerValidator;
  String? _inputMinLimitTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for InputCurrentAmount widget.
  FocusNode? inputCurrentAmountFocusNode;
  TextEditingController? inputCurrentAmountTextController;
  String? Function(BuildContext, String?)?
      inputCurrentAmountTextControllerValidator;
  String? _inputCurrentAmountTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for InputPrice widget.
  FocusNode? inputPriceFocusNode;
  TextEditingController? inputPriceTextController;
  String? Function(BuildContext, String?)? inputPriceTextControllerValidator;
  // Stores action output result for [Validate Form] action in AddProductBtn widget.
  bool? isDriverFormValid;

  @override
  void initState(BuildContext context) {
    inputProductNameTextControllerValidator =
        _inputProductNameTextControllerValidator;
    inputMaxLimitTextControllerValidator =
        _inputMaxLimitTextControllerValidator;
    inputMinLimitTextControllerValidator =
        _inputMinLimitTextControllerValidator;
    inputCurrentAmountTextControllerValidator =
        _inputCurrentAmountTextControllerValidator;
  }

  @override
  void dispose() {
    inputProductNameFocusNode?.dispose();
    inputProductNameTextController?.dispose();

    inputMaxLimitFocusNode?.dispose();
    inputMaxLimitTextController?.dispose();

    inputMinLimitFocusNode?.dispose();
    inputMinLimitTextController?.dispose();

    inputCurrentAmountFocusNode?.dispose();
    inputCurrentAmountTextController?.dispose();

    inputPriceFocusNode?.dispose();
    inputPriceTextController?.dispose();
  }
}
