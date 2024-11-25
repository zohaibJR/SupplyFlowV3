import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'customer_sell_product_page_widget.dart'
    show CustomerSellProductPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomerSellProductPageModel
    extends FlutterFlowModel<CustomerSellProductPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for InputNoOfItemsToSell widget.
  FocusNode? inputNoOfItemsToSellFocusNode;
  TextEditingController? inputNoOfItemsToSellTextController;
  String? Function(BuildContext, String?)?
      inputNoOfItemsToSellTextControllerValidator;
  String? _inputNoOfItemsToSellTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^[1-9]\\d*\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in SellProductBtn widget.
  bool? isDriverFormValid;

  @override
  void initState(BuildContext context) {
    inputNoOfItemsToSellTextControllerValidator =
        _inputNoOfItemsToSellTextControllerValidator;
  }

  @override
  void dispose() {
    inputNoOfItemsToSellFocusNode?.dispose();
    inputNoOfItemsToSellTextController?.dispose();
  }
}
