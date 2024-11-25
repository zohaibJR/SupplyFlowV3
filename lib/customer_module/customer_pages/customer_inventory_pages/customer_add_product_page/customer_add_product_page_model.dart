import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'customer_add_product_page_widget.dart'
    show CustomerAddProductPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomerAddProductPageModel
    extends FlutterFlowModel<CustomerAddProductPageWidget> {
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
  // State field(s) for InputMinLimit widget.
  FocusNode? inputMinLimitFocusNode;
  TextEditingController? inputMinLimitTextController;
  String? Function(BuildContext, String?)? inputMinLimitTextControllerValidator;
  // State field(s) for InputPrice widget.
  FocusNode? inputPriceFocusNode;
  TextEditingController? inputPriceTextController;
  String? Function(BuildContext, String?)? inputPriceTextControllerValidator;
  // State field(s) for InputQuantityOnHand widget.
  FocusNode? inputQuantityOnHandFocusNode;
  TextEditingController? inputQuantityOnHandTextController;
  String? Function(BuildContext, String?)?
      inputQuantityOnHandTextControllerValidator;
  // Stores action output result for [Validate Form] action in AddProductBtn widget.
  bool? isDriverFormValid;

  @override
  void initState(BuildContext context) {
    inputProductNameTextControllerValidator =
        _inputProductNameTextControllerValidator;
  }

  @override
  void dispose() {
    inputProductNameFocusNode?.dispose();
    inputProductNameTextController?.dispose();

    inputMaxLimitFocusNode?.dispose();
    inputMaxLimitTextController?.dispose();

    inputMinLimitFocusNode?.dispose();
    inputMinLimitTextController?.dispose();

    inputPriceFocusNode?.dispose();
    inputPriceTextController?.dispose();

    inputQuantityOnHandFocusNode?.dispose();
    inputQuantityOnHandTextController?.dispose();
  }
}
