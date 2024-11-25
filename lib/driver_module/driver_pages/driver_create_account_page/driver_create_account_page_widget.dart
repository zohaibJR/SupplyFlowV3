import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'driver_create_account_page_model.dart';
export 'driver_create_account_page_model.dart';

class DriverCreateAccountPageWidget extends StatefulWidget {
  const DriverCreateAccountPageWidget({
    super.key,
    required this.driverEmail,
    required this.driverPassword,
    required this.driverConfirmPassword,
    required this.driverDocument,
  });

  final String? driverEmail;
  final String? driverPassword;
  final String? driverConfirmPassword;
  final DriverRecord? driverDocument;

  @override
  State<DriverCreateAccountPageWidget> createState() =>
      _DriverCreateAccountPageWidgetState();
}

class _DriverCreateAccountPageWidgetState
    extends State<DriverCreateAccountPageWidget> {
  late DriverCreateAccountPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DriverCreateAccountPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      GoRouter.of(context).prepareAuthEvent();
      if (widget!.driverPassword! != widget!.driverConfirmPassword!) {
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
        widget!.driverEmail!,
        widget!.driverPassword!,
      );
      if (user == null) {
        return;
      }

      await UsersRecord.collection.doc(user.uid).update({
        ...createUsersRecordData(
          displayName: widget!.driverDocument?.displayName,
          email: widget!.driverDocument?.email,
          cnic: widget!.driverDocument?.cnic,
          phoneNumber: widget!.driverDocument?.phoneNumber,
          photoUrl: widget!.driverDocument?.photoUrl,
          usertype: 'customer',
        ),
        ...mapToFirestore(
          {
            'created_time': FieldValue.serverTimestamp(),
          },
        ),
      });

      context.goNamedAuth(
        'DriverHomePage',
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
