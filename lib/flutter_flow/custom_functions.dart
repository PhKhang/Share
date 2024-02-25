import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

bool isSavedByUser(
  List<DocumentReference> listSavedByUser,
  DocumentReference currentPost,
) {
  for (var i = 0; i < listSavedByUser.length; i++)
    if (currentPost == listSavedByUser[i]) return true;
  return false;
}

String generateShortDescription(String longDescription) {
  if (longDescription.length > 150) {
    String tmp = "";
    for (int i = 0; i < 150; i++) tmp += longDescription[i];
    longDescription = tmp + "..." + '\0';
  }
  return longDescription;
}
