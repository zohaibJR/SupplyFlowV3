import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/supplier_module/supplier_components/front_drawer_supplier/front_drawer_supplier_widget.dart';
import 'supplier_home_page_widget.dart' show SupplierHomePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SupplierHomePageModel extends FlutterFlowModel<SupplierHomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for FrontDrawerSupplier component.
  late FrontDrawerSupplierModel frontDrawerSupplierModel;

  @override
  void initState(BuildContext context) {
    frontDrawerSupplierModel =
        createModel(context, () => FrontDrawerSupplierModel());
  }

  @override
  void dispose() {
    frontDrawerSupplierModel.dispose();
  }
}
