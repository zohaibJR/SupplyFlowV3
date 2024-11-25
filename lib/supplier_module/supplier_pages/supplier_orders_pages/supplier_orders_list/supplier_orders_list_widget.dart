import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'supplier_orders_list_model.dart';
export 'supplier_orders_list_model.dart';

class SupplierOrdersListWidget extends StatefulWidget {
  const SupplierOrdersListWidget({super.key});

  @override
  State<SupplierOrdersListWidget> createState() =>
      _SupplierOrdersListWidgetState();
}

class _SupplierOrdersListWidgetState extends State<SupplierOrdersListWidget>
    with TickerProviderStateMixin {
  late SupplierOrdersListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupplierOrdersListModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SuppliersRecord>>(
      stream: querySuppliersRecord(
        queryBuilder: (suppliersRecord) => suppliersRecord.where(
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
        List<SuppliersRecord> supplierOrdersListSuppliersRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final supplierOrdersListSuppliersRecord =
            supplierOrdersListSuppliersRecordList.isNotEmpty
                ? supplierOrdersListSuppliersRecordList.first
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
                  context.pop();
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
                      SingleChildScrollView(
                        child: Column(
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
                              'ORDERS',
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
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.65,
                                decoration: BoxDecoration(),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment(0.0, 0),
                                      child: FlutterFlowButtonTabBar(
                                        useToggleButtonStyle: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              letterSpacing: 0.0,
                                            ),
                                        unselectedLabelStyle:
                                            FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Inter Tight',
                                                  letterSpacing: 0.0,
                                                ),
                                        labelColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        unselectedLabelColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        unselectedBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        unselectedBorderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        elevation: 0.0,
                                        buttonMargin:
                                            EdgeInsetsDirectional.fromSTEB(
                                                8.0, 0.0, 8.0, 0.0),
                                        tabs: [
                                          Tab(
                                            text: 'Pending Orders',
                                          ),
                                          Tab(
                                            text: 'Delivered Orders',
                                          ),
                                        ],
                                        controller: _model.tabBarController,
                                        onTap: (i) async {
                                          [() async {}, () async {}][i]();
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _model.tabBarController,
                                        children: [
                                          FutureBuilder<int>(
                                            future: queryOrdersRecordCount(
                                              queryBuilder: (ordersRecord) =>
                                                  ordersRecord
                                                      .where(
                                                        'supplierID',
                                                        isEqualTo:
                                                            supplierOrdersListSuppliersRecord
                                                                ?.reference,
                                                      )
                                                      .where(
                                                        'isJobCompleted',
                                                        isEqualTo: false,
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
                                              int conditionalBuilderCount =
                                                  snapshot.data!;

                                              return Builder(
                                                builder: (context) {
                                                  if (conditionalBuilderCount >
                                                      0) {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsets.all(10.0),
                                                      child: StreamBuilder<
                                                          List<OrdersRecord>>(
                                                        stream:
                                                            queryOrdersRecord(
                                                          queryBuilder:
                                                              (ordersRecord) =>
                                                                  ordersRecord
                                                                      .where(
                                                                        'supplierID',
                                                                        isEqualTo:
                                                                            supplierOrdersListSuppliersRecord?.reference,
                                                                      )
                                                                      .where(
                                                                        'isJobCompleted',
                                                                        isEqualTo:
                                                                            false,
                                                                      ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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

                                                          return ListView
                                                              .separated(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewOrdersRecordList
                                                                    .length,
                                                            separatorBuilder: (_,
                                                                    __) =>
                                                                SizedBox(
                                                                    height:
                                                                        10.0),
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewOrdersRecord =
                                                                  listViewOrdersRecordList[
                                                                      listViewIndex];
                                                              return Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        InventoryRecord>>(
                                                                  stream:
                                                                      queryInventoryRecord(
                                                                    parent: listViewOrdersRecord
                                                                        .customerID,
                                                                    queryBuilder:
                                                                        (inventoryRecord) =>
                                                                            inventoryRecord.where(
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
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
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
                                                                    if (snapshot
                                                                        .data!
                                                                        .isEmpty) {
                                                                      return Container();
                                                                    }
                                                                    final containerInventoryRecord = containerInventoryRecordList
                                                                            .isNotEmpty
                                                                        ? containerInventoryRecordList
                                                                            .first
                                                                        : null;

                                                                    return InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'SupplierOrderDetailsPage',
                                                                          queryParameters:
                                                                              {
                                                                            'orderReference':
                                                                                serializeParam(
                                                                              listViewOrdersRecord.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                            'isDelivered':
                                                                                serializeParam(
                                                                              false,
                                                                              ParamType.bool,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            kTransitionInfoKey:
                                                                                TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.fade,
                                                                              duration: Duration(milliseconds: 300),
                                                                            ),
                                                                          },
                                                                        );
                                                                      },
                                                                      child:
                                                                          SafeArea(
                                                                        child:
                                                                            AnimatedContainer(
                                                                          duration:
                                                                              Duration(milliseconds: 100),
                                                                          curve:
                                                                              Curves.easeInOutQuint,
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 5.0,
                                                                                color: Color(0x33000000),
                                                                                offset: Offset(
                                                                                  0.0,
                                                                                  0.0,
                                                                                ),
                                                                                spreadRadius: 2.0,
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: Color(0xFF75838D),
                                                                              width: 2.0,
                                                                            ),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(10.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Container(
                                                                                  width: 100.0,
                                                                                  height: 100.0,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    containerInventoryRecord!.productImage,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                                SingleChildScrollView(
                                                                                  scrollDirection: Axis.horizontal,
                                                                                  child: Row(
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
                                                                                                      text: listViewOrdersRecord.productName,
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
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    50.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'No Pending Orders',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              );
                                            },
                                          ),
                                          FutureBuilder<int>(
                                            future: queryOrdersRecordCount(
                                              queryBuilder: (ordersRecord) =>
                                                  ordersRecord
                                                      .where(
                                                        'supplierID',
                                                        isEqualTo:
                                                            supplierOrdersListSuppliersRecord
                                                                ?.reference,
                                                      )
                                                      .where(
                                                        'isJobCompleted',
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
                                              int conditionalBuilderCount =
                                                  snapshot.data!;

                                              return Builder(
                                                builder: (context) {
                                                  if (conditionalBuilderCount >
                                                      0) {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsets.all(10.0),
                                                      child: StreamBuilder<
                                                          List<OrdersRecord>>(
                                                        stream:
                                                            queryOrdersRecord(
                                                          queryBuilder:
                                                              (ordersRecord) =>
                                                                  ordersRecord
                                                                      .where(
                                                                        'supplierID',
                                                                        isEqualTo:
                                                                            supplierOrdersListSuppliersRecord?.reference,
                                                                      )
                                                                      .where(
                                                                        'isJobCompleted',
                                                                        isEqualTo:
                                                                            true,
                                                                      ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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

                                                          return ListView
                                                              .separated(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewOrdersRecordList
                                                                    .length,
                                                            separatorBuilder: (_,
                                                                    __) =>
                                                                SizedBox(
                                                                    height:
                                                                        10.0),
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewOrdersRecord =
                                                                  listViewOrdersRecordList[
                                                                      listViewIndex];
                                                              return Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        InventoryRecord>>(
                                                                  stream:
                                                                      queryInventoryRecord(
                                                                    parent: listViewOrdersRecord
                                                                        .customerID,
                                                                    queryBuilder:
                                                                        (inventoryRecord) =>
                                                                            inventoryRecord.where(
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
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
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
                                                                    if (snapshot
                                                                        .data!
                                                                        .isEmpty) {
                                                                      return Container();
                                                                    }
                                                                    final containerInventoryRecord = containerInventoryRecordList
                                                                            .isNotEmpty
                                                                        ? containerInventoryRecordList
                                                                            .first
                                                                        : null;

                                                                    return InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'SupplierOrderDetailsPage',
                                                                          queryParameters:
                                                                              {
                                                                            'orderReference':
                                                                                serializeParam(
                                                                              listViewOrdersRecord.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                            'isDelivered':
                                                                                serializeParam(
                                                                              true,
                                                                              ParamType.bool,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            kTransitionInfoKey:
                                                                                TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.fade,
                                                                              duration: Duration(milliseconds: 300),
                                                                            ),
                                                                          },
                                                                        );
                                                                      },
                                                                      child:
                                                                          SafeArea(
                                                                        child:
                                                                            AnimatedContainer(
                                                                          duration:
                                                                              Duration(milliseconds: 100),
                                                                          curve:
                                                                              Curves.easeInOutQuint,
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 5.0,
                                                                                color: Color(0x33000000),
                                                                                offset: Offset(
                                                                                  0.0,
                                                                                  0.0,
                                                                                ),
                                                                                spreadRadius: 2.0,
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: Color(0xFF75838D),
                                                                              width: 2.0,
                                                                            ),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsets.all(10.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        height: 100.0,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          containerInventoryRecord!.productImage,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                      SingleChildScrollView(
                                                                                        scrollDirection: Axis.horizontal,
                                                                                        child: Row(
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
                                                                                                    if (listViewOrdersRecord.isRatedByCustomer)
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                          children: [
                                                                                                            RichText(
                                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                                              text: TextSpan(
                                                                                                                children: [
                                                                                                                  TextSpan(
                                                                                                                    text: 'Rating : ',
                                                                                                                    style: TextStyle(
                                                                                                                      color: FlutterFlowTheme.of(context).success,
                                                                                                                      fontWeight: FontWeight.bold,
                                                                                                                    ),
                                                                                                                  )
                                                                                                                ],
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Inter',
                                                                                                                      color: FlutterFlowTheme.of(context).success,
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                StreamBuilder<DriverRecord>(
                                                                                                                  stream: DriverRecord.getDocument(listViewOrdersRecord.driverID!),
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

                                                                                                                    final ratingBarDriverRecord = snapshot.data!;

                                                                                                                    return RatingBarIndicator(
                                                                                                                      itemBuilder: (context, index) => Icon(
                                                                                                                        Icons.star_rounded,
                                                                                                                        color: Color(0xFFEAAD03),
                                                                                                                      ),
                                                                                                                      direction: Axis.horizontal,
                                                                                                                      rating: ratingBarDriverRecord.ratings.toDouble(),
                                                                                                                      unratedColor: FlutterFlowTheme.of(context).accent1,
                                                                                                                      itemCount: 5,
                                                                                                                      itemSize: 24.0,
                                                                                                                    );
                                                                                                                  },
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ],
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
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    50.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'No Delivered Orders',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
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
