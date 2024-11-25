import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'customer_inventory_list_page_widget.dart'
    show CustomerInventoryListPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomerInventoryListPageModel
    extends FlutterFlowModel<CustomerInventoryListPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in CustomerInventoryListPage widget.
  CustomerRecord? customerDetails;
  // Stores action output result for [Firestore Query - Query a collection] action in CustomerInventoryListPage widget.
  SuppliersRecord? supplierDetails;
  // Stores action output result for [Firestore Query - Query a collection] action in PlaceOrderBtn widget.
  UniversalOrderDetailsRecord? orderNo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
