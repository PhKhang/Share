import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExchangeHelperRecord extends FirestoreRecord {
  ExchangeHelperRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "adding_date" field.
  DateTime? _addingDate;
  DateTime? get addingDate => _addingDate;
  bool hasAddingDate() => _addingDate != null;

  // "from" field.
  LatLng? _from;
  LatLng? get from => _from;
  bool hasFrom() => _from != null;

  // "to" field.
  LatLng? _to;
  LatLng? get to => _to;
  bool hasTo() => _to != null;

  // "book_id" field.
  String? _bookId;
  String get bookId => _bookId ?? '';
  bool hasBookId() => _bookId != null;

  // "book_ref" field.
  DocumentReference? _bookRef;
  DocumentReference? get bookRef => _bookRef;
  bool hasBookRef() => _bookRef != null;

  void _initializeFields() {
    _addingDate = snapshotData['adding_date'] as DateTime?;
    _from = snapshotData['from'] as LatLng?;
    _to = snapshotData['to'] as LatLng?;
    _bookId = snapshotData['book_id'] as String?;
    _bookRef = snapshotData['book_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('exchange_helper');

  static Stream<ExchangeHelperRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExchangeHelperRecord.fromSnapshot(s));

  static Future<ExchangeHelperRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExchangeHelperRecord.fromSnapshot(s));

  static ExchangeHelperRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExchangeHelperRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExchangeHelperRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExchangeHelperRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExchangeHelperRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExchangeHelperRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExchangeHelperRecordData({
  DateTime? addingDate,
  LatLng? from,
  LatLng? to,
  String? bookId,
  DocumentReference? bookRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'adding_date': addingDate,
      'from': from,
      'to': to,
      'book_id': bookId,
      'book_ref': bookRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExchangeHelperRecordDocumentEquality
    implements Equality<ExchangeHelperRecord> {
  const ExchangeHelperRecordDocumentEquality();

  @override
  bool equals(ExchangeHelperRecord? e1, ExchangeHelperRecord? e2) {
    return e1?.addingDate == e2?.addingDate &&
        e1?.from == e2?.from &&
        e1?.to == e2?.to &&
        e1?.bookId == e2?.bookId &&
        e1?.bookRef == e2?.bookRef;
  }

  @override
  int hash(ExchangeHelperRecord? e) => const ListEquality()
      .hash([e?.addingDate, e?.from, e?.to, e?.bookId, e?.bookRef]);

  @override
  bool isValidKey(Object? o) => o is ExchangeHelperRecord;
}
