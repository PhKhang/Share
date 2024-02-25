import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/book_card_copy/book_card_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_uploaded_posts_model.dart';
export 'all_uploaded_posts_model.dart';

class AllUploadedPostsWidget extends StatefulWidget {
  const AllUploadedPostsWidget({super.key});

  @override
  State<AllUploadedPostsWidget> createState() => _AllUploadedPostsWidgetState();
}

class _AllUploadedPostsWidgetState extends State<AllUploadedPostsWidget> {
  late AllUploadedPostsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllUploadedPostsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'allUploadedPosts'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<PostRecord>>(
            stream: queryPostRecord(
              queryBuilder: (postRecord) => postRecord.where(
                'user_ID',
                isEqualTo: currentUserUid,
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<PostRecord> columnPostRecordList = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children:
                      List.generate(columnPostRecordList.length, (columnIndex) {
                    final columnPostRecord = columnPostRecordList[columnIndex];
                    return BookCardCopyWidget(
                      key: Key(
                          'Keytvc_${columnIndex}_of_${columnPostRecordList.length}'),
                      bookInfo: columnPostRecord,
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
