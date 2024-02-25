import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/genre_to_choose/genre_to_choose_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import '/flutter_flow/custom_functions.dart' as functions;
import 'exchange_widget.dart' show ExchangeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExchangeModel extends FlutterFlowModel<ExchangeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for Input_Title widget.
  FocusNode? inputTitleFocusNode;
  TextEditingController? inputTitleController;
  String? Function(BuildContext, String?)? inputTitleControllerValidator;
  // State field(s) for Input_Description widget.
  FocusNode? inputDescriptionFocusNode;
  TextEditingController? inputDescriptionController;
  String? Function(BuildContext, String?)? inputDescriptionControllerValidator;
  // Model for Self_Help.
  late GenreToChooseModel selfHelpModel;
  // Model for Manga.
  late GenreToChooseModel mangaModel;
  // Model for Life.
  late GenreToChooseModel lifeModel;
  // Model for Novel.
  late GenreToChooseModel novelModel;
  // Model for Other.
  late GenreToChooseModel otherModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PostRecord? uploadedBook;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    selfHelpModel = createModel(context, () => GenreToChooseModel());
    mangaModel = createModel(context, () => GenreToChooseModel());
    lifeModel = createModel(context, () => GenreToChooseModel());
    novelModel = createModel(context, () => GenreToChooseModel());
    otherModel = createModel(context, () => GenreToChooseModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    inputTitleFocusNode?.dispose();
    inputTitleController?.dispose();

    inputDescriptionFocusNode?.dispose();
    inputDescriptionController?.dispose();

    selfHelpModel.dispose();
    mangaModel.dispose();
    lifeModel.dispose();
    novelModel.dispose();
    otherModel.dispose();
    textFieldFocusNode?.dispose();
    textController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
