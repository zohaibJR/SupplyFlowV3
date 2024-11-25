import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'driver_jobs_list_page_model.dart';
export 'driver_jobs_list_page_model.dart';

class DriverJobsListPageWidget extends StatefulWidget {
  const DriverJobsListPageWidget({
    super.key,
    required this.toViewActiveOrders,
  });

  final bool? toViewActiveOrders;

  @override
  State<DriverJobsListPageWidget> createState() =>
      _DriverJobsListPageWidgetState();
}

class _DriverJobsListPageWidgetState extends State<DriverJobsListPageWidget> {
  late DriverJobsListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DriverJobsListPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DriverRecord>>(
      stream: queryDriverRecord(
        queryBuilder: (driverRecord) => driverRecord.where(
          'email',
          isEqualTo: currentUserEmail,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<DriverRecord> driverJobsListPageDriverRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final driverJobsListPageDriverRecord =
            driverJobsListPageDriverRecordList.isNotEmpty
                ? driverJobsListPageDriverRecordList.first
                : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.keyboard_arrow_left_sharp,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    'DriverHomePage',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 300),
                      ),
                    },
                  );
                },
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/ordersimage.png',
                              width: 150.0,
                              height: 150.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            widget!.toViewActiveOrders!
                                ? 'ACTIVE ORDERS'
                                : 'COMPLETED ORDERS',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (widget!.toViewActiveOrders == true) {
                                    return FutureBuilder<int>(
                                      future: queryOrdersRecordCount(
                                        queryBuilder: (ordersRecord) =>
                                            ordersRecord
                                                .where(
                                                  'driverID',
                                                  isEqualTo:
                                                      driverJobsListPageDriverRecord
                                                          ?.reference,
                                                )
                                                .where(
                                                  'isJobCompleted',
                                                  isEqualTo: false,
                                                )
                                                .where(
                                                  'isJobActive',
                                                  isEqualTo: true,
                                                ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        int conditionalBuilderCount =
                                            snapshot.data!;

                                        return Builder(
                                          builder: (context) {
                                            if (conditionalBuilderCount > 0) {
                                              return Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: FutureBuilder<
                                                    List<OrdersRecord>>(
                                                  future: queryOrdersRecordOnce(
                                                    queryBuilder:
                                                        (ordersRecord) =>
                                                            ordersRecord
                                                                .where(
                                                                  'driverID',
                                                                  isEqualTo:
                                                                      driverJobsListPageDriverRecord
                                                                          ?.reference,
                                                                )
                                                                .where(
                                                                  'isJobCompleted',
                                                                  isEqualTo:
                                                                      false,
                                                                )
                                                                .where(
                                                                  'isJobActive',
                                                                  isEqualTo:
                                                                      true,
                                                                ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<OrdersRecord>
                                                        listViewOrdersRecordList =
                                                        snapshot.data!;

                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          listViewOrdersRecordList
                                                              .length,
                                                      separatorBuilder:
                                                          (_, __) => SizedBox(
                                                              height: 10.0),
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewOrdersRecord =
                                                            listViewOrdersRecordList[
                                                                listViewIndex];
                                                        return Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  InventoryRecord>>(
                                                            stream:
                                                                queryInventoryRecord(
                                                              parent:
                                                                  listViewOrdersRecord
                                                                      .customerID,
                                                              queryBuilder:
                                                                  (inventoryRecord) =>
                                                                      inventoryRecord
                                                                          .where(
                                                                'productName',
                                                                isEqualTo:
                                                                    listViewOrdersRecord
                                                                        .productName,
                                                              ),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<InventoryRecord>
                                                                  containerInventoryRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final containerInventoryRecord =
                                                                  containerInventoryRecordList
                                                                          .isNotEmpty
                                                                      ? containerInventoryRecordList
                                                                          .first
                                                                      : null;

                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'DriverOrderDetailsPage',
                                                                    queryParameters:
                                                                        {
                                                                      'orderReference':
                                                                          serializeParam(
                                                                        listViewOrdersRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                      'isDelivered':
                                                                          serializeParam(
                                                                        false,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      kTransitionInfoKey:
                                                                          TransitionInfo(
                                                                        hasTransition:
                                                                            true,
                                                                        transitionType:
                                                                            PageTransitionType.fade,
                                                                        duration:
                                                                            Duration(milliseconds: 300),
                                                                      ),
                                                                    },
                                                                  );
                                                                },
                                                                child: SafeArea(
                                                                  child:
                                                                      AnimatedContainer(
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            100),
                                                                    curve: Curves
                                                                        .easeInOutQuint,
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              5.0,
                                                                          color:
                                                                              Color(0x33000000),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            0.0,
                                                                          ),
                                                                          spreadRadius:
                                                                              2.0,
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: listViewOrdersRecord.isJobInProcess ==
                                                                                false
                                                                            ? FlutterFlowTheme.of(context).primary
                                                                            : FlutterFlowTheme.of(context).success,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              10.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              containerInventoryRecord!.productImage,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        RichText(
                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: 'Product : ',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      fontSize: 16.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: containerInventoryRecord!.productName,
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  fontSize: 16.0,
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        RichText(
                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: 'Quantity : ',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      fontSize: 16.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: listViewOrdersRecord.productQuantity.toString(),
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  fontSize: 16.0,
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 10.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 0.0)),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              );
                                            } else {
                                              return Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'No Active Orders',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              );
                                            }
                                          },
                                        );
                                      },
                                    );
                                  } else {
                                    return FutureBuilder<int>(
                                      future: queryOrdersRecordCount(
                                        queryBuilder: (ordersRecord) =>
                                            ordersRecord
                                                .where(
                                                  'driverID',
                                                  isEqualTo:
                                                      driverJobsListPageDriverRecord
                                                          ?.reference,
                                                )
                                                .where(
                                                  'isJobCompleted',
                                                  isEqualTo: true,
                                                )
                                                .where(
                                                  'isJobActive',
                                                  isEqualTo: false,
                                                ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        int conditionalBuilderCount =
                                            snapshot.data!;

                                        return Builder(
                                          builder: (context) {
                                            if (conditionalBuilderCount > 0) {
                                              return Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: FutureBuilder<
                                                    List<OrdersRecord>>(
                                                  future: queryOrdersRecordOnce(
                                                    queryBuilder:
                                                        (ordersRecord) =>
                                                            ordersRecord
                                                                .where(
                                                                  'driverID',
                                                                  isEqualTo:
                                                                      driverJobsListPageDriverRecord
                                                                          ?.reference,
                                                                )
                                                                .where(
                                                                  'isJobCompleted',
                                                                  isEqualTo:
                                                                      true,
                                                                )
                                                                .where(
                                                                  'isJobActive',
                                                                  isEqualTo:
                                                                      false,
                                                                ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<OrdersRecord>
                                                        listViewOrdersRecordList =
                                                        snapshot.data!;

                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          listViewOrdersRecordList
                                                              .length,
                                                      separatorBuilder:
                                                          (_, __) => SizedBox(
                                                              height: 10.0),
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewOrdersRecord =
                                                            listViewOrdersRecordList[
                                                                listViewIndex];
                                                        return Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  InventoryRecord>>(
                                                            stream:
                                                                queryInventoryRecord(
                                                              parent:
                                                                  listViewOrdersRecord
                                                                      .customerID,
                                                              queryBuilder:
                                                                  (inventoryRecord) =>
                                                                      inventoryRecord
                                                                          .where(
                                                                'productName',
                                                                isEqualTo:
                                                                    listViewOrdersRecord
                                                                        .productName,
                                                              ),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<InventoryRecord>
                                                                  containerInventoryRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final containerInventoryRecord =
                                                                  containerInventoryRecordList
                                                                          .isNotEmpty
                                                                      ? containerInventoryRecordList
                                                                          .first
                                                                      : null;

                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'DriverOrderDetailsPage',
                                                                    queryParameters:
                                                                        {
                                                                      'orderReference':
                                                                          serializeParam(
                                                                        listViewOrdersRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                      'isDelivered':
                                                                          serializeParam(
                                                                        false,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      kTransitionInfoKey:
                                                                          TransitionInfo(
                                                                        hasTransition:
                                                                            true,
                                                                        transitionType:
                                                                            PageTransitionType.fade,
                                                                        duration:
                                                                            Duration(milliseconds: 300),
                                                                      ),
                                                                    },
                                                                  );
                                                                },
                                                                child: SafeArea(
                                                                  child:
                                                                      AnimatedContainer(
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            100),
                                                                    curve: Curves
                                                                        .easeInOutQuint,
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              5.0,
                                                                          color:
                                                                              Color(0x33000000),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            0.0,
                                                                          ),
                                                                          spreadRadius:
                                                                              2.0,
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0xFF75838D),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              10.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              containerInventoryRecord!.productImage,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        RichText(
                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: 'Product : ',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      fontSize: 16.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: containerInventoryRecord!.productName,
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  fontSize: 16.0,
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        RichText(
                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: 'Quantity : ',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      fontSize: 16.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: listViewOrdersRecord.productQuantity.toString(),
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  fontSize: 16.0,
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 10.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 0.0)),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              );
                                            } else {
                                              return Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'No Jobs Completed',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              );
                                            }
                                          },
                                        );
                                      },
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      FutureBuilder<int>(
                        future: queryOrdersRecordCount(
                          queryBuilder: (ordersRecord) => ordersRecord
                              .where(
                                'driverID',
                                isEqualTo:
                                    driverJobsListPageDriverRecord?.reference,
                              )
                              .where(
                                'isJobActive',
                                isEqualTo: true,
                              ),
                        ),
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
                          int conditionalBuilderCount = snapshot.data!;

                          return Builder(
                            builder: (context) {
                              if (conditionalBuilderCount > 0) {
                                return FutureBuilder<int>(
                                  future: queryOrdersRecordCount(
                                    queryBuilder: (ordersRecord) => ordersRecord
                                        .where(
                                          'isJobActive',
                                          isEqualTo: true,
                                        )
                                        .where(
                                          'isJobInProcess',
                                          isEqualTo: true,
                                        )
                                        .where(
                                          'driverID',
                                          isEqualTo:
                                              driverJobsListPageDriverRecord
                                                  ?.reference,
                                        ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    int conditionalBuilderCount =
                                        snapshot.data!;

                                    return Builder(
                                      builder: (context) {
                                        if (conditionalBuilderCount > 0) {
                                          return Text(
                                            '',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          );
                                        } else {
                                          return FFButtonWidget(
                                            onPressed: () async {
                                              await actions.jobsBatchUpdate(
                                                'driverID',
                                                driverJobsListPageDriverRecord
                                                    ?.reference,
                                                'isJobActive',
                                                true,
                                                'isJobInProcess',
                                                true,
                                                'orders',
                                              );

                                              await driverJobsListPageDriverRecord!
                                                  .reference
                                                  .update(
                                                      createDriverRecordData(
                                                isOnJob: true,
                                              ));
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Operation Successful'),
                                                    content: Text(
                                                        'You may now proceed with delivery.'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );

                                              context.goNamed(
                                                'DriverHomePage',
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                  ),
                                                },
                                              );
                                            },
                                            text: 'Proceed To Delivery',
                                            icon: Icon(
                                              Icons.arrow_forward_sharp,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  },
                                );
                              } else {
                                return Text(
                                  '',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ].divide(SizedBox(height: 20.0)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
