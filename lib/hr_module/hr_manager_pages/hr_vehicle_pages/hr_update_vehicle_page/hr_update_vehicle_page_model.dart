import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'hr_update_vehicle_page_widget.dart' show HrUpdateVehiclePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HrUpdateVehiclePageModel
    extends FlutterFlowModel<HrUpdateVehiclePageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for InputVehicleName widget.
  FocusNode? inputVehicleNameFocusNode;
  TextEditingController? inputVehicleNameTextController;
  String? Function(BuildContext, String?)?
      inputVehicleNameTextControllerValidator;
  String? _inputVehicleNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for InputVehicleNo widget.
  FocusNode? inputVehicleNoFocusNode;
  TextEditingController? inputVehicleNoTextController;
  String? Function(BuildContext, String?)?
      inputVehicleNoTextControllerValidator;
  // State field(s) for InputVehicleMilage widget.
  FocusNode? inputVehicleMilageFocusNode;
  TextEditingController? inputVehicleMilageTextController;
  String? Function(BuildContext, String?)?
      inputVehicleMilageTextControllerValidator;
  // State field(s) for InputVehicleModel widget.
  FocusNode? inputVehicleModelFocusNode;
  TextEditingController? inputVehicleModelTextController;
  String? Function(BuildContext, String?)?
      inputVehicleModelTextControllerValidator;
  // State field(s) for InputVehicleManufacturingYear widget.
  FocusNode? inputVehicleManufacturingYearFocusNode;
  TextEditingController? inputVehicleManufacturingYearTextController;
  String? Function(BuildContext, String?)?
      inputVehicleManufacturingYearTextControllerValidator;
  // Stores action output result for [Validate Form] action in AddVehicleBtn widget.
  bool? isDriverFormValid;

  @override
  void initState(BuildContext context) {
    inputVehicleNameTextControllerValidator =
        _inputVehicleNameTextControllerValidator;
  }

  @override
  void dispose() {
    inputVehicleNameFocusNode?.dispose();
    inputVehicleNameTextController?.dispose();

    inputVehicleNoFocusNode?.dispose();
    inputVehicleNoTextController?.dispose();

    inputVehicleMilageFocusNode?.dispose();
    inputVehicleMilageTextController?.dispose();

    inputVehicleModelFocusNode?.dispose();
    inputVehicleModelTextController?.dispose();

    inputVehicleManufacturingYearFocusNode?.dispose();
    inputVehicleManufacturingYearTextController?.dispose();
  }
}
