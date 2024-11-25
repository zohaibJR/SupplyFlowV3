import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UniversalOrderDetailsRecord extends FirestoreRecord {
  UniversalOrderDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "newOrderNo" field.
  int? _newOrderNo;
  int get newOrderNo => _newOrderNo ?? 0;
  bool hasNewOrderNo() => _newOrderNo != null;

  void _initializeFields() {
    _newOrderNo = castToType<int>(snapshotData['newOrderNo']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('universalOrderDetails');

  static Stream<UniversalOrderDetailsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => UniversalOrderDetailsRecord.fromSnapshot(s));

  static Future<UniversalOrderDetailsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UniversalOrderDetailsRecord.fromSnapshot(s));

  static UniversalOrderDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UniversalOrderDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UniversalOrderDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UniversalOrderDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UniversalOrderDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UniversalOrderDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUniversalOrderDetailsRecordData({
  int? newOrderNo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'newOrderNo': newOrderNo,
    }.withoutNulls,
  );

  return firestoreData;
}

class UniversalOrderDetailsRecordDocumentEquality
    implements Equality<UniversalOrderDetailsRecord> {
  const UniversalOrderDetailsRecordDocumentEquality();

  @override
  bool equals(
      UniversalOrderDetailsRecord? e1, UniversalOrderDetailsRecord? e2) {
    return e1?.newOrderNo == e2?.newOrderNo;
  }

  @override
  int hash(UniversalOrderDetailsRecord? e) =>
      const ListEquality().hash([e?.newOrderNo]);

  @override
  bool isValidKey(Object? o) => o is UniversalOrderDetailsRecord;
}
