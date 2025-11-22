import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sihkaro/domain/api/notebook/notebook.dart';
import 'package:sihkaro/domain/model/notebook/notebook.dart';

part 'notebook.g.dart';

@riverpod
Future<List<Notebook>> getUserNotebooks(Ref ref) async {
  return await GetIt.I<NotebookRestClient>().getUserNotebooks();
}
