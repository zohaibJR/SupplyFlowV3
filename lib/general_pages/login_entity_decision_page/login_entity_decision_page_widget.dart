import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_entity_decision_page_model.dart';
export 'login_entity_decision_page_model.dart';

class LoginEntityDecisionPageWidget extends StatefulWidget {
  const LoginEntityDecisionPageWidget({super.key});

  @override
  State<LoginEntityDecisionPageWidget> createState() =>
      _LoginEntityDecisionPageWidgetState();
}

class _LoginEntityDecisionPageWidgetState
    extends State<LoginEntityDecisionPageWidget> {
  late LoginEntityDecisionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginEntityDecisionPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (loggedIn) {
        if (valueOrDefault(currentUserDocument?.usertype, '') == 'hr') {
          context.goNamedAuth(
            'HrHomePage',
            context.mounted,
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );
        } else if (valueOrDefault(currentUserDocument?.usertype, '') ==
            'supplier') {
          context.goNamedAuth(
            'SupplierHomePage',
            context.mounted,
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );
        } else if (valueOrDefault(currentUserDocument?.usertype, '') ==
            'driver') {
          context.goNamedAuth(
            'DriverHomePage',
            context.mounted,
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );
        } else if (valueOrDefault(currentUserDocument?.usertype, '') ==
            'customer') {
          context.goNamedAuth('CustomerHomePage', context.mounted);
        } else {
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();
        }
      } else {
        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();
      }
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
