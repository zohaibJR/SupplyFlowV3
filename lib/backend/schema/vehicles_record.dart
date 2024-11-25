import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VehiclesRecord extends FirestoreRecord {
  VehiclesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "vehicleName" field.
  String? _vehicleName;
  String get vehicleName => _vehicleName ?? '';
  bool hasVehicleName() => _vehicleName != null;

  // "vehicleNo" field.
  String? _vehicleNo;
  String get vehicleNo => _vehicleNo ?? '';
  bool hasVehicleNo() => _vehicleNo != null;

  // "vehicleMilage" field.
  String? _vehicleMilage;
  String get vehicleMilage => _vehicleMilage ?? '';
  bool hasVehicleMilage() => _vehicleMilage != null;

  // "vehicleModel" field.
  String? _vehicleModel;
  String get vehicleModel => _vehicleModel ?? '';
  bool hasVehicleModel() => _vehicleModel != null;

  // "vehicleManufacturingYear" field.
  String? _vehicleManufacturingYear;
  String get vehicleManufacturingYear => _vehicleManufacturingYear ?? '';
  bool hasVehicleManufacturingYear() => _vehicleManufacturingYear != null;

  // "entryTime" field.
  DateTime? _entryTime;
  DateTime? get entryTime => _entryTime;
  bool hasEntryTime() => _entryTime != null;

  // "vehiclePic" field.
  String? _vehiclePic;
  String get vehiclePic => _vehiclePic ?? '';
  bool hasVehiclePic() => _vehiclePic != null;

  // "isOnJob" field.
  bool? _isOnJob;
  bool get isOnJob => _isOnJob ?? false;
  bool hasIsOnJob() => _isOnJob != null;

  void _initializeFields() {
    _vehicleName = snapshotData['vehicleName'] as String?;
    _vehicleNo = snapshotData['vehicleNo'] as String?;
    _vehicleMilage = snapshotData['vehicleMilage'] as String?;
    _vehicleModel = snapshotData['vehicleModel'] as String?;
    _vehicleManufacturingYear =
        snapshotData['vehicleManufacturingYear'] as String?;
    _entryTime = snapshotData['entryTime'] as DateTime?;
    _vehiclePic = snapshotData['vehiclePic'] as String?;
    _isOnJob = snapshotData['isOnJob'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vehicles');

  static Stream<VehiclesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VehiclesRecord.fromSnapshot(s));

  static Future<VehiclesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VehiclesRecord.fromSnapshot(s));

  static VehiclesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VehiclesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VehiclesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VehiclesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VehiclesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VehiclesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVehiclesRecordData({
  String? vehicleName,
  String? vehicleNo,
  String? vehicleMilage,
  String? vehicleModel,
  String? vehicleManufacturingYear,
  DateTime? entryTime,
  String? vehiclePic,
  bool? isOnJob,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'vehicleName': vehicleName,
      'vehicleNo': vehicleNo,
      'vehicleMilage': vehicleMilage,
      'vehicleModel': vehicleModel,
      'vehicleManufacturingYear': vehicleManufacturingYear,
      'entryTime': entryTime,
      'vehiclePic': vehiclePic,
      'isOnJob': isOnJob,
    }.withoutNulls,
  );

  return firestoreData;
}

class VehiclesRecordDocumentEquality implements Equality<VehiclesRecord> {
  const VehiclesRecordDocumentEquality();

  @override
  bool equals(VehiclesRecord? e1, VehiclesRecord? e2) {
    return e1?.vehicleName == e2?.vehicleName &&
        e1?.vehicleNo == e2?.vehicleNo &&
        e1?.vehicleMilage == e2?.vehicleMilage &&
        e1?.vehicleModel == e2?.vehicleModel &&
        e1?.vehicleManufacturingYear == e2?.vehicleManufacturingYear &&
        e1?.entryTime == e2?.entryTime &&
        e1?.vehiclePic == e2?.vehiclePic &&
        e1?.isOnJob == e2?.isOnJob;
  }

  @override
  int hash(VehiclesRecord? e) => const ListEquality().hash([
        e?.vehicleName,
        e?.vehicleNo,
        e?.vehicleMilage,
        e?.vehicleModel,
        e?.vehicleManufacturingYear,
        e?.entryTime,
        e?.vehiclePic,
        e?.isOnJob
      ]);

  @override
  bool isValidKey(Object? o) => o is VehiclesRecord;
}
