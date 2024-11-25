import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InventoryRecord extends FirestoreRecord {
  InventoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "productName" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "productMinimumLimit" field.
  int? _productMinimumLimit;
  int get productMinimumLimit => _productMinimumLimit ?? 0;
  bool hasProductMinimumLimit() => _productMinimumLimit != null;

  // "productMaxLimit" field.
  int? _productMaxLimit;
  int get productMaxLimit => _productMaxLimit ?? 0;
  bool hasProductMaxLimit() => _productMaxLimit != null;

  // "productImage" field.
  String? _productImage;
  String get productImage => _productImage ?? '';
  bool hasProductImage() => _productImage != null;

  // "productCurrentAmount" field.
  int? _productCurrentAmount;
  int get productCurrentAmount => _productCurrentAmount ?? 0;
  bool hasProductCurrentAmount() => _productCurrentAmount != null;

  // "productPrice" field.
  int? _productPrice;
  int get productPrice => _productPrice ?? 0;
  bool hasProductPrice() => _productPrice != null;

  // "isOrderPlaced" field.
  bool? _isOrderPlaced;
  bool get isOrderPlaced => _isOrderPlaced ?? false;
  bool hasIsOrderPlaced() => _isOrderPlaced != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _productName = snapshotData['productName'] as String?;
    _productMinimumLimit = castToType<int>(snapshotData['productMinimumLimit']);
    _productMaxLimit = castToType<int>(snapshotData['productMaxLimit']);
    _productImage = snapshotData['productImage'] as String?;
    _productCurrentAmount =
        castToType<int>(snapshotData['productCurrentAmount']);
    _productPrice = castToType<int>(snapshotData['productPrice']);
    _isOrderPlaced = snapshotData['isOrderPlaced'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('inventory')
          : FirebaseFirestore.instance.collectionGroup('inventory');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('inventory').doc(id);

  static Stream<InventoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InventoryRecord.fromSnapshot(s));

  static Future<InventoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InventoryRecord.fromSnapshot(s));

  static InventoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InventoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InventoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InventoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InventoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InventoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInventoryRecordData({
  String? productName,
  int? productMinimumLimit,
  int? productMaxLimit,
  String? productImage,
  int? productCurrentAmount,
  int? productPrice,
  bool? isOrderPlaced,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'productName': productName,
      'productMinimumLimit': productMinimumLimit,
      'productMaxLimit': productMaxLimit,
      'productImage': productImage,
      'productCurrentAmount': productCurrentAmount,
      'productPrice': productPrice,
      'isOrderPlaced': isOrderPlaced,
    }.withoutNulls,
  );

  return firestoreData;
}

class InventoryRecordDocumentEquality implements Equality<InventoryRecord> {
  const InventoryRecordDocumentEquality();

  @override
  bool equals(InventoryRecord? e1, InventoryRecord? e2) {
    return e1?.productName == e2?.productName &&
        e1?.productMinimumLimit == e2?.productMinimumLimit &&
        e1?.productMaxLimit == e2?.productMaxLimit &&
        e1?.productImage == e2?.productImage &&
        e1?.productCurrentAmount == e2?.productCurrentAmount &&
        e1?.productPrice == e2?.productPrice &&
        e1?.isOrderPlaced == e2?.isOrderPlaced;
  }

  @override
  int hash(InventoryRecord? e) => const ListEquality().hash([
        e?.productName,
        e?.productMinimumLimit,
        e?.productMaxLimit,
        e?.productImage,
        e?.productCurrentAmount,
        e?.productPrice,
        e?.isOrderPlaced
      ]);

  @override
  bool isValidKey(Object? o) => o is InventoryRecord;
}
