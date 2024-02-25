import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LibrariesRecord extends FirestoreRecord {
  LibrariesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "lat" field.
  double? _lat;
  double get lat => _lat ?? 0.0;
  bool hasLat() => _lat != null;

  // "lng" field.
  double? _lng;
  double get lng => _lng ?? 0.0;
  bool hasLng() => _lng != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _address = snapshotData['address'] as String?;
    _phone = snapshotData['phone'] as String?;
    _email = snapshotData['email'] as String?;
    _lat = castToType<double>(snapshotData['lat']);
    _lng = castToType<double>(snapshotData['lng']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('libraries');

  static Stream<LibrariesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LibrariesRecord.fromSnapshot(s));

  static Future<LibrariesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LibrariesRecord.fromSnapshot(s));

  static LibrariesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LibrariesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LibrariesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LibrariesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LibrariesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LibrariesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLibrariesRecordData({
  String? name,
  String? address,
  String? phone,
  String? email,
  double? lat,
  double? lng,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
      'lat': lat,
      'lng': lng,
    }.withoutNulls,
  );

  return firestoreData;
}

class LibrariesRecordDocumentEquality implements Equality<LibrariesRecord> {
  const LibrariesRecordDocumentEquality();

  @override
  bool equals(LibrariesRecord? e1, LibrariesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.address == e2?.address &&
        e1?.phone == e2?.phone &&
        e1?.email == e2?.email &&
        e1?.lat == e2?.lat &&
        e1?.lng == e2?.lng;
  }

  @override
  int hash(LibrariesRecord? e) => const ListEquality()
      .hash([e?.name, e?.address, e?.phone, e?.email, e?.lat, e?.lng]);

  @override
  bool isValidKey(Object? o) => o is LibrariesRecord;
}
