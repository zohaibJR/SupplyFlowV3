import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "driverID" field.
  DocumentReference? _driverID;
  DocumentReference? get driverID => _driverID;
  bool hasDriverID() => _driverID != null;

  // "supplierID" field.
  DocumentReference? _supplierID;
  DocumentReference? get supplierID => _supplierID;
  bool hasSupplierID() => _supplierID != null;

  // "productName" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "productQuantity" field.
  int? _productQuantity;
  int get productQuantity => _productQuantity ?? 0;
  bool hasProductQuantity() => _productQuantity != null;

  // "orderDate" field.
  DateTime? _orderDate;
  DateTime? get orderDate => _orderDate;
  bool hasOrderDate() => _orderDate != null;

  // "isJobCompleted" field.
  bool? _isJobCompleted;
  bool get isJobCompleted => _isJobCompleted ?? false;
  bool hasIsJobCompleted() => _isJobCompleted != null;

  // "isJobActive" field.
  bool? _isJobActive;
  bool get isJobActive => _isJobActive ?? false;
  bool hasIsJobActive() => _isJobActive != null;

  // "customerID" field.
  DocumentReference? _customerID;
  DocumentReference? get customerID => _customerID;
  bool hasCustomerID() => _customerID != null;

  // "vehicleID" field.
  DocumentReference? _vehicleID;
  DocumentReference? get vehicleID => _vehicleID;
  bool hasVehicleID() => _vehicleID != null;

  // "isJobInProcess" field.
  bool? _isJobInProcess;
  bool get isJobInProcess => _isJobInProcess ?? false;
  bool hasIsJobInProcess() => _isJobInProcess != null;

  // "orderNo" field.
  String? _orderNo;
  String get orderNo => _orderNo ?? '';
  bool hasOrderNo() => _orderNo != null;

  // "inventoryID" field.
  DocumentReference? _inventoryID;
  DocumentReference? get inventoryID => _inventoryID;
  bool hasInventoryID() => _inventoryID != null;

  // "isRatedByCustomer" field.
  bool? _isRatedByCustomer;
  bool get isRatedByCustomer => _isRatedByCustomer ?? false;
  bool hasIsRatedByCustomer() => _isRatedByCustomer != null;

  void _initializeFields() {
    _driverID = snapshotData['driverID'] as DocumentReference?;
    _supplierID = snapshotData['supplierID'] as DocumentReference?;
    _productName = snapshotData['productName'] as String?;
    _productQuantity = castToType<int>(snapshotData['productQuantity']);
    _orderDate = snapshotData['orderDate'] as DateTime?;
    _isJobCompleted = snapshotData['isJobCompleted'] as bool?;
    _isJobActive = snapshotData['isJobActive'] as bool?;
    _customerID = snapshotData['customerID'] as DocumentReference?;
    _vehicleID = snapshotData['vehicleID'] as DocumentReference?;
    _isJobInProcess = snapshotData['isJobInProcess'] as bool?;
    _orderNo = snapshotData['orderNo'] as String?;
    _inventoryID = snapshotData['inventoryID'] as DocumentReference?;
    _isRatedByCustomer = snapshotData['isRatedByCustomer'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  DocumentReference? driverID,
  DocumentReference? supplierID,
  String? productName,
  int? productQuantity,
  DateTime? orderDate,
  bool? isJobCompleted,
  bool? isJobActive,
  DocumentReference? customerID,
  DocumentReference? vehicleID,
  bool? isJobInProcess,
  String? orderNo,
  DocumentReference? inventoryID,
  bool? isRatedByCustomer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'driverID': driverID,
      'supplierID': supplierID,
      'productName': productName,
      'productQuantity': productQuantity,
      'orderDate': orderDate,
      'isJobCompleted': isJobCompleted,
      'isJobActive': isJobActive,
      'customerID': customerID,
      'vehicleID': vehicleID,
      'isJobInProcess': isJobInProcess,
      'orderNo': orderNo,
      'inventoryID': inventoryID,
      'isRatedByCustomer': isRatedByCustomer,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.driverID == e2?.driverID &&
        e1?.supplierID == e2?.supplierID &&
        e1?.productName == e2?.productName &&
        e1?.productQuantity == e2?.productQuantity &&
        e1?.orderDate == e2?.orderDate &&
        e1?.isJobCompleted == e2?.isJobCompleted &&
        e1?.isJobActive == e2?.isJobActive &&
        e1?.customerID == e2?.customerID &&
        e1?.vehicleID == e2?.vehicleID &&
        e1?.isJobInProcess == e2?.isJobInProcess &&
        e1?.orderNo == e2?.orderNo &&
        e1?.inventoryID == e2?.inventoryID &&
        e1?.isRatedByCustomer == e2?.isRatedByCustomer;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.driverID,
        e?.supplierID,
        e?.productName,
        e?.productQuantity,
        e?.orderDate,
        e?.isJobCompleted,
        e?.isJobActive,
        e?.customerID,
        e?.vehicleID,
        e?.isJobInProcess,
        e?.orderNo,
        e?.inventoryID,
        e?.isRatedByCustomer
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
