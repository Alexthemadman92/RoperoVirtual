import '/flutter_flow/flutter_flow_util.dart';
import 'olvidaste_tu_contrasena_widget.dart' show OlvidasteTuContrasenaWidget;
import 'package:flutter/material.dart';

class OlvidasteTuContrasenaModel
    extends FlutterFlowModel<OlvidasteTuContrasenaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
