import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'customer_create_account_page_model.dart';
export 'customer_create_account_page_model.dart';

class CustomerCreateAccountPageWidget extends StatefulWidget {
  const CustomerCreateAccountPageWidget({
    super.key,
    required this.customerEmail,
    required this.customerPassword,
    required this.customerConfirmPassword,
    required this.customerDocument,
  });

  final String? customerEmail;
  final String? customerPassword;
  final String? customerConfirmPassword;
  final CustomerRecord? customerDocument;

  @override
  State<CustomerCreateAccountPageWidget> createState() =>
      _CustomerCreateAccountPageWidgetState();
}

class _CustomerCreateAccountPageWidgetState
    extends State<CustomerCreateAccountPageWidget> {
  late CustomerCreateAccountPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomerCreateAccountPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      GoRouter.of(context).prepareAuthEvent();
      if (widget!.customerPassword! != widget!.customerConfirmPassword!) {
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
        widget!.customerEmail!,
        widget!.customerPassword!,
      );
      if (user == null) {
        return;
      }

      await UsersRecord.collection.doc(user.uid).update({
        ...createUsersRecordData(
          displayName: widget!.customerDocument?.displayName,
          email: widget!.customerDocument?.email,
          cnic: widget!.customerDocument?.cnic,
          phoneNumber: widget!.customerDocument?.phoneNumber,
          photoUrl: widget!.customerDocument?.photoUrl,
          usertype: 'customer',
        ),
        ...mapToFirestore(
          {
            'created_time': FieldValue.serverTimestamp(),
          },
        ),
      });

      context.goNamedAuth(
        'CustomerHomePage',
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
