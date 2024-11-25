import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/hr_module/hr_components/front_drawer_hr/front_drawer_hr_widget.dart';
import 'hr_home_page_widget.dart' show HrHomePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HrHomePageModel extends FlutterFlowModel<HrHomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for FrontDrawerHr component.
  late FrontDrawerHrModel frontDrawerHrModel;

  @override
  void initState(BuildContext context) {
    frontDrawerHrModel = createModel(context, () => FrontDrawerHrModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    frontDrawerHrModel.dispose();
  }
}
