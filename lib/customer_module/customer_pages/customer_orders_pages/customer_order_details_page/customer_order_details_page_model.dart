import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'customer_order_details_page_widget.dart'
    show CustomerOrderDetailsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomerOrderDetailsPageModel
    extends FlutterFlowModel<CustomerOrderDetailsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in CustomerOrderDetailsPage widget.
  OrdersRecord? orderDetails;
  // Stores action output result for [Backend Call - Read Document] action in CustomerOrderDetailsPage widget.
  CustomerRecord? orderCustomerDetails;
  // Stores action output result for [Firestore Query - Query a collection] action in CustomerOrderDetailsPage widget.
  InventoryRecord? orderInventoryDetails;
  // Stores action output result for [Backend Call - Read Document] action in CustomerOrderDetailsPage widget.
  SuppliersRecord? supplierDetails;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
