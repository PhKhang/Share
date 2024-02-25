import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'genre_to_choose_model.dart';
export 'genre_to_choose_model.dart';

class GenreToChooseWidget extends StatefulWidget {
  const GenreToChooseWidget({
    super.key,
    required this.genre,
  });

  final String? genre;

  @override
  State<GenreToChooseWidget> createState() => _GenreToChooseWidgetState();
}

class _GenreToChooseWidgetState extends State<GenreToChooseWidget> {
  late GenreToChooseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GenreToChooseModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Theme(
            data: ThemeData(
              checkboxTheme: CheckboxThemeData(
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
            ),
            child: Checkbox(
              value: _model.checkboxValue ??= false,
              onChanged: (newValue) async {
                setState(() => _model.checkboxValue = newValue!);
              },
              activeColor: Color(0xFF685F12),
              checkColor: FlutterFlowTheme.of(context).info,
            ),
          ),
          Text(
            valueOrDefault<String>(
              widget.genre,
              '...',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium,
          ),
        ],
      ),
    );
  }
}
