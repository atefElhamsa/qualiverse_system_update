import 'package:qualiverse_system/features/dashboard/data/models/doc_model.dart';

abstract class DocumentsState {}

class DocumentsInitial extends DocumentsState {}

class DocumentsLoaded extends DocumentsState {
  DocumentsLoaded(this.docs);

  final List<Doc> docs;
}
