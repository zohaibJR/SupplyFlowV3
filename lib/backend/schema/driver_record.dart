import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DriverRecord extends FirestoreRecord {
  DriverRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "cnic" field.
  String? _cnic;
  String get cnic => _cnic ?? '';
  bool hasCnic() => _cnic != null;

  // "driverExperience" field.
  String? _driverExperience;
  String get driverExperience => _driverExperience ?? '';
  bool hasDriverExperience() => _driverExperience != null;

  // "IsOnJob" field.
  bool? _isOnJob;
  bool get isOnJob => _isOnJob ?? false;
  bool hasIsOnJob() => _isOnJob != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "ratings" field.
  int? _ratings;
  int get ratings => _ratings ?? 0;
  bool hasRatings() => _ratings != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _cnic = snapshotData['cnic'] as String?;
    _driverExperience = snapshotData['driverExperience'] as String?;
    _isOnJob = snapshotData['IsOnJob'] as bool?;
    _password = snapshotData['password'] as String?;
    _ratings = castToType<int>(snapshotData['ratings']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('driver');

  static Stream<DriverRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DriverRecord.fromSnapshot(s));

  static Future<DriverRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DriverRecord.fromSnapshot(s));

  static DriverRecord fromSnapshot(DocumentSnapshot snapshot) => DriverRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DriverRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DriverRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DriverRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DriverRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDriverRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? cnic,
  String? driverExperience,
  bool? isOnJob,
  String? password,
  int? ratings,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'cnic': cnic,
      'driverExperience': driverExperience,
      'IsOnJob': isOnJob,
      'password': password,
      'ratings': ratings,
    }.withoutNulls,
  );

  return firestoreData;
}

class DriverRecordDocumentEquality implements Equality<DriverRecord> {
  const DriverRecordDocumentEquality();

  @override
  bool equals(DriverRecord? e1, DriverRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.cnic == e2?.cnic &&
        e1?.driverExperience == e2?.driverExperience &&
        e1?.isOnJob == e2?.isOnJob &&
        e1?.password == e2?.password &&
        e1?.ratings == e2?.ratings;
  }

  @override
  int hash(DriverRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.cnic,
        e?.driverExperience,
        e?.isOnJob,
        e?.password,
        e?.ratings
      ]);

  @override
  bool isValidKey(Object? o) => o is DriverRecord;
}
