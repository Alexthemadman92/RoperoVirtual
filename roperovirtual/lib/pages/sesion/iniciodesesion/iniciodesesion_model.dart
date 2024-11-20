import '/flutter_flow/flutter_flow_util.dart';
import 'iniciodesesion_widget.dart' show IniciodesesionWidget;
import 'package:flutter/material.dart';

class IniciodesesionModel extends FlutterFlowModel<IniciodesesionWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Zsd widget.
  FocusNode? zsdFocusNode;
  TextEditingController? zsdTextController;
  String? Function(BuildContext, String?)? zsdTextControllerValidator;
  // State field(s) for password-login widget.
  FocusNode? passwordLoginFocusNode;
  TextEditingController? passwordLoginTextController;
  late bool passwordLoginVisibility;
  String? Function(BuildContext, String?)? passwordLoginTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordLoginVisibility = false;
  }

  @override
  void dispose() {
    zsdFocusNode?.dispose();
    zsdTextController?.dispose();

    passwordLoginFocusNode?.dispose();
    passwordLoginTextController?.dispose();
  }
}
