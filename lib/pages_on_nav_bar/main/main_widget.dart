import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/book_card/book_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'main_model.dart';
export 'main_model.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({
    super.key,
    this.searchTerm,
  });

  final String? searchTerm;

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  late MainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Main'});
    _model.searchBarController ??= TextEditingController();
    _model.searchBarFocusNode ??= FocusNode();

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: _model.searchBarController,
                        focusNode: _model.searchBarFocusNode,
                        autofocus: true,
                        textInputAction: TextInputAction.search,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Search...',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          filled: true,
                          fillColor: Color(0xFFEDE8DA),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.searchBarControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Color(0xFFEDE8DA),
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: Color(0xFFEDE8DA),
                      icon: Icon(
                        Icons.search_sharp,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('MAIN_PAGE_SearchButton_ON_TAP');
                        // Search_For_Books
                        logFirebaseEvent('SearchButton_Search_For_Books');
                        await queryPostRecordOnce()
                            .then(
                              (records) => _model.simpleSearchResults =
                                  TextSearch(
                                records
                                    .map(
                                      (record) => TextSearchItem.fromTerms(
                                          record, [
                                        record.bookTitle!,
                                        record.authorName!
                                      ]),
                                    )
                                    .toList(),
                              )
                                      .search(_model.searchBarController.text)
                                      .map((r) => r.object)
                                      .toList(),
                            )
                            .onError((_, __) => _model.simpleSearchResults = [])
                            .whenComplete(() => setState(() {}));

                        logFirebaseEvent('SearchButton_update_page_state');
                        setState(() {
                          _model.sthHasBeenSearched = true;
                        });
                      },
                    ),
                    FlutterFlowIconButton(
                      borderColor: Color(0xFFEDE8DA),
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: Color(0xFFEDE8DA),
                      icon: Icon(
                        Icons.cancel,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('MAIN_PAGE_CancelButton_ON_TAP');
                        logFirebaseEvent(
                            'CancelButton_clear_text_fields_pin_codes');
                        setState(() {
                          _model.searchBarController?.clear();
                        });
                        logFirebaseEvent('CancelButton_update_page_state');
                        setState(() {
                          _model.sthHasBeenSearched = false;
                        });
                      },
                    ),
                  ].divide(SizedBox(width: 5.0)),
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (_model.sthHasBeenSearched) {
                      return Builder(
                        builder: (context) {
                          final bookSearched =
                              _model.simpleSearchResults.toList();
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(bookSearched.length,
                                  (bookSearchedIndex) {
                                final bookSearchedItem =
                                    bookSearched[bookSearchedIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MAIN_PAGE_Row_v8mzcp00_ON_TAP');
                                    logFirebaseEvent('Row_navigate_to');

                                    context.pushNamed(
                                      'Book_Info',
                                      queryParameters: {
                                        'postInfo': serializeParam(
                                          bookSearchedItem,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'postInfo': bookSearchedItem,
                                      },
                                    );
                                  },
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          elevation: 4.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              bookSearchedItem.bookCover,
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          bookSearchedItem.bookTitle,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ].divide(SizedBox(width: 5.0)),
                                    ),
                                  ),
                                );
                              }).divide(SizedBox(height: 10.0)),
                            ),
                          );
                        },
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 150.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: StreamBuilder<List<EventsRecord>>(
                                      stream: queryEventsRecord(
                                        limit: 5,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<EventsRecord> rowEventsRecordList =
                                            snapshot.data!;
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              rowEventsRecordList.length,
                                              (rowIndex) {
                                            final rowEventsRecord =
                                                rowEventsRecordList[rowIndex];
                                            return Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 4.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  rowEventsRecord.poster,
                                                  width: 300.0,
                                                  height: 200.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ),
                                  Flexible(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 4.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'MAIN_PAGE_Text_j5n103hc_ON_TAP');
                                            logFirebaseEvent(
                                                'Text_navigate_to');

                                            context.pushNamed('Events');
                                          },
                                          child: Text(
                                            'More events..',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 400.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment(0.0, 0),
                                    child: TabBar(
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                      unselectedLabelStyle: TextStyle(),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      padding: EdgeInsets.all(4.0),
                                      tabs: [
                                        Tab(
                                          text: 'For You',
                                        ),
                                        Tab(
                                          text: 'Newly Updated',
                                        ),
                                        Tab(
                                          text: 'Nearby',
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                      onTap: (i) async {
                                        [
                                          () async {},
                                          () async {},
                                          () async {}
                                        ][i]();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      children: [
                                        AuthUserStreamWidget(
                                          builder: (context) =>
                                              StreamBuilder<List<PostRecord>>(
                                            stream: queryPostRecord(
                                              queryBuilder: (postRecord) =>
                                                  postRecord.whereArrayContainsAny(
                                                      'genres',
                                                      (currentUserDocument
                                                              ?.preferredGenres
                                                              ?.toList() ??
                                                          [])),
                                              limit: 100,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<PostRecord>
                                                  swipeableStackPostRecordList =
                                                  snapshot.data!;
                                              return FlutterFlowSwipeableStack(
                                                onSwipeFn: (index) {},
                                                onLeftSwipe: (index) {},
                                                onRightSwipe: (index) {},
                                                onUpSwipe: (index) {},
                                                onDownSwipe: (index) {},
                                                itemBuilder: (context,
                                                    swipeableStackIndex) {
                                                  final swipeableStackPostRecord =
                                                      swipeableStackPostRecordList[
                                                          swipeableStackIndex];
                                                  return BookCardWidget(
                                                    key: Key(
                                                        'Keyalf_${swipeableStackIndex}_of_${swipeableStackPostRecordList.length}'),
                                                    bookInfo:
                                                        swipeableStackPostRecord,
                                                  );
                                                },
                                                itemCount:
                                                    swipeableStackPostRecordList
                                                        .length,
                                                controller: _model
                                                    .swipeableStackController1,
                                                loop: true,
                                                cardDisplayCount: 3,
                                                scale: 0.9,
                                                threshold: 0.5,
                                              );
                                            },
                                          ),
                                        ),
                                        StreamBuilder<List<PostRecord>>(
                                          stream: queryPostRecord(
                                            queryBuilder: (postRecord) =>
                                                postRecord.orderBy(
                                                    'date_updated',
                                                    descending: true),
                                            limit: 100,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<PostRecord>
                                                swipeableStackPostRecordList =
                                                snapshot.data!;
                                            return FlutterFlowSwipeableStack(
                                              onSwipeFn: (index) {},
                                              onLeftSwipe: (index) {},
                                              onRightSwipe: (index) {},
                                              onUpSwipe: (index) {},
                                              onDownSwipe: (index) {},
                                              itemBuilder: (context,
                                                  swipeableStackIndex) {
                                                final swipeableStackPostRecord =
                                                    swipeableStackPostRecordList[
                                                        swipeableStackIndex];
                                                return BookCardWidget(
                                                  key: Key(
                                                      'Keymrn_${swipeableStackIndex}_of_${swipeableStackPostRecordList.length}'),
                                                  bookInfo:
                                                      swipeableStackPostRecord,
                                                );
                                              },
                                              itemCount:
                                                  swipeableStackPostRecordList
                                                      .length,
                                              controller: _model
                                                  .swipeableStackController2,
                                              loop: true,
                                              cardDisplayCount: 3,
                                              scale: 0.9,
                                            );
                                          },
                                        ),
                                        FlutterFlowSwipeableStack(
                                          onSwipeFn: (index) {},
                                          onLeftSwipe: (index) {},
                                          onRightSwipe: (index) {},
                                          onUpSwipe: (index) {},
                                          onDownSwipe: (index) {},
                                          itemBuilder: (context, index) {
                                            return [
                                              () => Container(),
                                            ][index]();
                                          },
                                          itemCount: 1,
                                          controller:
                                              _model.swipeableStackController3,
                                          loop: true,
                                          cardDisplayCount: 3,
                                          scale: 0.9,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 5.0)),
                      );
                    }
                  },
                ),
              ),
            ].divide(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
