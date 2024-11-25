import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'supplier_create_account_page_model.dart';
export 'supplier_create_account_page_model.dart';

class SupplierCreateAccountPageWidget extends StatefulWidget {
  const SupplierCreateAccountPageWidget({
    super.key,
    required this.supplierEmail,
    required this.supplierPassword,
    required this.supplierConfirmPassword,
    required this.supplierDocument,
  });

  final String? supplierEmail;
  final String? supplierPassword;
  final String? supplierConfirmPassword;
  final SuppliersRecord? supplierDocument;

  @override
  State<SupplierCreateAccountPageWidget> createState() =>
      _SupplierCreateAccountPageWidgetState();
}

class _SupplierCreateAccountPageWidgetState
    extends State<SupplierCreateAccountPageWidget> {
  late SupplierCreateAccountPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupplierCreateAccountPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      GoRouter.of(context).prepareAuthEvent();
      if (widget!.supplierPassword! != widget!.supplierConfirmPassword!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Passwords don\'t match!',
            ),
          ),
        );
        return;
      }

      final user = await authManager.createAccountWithEmail(
        context,
        widget!.supplierEmail!,
        widget!.supplierPassword!,
      );
      if (user == null) {
        return;
      }

      await UsersRecord.collection.doc(user.uid).update({
        ...createUsersRecordData(
          displayName: widget!.supplierDocument?.displayName,
          email: widget!.supplierDocument?.email,
          cnic: widget!.supplierDocument?.cnic,
          phoneNumber: widget!.supplierDocument?.phoneNumber,
          photoUrl: widget!.supplierDocument?.photoUrl,
          usertype: 'customer',
        ),
        ...mapToFirestore(
          {
            'created_time': FieldValue.serverTimestamp(),
          },
        ),
      });

      context.goNamedAuth(
        'SupplierHomePage',
        context.mounted,
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 300),
          ),
        },
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              'Processing Please Wait ... ',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
