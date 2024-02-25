import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostRecord extends FirestoreRecord {
  PostRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "book_title" field.
  String? _bookTitle;
  String get bookTitle => _bookTitle ?? '';
  bool hasBookTitle() => _bookTitle != null;

  // "book_ID" field.
  String? _bookID;
  String get bookID => _bookID ?? '';
  bool hasBookID() => _bookID != null;

  // "book_short_desc" field.
  String? _bookShortDesc;
  String get bookShortDesc => _bookShortDesc ?? '';
  bool hasBookShortDesc() => _bookShortDesc != null;

  // "book_long_desc" field.
  String? _bookLongDesc;
  String get bookLongDesc => _bookLongDesc ?? '';
  bool hasBookLongDesc() => _bookLongDesc != null;

  // "book_cover" field.
  String? _bookCover;
  String get bookCover => _bookCover ?? '';
  bool hasBookCover() => _bookCover != null;

  // "book_images" field.
  List<String>? _bookImages;
  List<String> get bookImages => _bookImages ?? const [];
  bool hasBookImages() => _bookImages != null;

  // "book_location" field.
  LatLng? _bookLocation;
  LatLng? get bookLocation => _bookLocation;
  bool hasBookLocation() => _bookLocation != null;

  // "user_ID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "author_name" field.
  String? _authorName;
  String get authorName => _authorName ?? '';
  bool hasAuthorName() => _authorName != null;

  // "post_id" field.
  String? _postId;
  String get postId => _postId ?? '';
  bool hasPostId() => _postId != null;

  // "date_updated" field.
  DateTime? _dateUpdated;
  DateTime? get dateUpdated => _dateUpdated;
  bool hasDateUpdated() => _dateUpdated != null;

  // "genres" field.
  List<String>? _genres;
  List<String> get genres => _genres ?? const [];
  bool hasGenres() => _genres != null;

  // "saved_by" field.
  List<DocumentReference>? _savedBy;
  List<DocumentReference> get savedBy => _savedBy ?? const [];
  bool hasSavedBy() => _savedBy != null;

  // "contact_by" field.
  String? _contactBy;
  String get contactBy => _contactBy ?? '';
  bool hasContactBy() => _contactBy != null;

  // "post_state" field.
  PostStates? _postState;
  PostStates? get postState => _postState;
  bool hasPostState() => _postState != null;

  void _initializeFields() {
    _bookTitle = snapshotData['book_title'] as String?;
    _bookID = snapshotData['book_ID'] as String?;
    _bookShortDesc = snapshotData['book_short_desc'] as String?;
    _bookLongDesc = snapshotData['book_long_desc'] as String?;
    _bookCover = snapshotData['book_cover'] as String?;
    _bookImages = getDataList(snapshotData['book_images']);
    _bookLocation = snapshotData['book_location'] as LatLng?;
    _userID = snapshotData['user_ID'] as String?;
    _authorName = snapshotData['author_name'] as String?;
    _postId = snapshotData['post_id'] as String?;
    _dateUpdated = snapshotData['date_updated'] as DateTime?;
    _genres = getDataList(snapshotData['genres']);
    _savedBy = getDataList(snapshotData['saved_by']);
    _contactBy = snapshotData['contact_by'] as String?;
    _postState = deserializeEnum<PostStates>(snapshotData['post_state']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('post');

  static Stream<PostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostRecord.fromSnapshot(s));

  static Future<PostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostRecord.fromSnapshot(s));

  static PostRecord fromSnapshot(DocumentSnapshot snapshot) => PostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostRecordData({
  String? bookTitle,
  String? bookID,
  String? bookShortDesc,
  String? bookLongDesc,
  String? bookCover,
  LatLng? bookLocation,
  String? userID,
  String? authorName,
  String? postId,
  DateTime? dateUpdated,
  String? contactBy,
  PostStates? postState,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'book_title': bookTitle,
      'book_ID': bookID,
      'book_short_desc': bookShortDesc,
      'book_long_desc': bookLongDesc,
      'book_cover': bookCover,
      'book_location': bookLocation,
      'user_ID': userID,
      'author_name': authorName,
      'post_id': postId,
      'date_updated': dateUpdated,
      'contact_by': contactBy,
      'post_state': postState,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostRecordDocumentEquality implements Equality<PostRecord> {
  const PostRecordDocumentEquality();

  @override
  bool equals(PostRecord? e1, PostRecord? e2) {
    const listEquality = ListEquality();
    return e1?.bookTitle == e2?.bookTitle &&
        e1?.bookID == e2?.bookID &&
        e1?.bookShortDesc == e2?.bookShortDesc &&
        e1?.bookLongDesc == e2?.bookLongDesc &&
        e1?.bookCover == e2?.bookCover &&
        listEquality.equals(e1?.bookImages, e2?.bookImages) &&
        e1?.bookLocation == e2?.bookLocation &&
        e1?.userID == e2?.userID &&
        e1?.authorName == e2?.authorName &&
        e1?.postId == e2?.postId &&
        e1?.dateUpdated == e2?.dateUpdated &&
        listEquality.equals(e1?.genres, e2?.genres) &&
        listEquality.equals(e1?.savedBy, e2?.savedBy) &&
        e1?.contactBy == e2?.contactBy &&
        e1?.postState == e2?.postState;
  }

  @override
  int hash(PostRecord? e) => const ListEquality().hash([
        e?.bookTitle,
        e?.bookID,
        e?.bookShortDesc,
        e?.bookLongDesc,
        e?.bookCover,
        e?.bookImages,
        e?.bookLocation,
        e?.userID,
        e?.authorName,
        e?.postId,
        e?.dateUpdated,
        e?.genres,
        e?.savedBy,
        e?.contactBy,
        e?.postState
      ]);

  @override
  bool isValidKey(Object? o) => o is PostRecord;
}
