import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'carga_de_prenda_widget.dart' show CargaDePrendaWidget;
import 'package:flutter/material.dart';

class CargaDePrendaModel extends FlutterFlowModel<CargaDePrendaWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TipoPrenda widget.
  String? tipoPrendaValue;
  FormFieldController<String>? tipoPrendaValueController;
  // State field(s) for Prenda widget.
  String? prendaValue;
  FormFieldController<String>? prendaValueController;
  // State field(s) for descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();
  }
}
