import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'give_driver_rating_component_model.dart';
export 'give_driver_rating_component_model.dart';

class GiveDriverRatingComponentWidget extends StatefulWidget {
  const GiveDriverRatingComponentWidget({
    super.key,
    required this.driverReference,
    required this.orderReference,
  });

  final DocumentReference? driverReference;
  final DocumentReference? orderReference;

  @override
  State<GiveDriverRatingComponentWidget> createState() =>
      _GiveDriverRatingComponentWidgetState();
}

class _GiveDriverRatingComponentWidgetState
    extends State<GiveDriverRatingComponentWidget> {
  late GiveDriverRatingComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GiveDriverRatingComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Rate Driver',
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Inter Tight',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Material(
              color: Colors.transparent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x6C57636C),
                      offset: Offset(
                        0.0,
                        0.0,
                      ),
                      spreadRadius: 4.0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController ??=
                          FormFieldController<String>(null),
                      options: ['1', '2', '3', '4', '5'],
                      onChanged: (val) =>
                          safeSetState(() => _model.dropDownValue = val),
                      width: double.infinity,
                      height: 40.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      hintText: 'Select Rating Value',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 0.0,
                      borderColor: Colors.transparent,
                      borderWidth: 0.0,
                      borderRadius: 0.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      hidesUnderline: true,
                      isOverButton: false,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ),
                ),
              ),
            ),
            StreamBuilder<DriverRecord>(
              stream: DriverRecord.getDocument(widget!.driverReference!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }

                final buttonDriverRecord = snapshot.data!;

                return FFButtonWidget(
                  onPressed: () async {
                    // update Rating

                    await widget!.driverReference!
                        .update(createDriverRecordData(
                      ratings: ((buttonDriverRecord.ratings +
                                  int.parse((_model.dropDownValue!))) /
                              2)
                          .toInt(),
                    ));
                    // rating update in order document

                    await widget!.orderReference!.update(createOrdersRecordData(
                      isRatedByCustomer: true,
                    ));
                    Navigator.pop(context);
                  },
                  text: 'Submit',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                );
              },
            ),
          ].divide(SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
