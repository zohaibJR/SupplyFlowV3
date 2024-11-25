import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/customer_module/customer_components/front_drawer_customer/front_drawer_customer_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'customer_home_page_widget.dart' show CustomerHomePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomerHomePageModel extends FlutterFlowModel<CustomerHomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for FrontDrawerCustomer component.
  late FrontDrawerCustomerModel frontDrawerCustomerModel;

  @override
  void initState(BuildContext context) {
    frontDrawerCustomerModel =
        createModel(context, () => FrontDrawerCustomerModel());
  }

  @override
  void dispose() {
    frontDrawerCustomerModel.dispose();
  }
}
